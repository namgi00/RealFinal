package org.dawin.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonateVO {
	@NotBlank(message = "이름은 필수항목입니다.")
	@Size(min = 2, message = "이름는 2글자 이상이어야 합니다.")
	private String donateName;
	
	@NotBlank(message = "생년월일은 필수항목입니다.")
	@Size(min = 4, message = "생년월일은 6글자 이어야 합니다.")
	private int donateBirthday;
	
	@NotBlank(message = "휴대폰 번호는 필수항목입니다.")
	@Size(min = 4, message = "휴대폰 번호는 11글자 이어야 합니다.")
	private String donatePhoneNumber;
	
	@NotBlank(message = "이메일은 필수항목입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String donateEmail;
	
	private String donateSelect;
	private String donateDescription;
	
	private int donateMoney;
	private String donateOption;
	
	private String donateMessage;
	
	private int merchant_uid;
}
