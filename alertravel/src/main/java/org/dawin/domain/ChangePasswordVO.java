package org.dawin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChangePasswordVO {
	private String username;

	public String setEncPassword(String encPassword) {
		return null;
	}

	public String getNewPassword() {
		return null;
	}
	
	public String getNewPassword2() {
		return null;
	}

	public String getOrgPassword() {
		return null;
	}

	
	
}
