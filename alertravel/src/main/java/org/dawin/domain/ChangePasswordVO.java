package org.dawin.domain;


import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChangePasswordVO {

	private String username;

	@NotBlank(message="필수항목입니다.")
	private String orgPassword;
	
	@NotBlank(message="필수항목입니다.")
	private String newPassword;
	
	@NotBlank(message="필수항목입니다.")
	private String newPassword2;
	
	private String encPassword;
	
	
}
