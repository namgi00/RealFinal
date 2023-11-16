package org.dawin.service;

import java.io.IOException;

import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;

public interface MemberService {
	public MemberVO get(String username);
	
	public void register(MemberVO member) throws IOException;
	
	public boolean changePassword(ChangePasswordVO vo);
}
