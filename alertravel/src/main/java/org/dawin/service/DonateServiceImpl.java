package org.dawin.service;

import java.io.IOException;
import java.util.List;

import org.dawin.domain.DonateVO;
import org.dawin.mapper.DonateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DonateServiceImpl implements DonateService {
	
	@Autowired
	DonateMapper mapper;

	@Override
	public List<DonateVO> getDonateMyList(DonateVO donate) {
	    return mapper.getDonateMyList(donate.getDonateName(), donate.getDonatePhoneNumber(), donate.getDonateBirthday());
	}

	
	@Override
	public List<DonateVO> getDonateSelectList() {
		return mapper.getDonateSelectList();
	}

	@Override
	public List<DonateVO> getDonateAmountList() {
		return mapper.getDonateAmountList();
	}

	@Override
	public void donateRegister(DonateVO donate) throws IOException {
		mapper.insertDonate(donate);
	}

	@Override
	public int getDonateTotalMoney() {
		return mapper.getDonateTotalMoney();
	}

	@Override
	public int getDonateTotalPeople() {
		return mapper.getDonateTotalPeople();
	}

	@Override
	public List<DonateVO> getDonateOptionTotalList() {
		return mapper.getDonateOptionTotalList();
	}

}
