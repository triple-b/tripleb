package com.jh.tripleb.equipment.model.vo;

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
public class Equipment {
	
	private int equipmentNo;			// 비품번호
	private String equipmentName;		// 비품명
	private int equipmentStock;			// 총재고
	private Date equipmentRegistDate;	// 등록일
	private String equipmentStatus;		// 비품 상태 (Y:유지 N:삭제)

}
