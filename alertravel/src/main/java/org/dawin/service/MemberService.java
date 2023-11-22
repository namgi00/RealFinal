package org.dawin.service;

import java.io.IOException;
import java.util.HashMap;

import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String username);
	
	public void register(MemberVO member) throws IOException;
	
	public boolean changePassword(ChangePasswordVO vo);
	
	public String getAccessToken (String authorize_code);
	
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	public int hasUsername(String username);
}
