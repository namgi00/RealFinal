package org.dawin.security;

import org.dawin.domain.MemberVO;
import org.dawin.mapper.MemberMapper;
import org.dawin.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("=== 로그인한 사용자: " + username + " ===");
		
		MemberVO vo = mapper.read(username);
		if(vo == null) {
			throw new UsernameNotFoundException(username + "은(는) 없는 id입니다.");
		}
		
		log.warn("user vo: " + vo);
		
		return new CustomUser(vo);
	}
}
