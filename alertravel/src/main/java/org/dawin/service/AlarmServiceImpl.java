package org.dawin.service;

import java.util.List;

import org.dawin.domain.AlarmVO;
import org.dawin.mapper.AlarmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmMapper mapper;

	@Override
	public List<AlarmVO> getList() {

		log.info("getList....");

		return mapper.getList();
	}

	@Override
	public AlarmVO get(String countryNm) {
		
		log.info("get...." + countryNm);
		
		return mapper.read(countryNm);
	}

	@Override
	public List<AlarmVO> getListLvl(Long alarmLvl) {
		
		return mapper.getListLvl(alarmLvl);
	}
	
	@Override
	public AlarmVO getBasic(String countryNm) {
		
		
		return mapper.getBasic(countryNm);
	}

}
