package org.dawin.domain;

import java.util.Date;

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
	@NotBlank(message = "성명은 필수항목입니다.")
	@Size(min = 2, message = "성명은 2글자 이상이어야 합니다.")
	private String donateName;
	
	@NotBlank(message = "생년월일은 필수항목입니다.")
	@Size(min = 6, max = 6, message = "생년월일은 6자리여야 합니다.")
	private String donateBirthday;
	
	@NotBlank(message = "휴대폰 번호는 필수항목입니다.")
	@Size(min = 11, max = 11, message = "휴대폰 번호는 11글자여야 합니다.")
	private String donatePhoneNumber;
	
	@NotBlank(message = "이메일은 필수항목입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String donateEmail;
	
	private String donateSelect;
	private String donateDescription;
	
	private int donateMoney;
	private String donateOption;
	
	private String donateMessage;
	
	private Date donateDate;
	
	private String donatePayment;
	
	private int donateTotalPeople;
	private int donateTotalMoney;
	
	private int sumDonateMoney;
}