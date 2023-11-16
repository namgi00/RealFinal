package org.dawin.service;

import java.util.List;

import org.dawin.domain.DonateVO;

public interface DonateService {
	
	public List<DonateVO> getDonateMyList();
	
	public List<DonateVO> getDonateAmountList();
	
	public List<DonateVO> getDonateSelectList();
	
}
