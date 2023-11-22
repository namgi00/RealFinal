package org.dawin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.validation.Valid;

import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;
import org.dawin.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import retrofit2.http.HTTP;

@Log4j
@RequestMapping("/security")
@Controller
public class SecurityController {

	@Autowired
	MemberService service;

	@Autowired
	UserDetailsService user;

	@Autowired
	private PasswordEncoder pwEncoder;

	@Autowired
	private AuthenticationManager authenticationManager;

	final static String PASSWORD = "wlwhs1234";

	@GetMapping("/login")
	public void login() {
		log.info("=== login page 접속 중 ===");
	}

	@GetMapping("/signup")
	public void signup(@ModelAttribute("member") MemberVO member) {
		log.info("=== signup page 접속 중 ===");
	}

	@PostMapping("/signup")
	public String signup(@Valid @ModelAttribute("member") MemberVO member, Errors errors) throws IOException {

		if (!member.getPassword().equals(member.getPassword2())) {
			errors.rejectValue("password2", "비밀번호 불일치", "비밀번호 확인이 일치하지 않습니다.");
		}

		if (!errors.hasFieldErrors("username")) {
			if (service.get(member.getUsername()) != null) {
				errors.rejectValue("username", "아이디 중복", "이미 사용중인 아이디입니다.");
			}
		}

		if (errors.hasFieldErrors()) {
			return "security/signup";
		}

		service.register(member);

		return "redirect:/";
	}

	@GetMapping("/profile")
	public void profile() {

	}

	@GetMapping("/change_password")
	public void getChangePassword(ChangePasswordVO vo) {
		log.info("=== change_passoword page 접속 중 ===");
	}

	@PostMapping("/change_password")
	public String postChangePassword(@Valid ChangePasswordVO vo, Errors errors) {

		// 비밀번호, 확인 일치 여부
		if (!vo.getNewPassword().equals(vo.getNewPassword2())) {
			// 에러 추가
			errors.rejectValue("newPassword2", "비밀번호가 일치하지 않습니다.", "비밀번호 확인이 일치하지 않습니다.");
		}

		if (!service.changePassword(vo)) {
			errors.rejectValue("orgPassword", "이전 비밀번호가 일치하지 않습니다.", "이전 비밀번호 확인이 일치하지 않습니다.");
		}

		if (errors.hasErrors()) {
			return "security/signup";
		}

		return "redirect:/security/profile";
	}

	@GetMapping("/kakao")
	public String kakaoLogin(@RequestParam("code") String code) throws IOException {

		log.info("#####" + code);

		String access_Token = service.getAccessToken(code);
		log.info("###access_Token### : " + access_Token);

		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		log.info("###access_Token#### : " + access_Token);
		log.info("###nickname#### : " + userInfo.get("nickname"));

		// 카카오에서 받아온 nickname을 username으로 저장한다.

		MemberVO member = new MemberVO();

		member.setUsername((String) userInfo.get("nickname"));
		member.setPassword(PASSWORD);
		String username = member.getUsername();

		if (service.hasUsername(username) != 1) {
			
			service.register(member);
			log.info("등록 중입니다 (if문 안에).");
		}

		log.info("등록 중입니다 (if문 바깥에)" + member.getUsername() + PASSWORD);

		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
				member.getUsername(), PASSWORD);

		log.info("토큰에 담는 중입니다.");

		Authentication authentication = authenticationManager.authenticate(authenticationToken);

		log.info("인증 하는 중입니다" + authentication);

		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";

	}

}
