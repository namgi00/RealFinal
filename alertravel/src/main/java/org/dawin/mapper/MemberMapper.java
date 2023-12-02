package org.dawin.mapper;

import java.util.List;

import org.dawin.domain.AuthVO;
import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String username);
	
	public List<AuthVO> authRead();

	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);

	public void changePassword(ChangePasswordVO member);
	
	public void kakaoInsert(MemberVO member);
	
	public int hasUsername(String username);
}
