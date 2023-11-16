package org.dawin.service;

import java.io.IOException;

import org.dawin.domain.AuthVO;
import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;
import org.dawin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
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
		
		if(!pwEncoder.matches(vo.getOrgPassword(), member.getPassword()) ) {
			// 비밀번호 오류
			return false;
		}
		
		String encPassword = pwEncoder.encode(vo.getNewPassword());
		vo.setEncPassword(encPassword);
		mapper.changePassword(vo);
		
		return true;
	}
}
