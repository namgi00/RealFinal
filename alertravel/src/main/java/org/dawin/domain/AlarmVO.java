package org.dawin.domain;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AlarmVO {

	   private int alarmLvl;
	   private String continentCd;
	   private String continentEngNm;
	   private String continentNm;
	   private String countryEngNm;
	   private String countryIsoAlp2;
	   private String countryNm;
	   private String dangMapDownloadUrl;
	   private String flagDownloadUrl;
	   private String mapDownloadUrl;
	   private String regionTy;
	   private String remark;
	   private Date writtenDt;
	
}
