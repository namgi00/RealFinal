package org.dawin.service;

import java.io.IOException;
import java.util.List;

import org.dawin.domain.CurrentDateVO;
import org.dawin.domain.ExchangeDataVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ExchangeServiceImpl implements ExchangeService {
	@Override
	public List<ExchangeDataVO> exchangeData() {
		// TODO Auto-generated method stub
		CurrentDateVO currentDate = new CurrentDateVO();
		String regDate = currentDate.getFormattedDay(); // "20231109";
		String url = String.format(
				"https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=o9IwTCUcKzQClB6Qvshx1bHcpigVxVAY&searchdate="
						+ regDate + "&data=AP01");
		ResponseEntity<String> responseEntity = requestApi(url);

		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY);

		List<ExchangeDataVO> lists = null;
		try {
			lists = objectMapper.readValue(responseEntity.getBody(), new TypeReference<List<ExchangeDataVO>>() {
			});

		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lists;
	}
	
	public static ResponseEntity requestApi(String url) {

		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(null);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, tokenRequest, String.class);
		return responseEntity;
	}

}