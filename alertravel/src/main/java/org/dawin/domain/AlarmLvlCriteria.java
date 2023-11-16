package org.dawin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class AlarmLvlCriteria {

	private int alarmLvl;
	
	public AlarmLvlCriteria() {
		this.alarmLvl = 1;
	}

	public AlarmLvlCriteria(int alarmLvl) {
		this.alarmLvl = alarmLvl;
	}
}
