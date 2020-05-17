package com.jh.tripleb.mcAllCheck.model.vo;

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
public class mcAllCheck {
	
	private int machinAllChkNo;				// 기구점검번호
	private String machineTitle;			// 점검제목
	private Date machineChkDate;			// 점검일
	private int trainerNo;					// 트레이너번호
	private String trainerName;				// 트레이너이름

}
