package org.dawin.mapper;

import java.util.List;


import org.dawin.domain.AlarmLvlCriteria;
import org.dawin.domain.AlarmVO;

public interface AlarmMapper {

	public List<AlarmVO> getList();

	public List<AlarmVO> getListLvl(Long alarmLvl);
	
	public AlarmVO read(String countryNm);
	
	public AlarmVO getBasic(String countryNm);
	
}
