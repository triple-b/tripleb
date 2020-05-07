package com.jh.tripleb.equipCheck.model.vo;

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
public class EquipCheck {
	
	private int eqCheckNo;		// 비품관리번호
	private String broken;		// 파손수
	private String lost;		// 분실수
	private Date mtDate;		// 비품 점검일
	private int equipmentNo;	// 비품번호
	private int trainerNo;		// 트레이너번호

}
