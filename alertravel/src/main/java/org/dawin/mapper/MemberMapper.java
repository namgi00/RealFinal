package org.dawin.mapper;

import org.dawin.domain.AuthVO;
import org.dawin.domain.ChangePasswordVO;
import org.dawin.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String username);

	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);

	public void changePassword(ChangePasswordVO member);
}
