package org.dawin.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.dawin.domain.AuthVO;
import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;
import org.dawin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	@Override
	public MemberVO get(String username) {
		return mapper.read(username);
	}

	@Override
	public void register(MemberVO member) throws IOException {

		String encPassword = pwEncoder.encode(member.getPassword());
		member.setPassword(encPassword);
		mapper.insert(member);

		AuthVO auth = new AuthVO(member.getUsername(), "ROLE_USER");

		mapper.insertAuth(auth);
	}

	@Override
	public boolean changePassword(ChangePasswordVO vo) {
		MemberVO member = mapper.read(vo.getUsername());

		if (!pwEncoder.matches(vo.getOrgPassword(), member.getPassword())) {
			// 비밀번호 오류
			return false;
		}

		String encPassword = pwEncoder.encode(vo.getNewPassword());
		vo.setEncPassword(encPassword);
		mapper.changePassword(vo);

		return true;
	}

	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=d1d68ccbc76688be2f03c65d1ea07a31"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/security/kakao"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			log.info("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			log.info("access_token : " + access_Token);
			log.info("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			userInfo.put("nickname", nickname);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public int hasUsername(String username) {
		return mapper.hasUsername(username);
	}
}
