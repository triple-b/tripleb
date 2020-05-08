package com.jh.tripleb.machine.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Machine {
	
	private int mcNo;			// 기구종류번호
	private String mcName;		// 기구명
	private String mcExplain;	// 기구 설명
	private String thumbnail;	// 기구썸네일
	private String mcStatus;    // 기구상태
	private Date mcDate;		// 기구 등록날짜
	private String thumbChange;	// 기구썸네일수정

}
