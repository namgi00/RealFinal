package org.dawin.service;

import java.io.IOException;
import java.util.List;

import org.dawin.domain.DonateVO;

public interface DonateService {
	
	public List<DonateVO> getDonateMyList();
	
	public List<DonateVO> getDonateAmountList();
	
	public List<DonateVO> getDonateSelectList();
	
	public void donateRegister(DonateVO donate) throws IOException;
	
}
