package org.dawin.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ExchangeDataVO {
	   String cur_unit;
	   String ttb;
	   String tts;
	   String cur_nm;
	    
	}