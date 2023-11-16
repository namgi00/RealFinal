package org.dawin.service;

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
	public List<DonateVO> getDonateSelectList() {
		return mapper.getDonateSelectList();
	}

	@Override
	public List<DonateVO> getDonateMyList() {
		return mapper.getDonateMyList();
	}

	@Override
	public List<DonateVO> getDonateAmountList() {
		return mapper.getDonateAmountList();
	}
	
	
}
