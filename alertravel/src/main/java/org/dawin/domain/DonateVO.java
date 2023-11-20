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
	private String donateName;
	
	private Integer donateBirthday;
	
	private String donatePhoneNumber;
	
	private String donateEmail;
	
	private String donateSelect;
	private String donateDescription;
	
	private int donateMoney;
	private String donateOption;
	
	private String donateMessage;
	
	private int merchant_uid;
}
