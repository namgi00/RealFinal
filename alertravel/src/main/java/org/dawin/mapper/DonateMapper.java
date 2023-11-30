package org.dawin.mapper;

import java.util.List;

import org.dawin.domain.DonateVO;

public interface DonateMapper {

	public List<DonateVO> getDonateMyList(String donateName, String donatePhoneNumber, String donateBirthday);
	
	public List<DonateVO> getDonateAmountList();
	public List<DonateVO> getDonateSelectList();
	
	public void insertDonate(DonateVO donate);
	
	public int getDonateTotalMoney();
	public int getDonateTotalPeople();
	
	public List<DonateVO> getDonateOptionTotalList();
}
