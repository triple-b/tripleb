package com.jh.tripleb.mcManagement.model.vo;

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
public class McManagement {
	
	private int machineNo;			// 기구번호
	private Date machineRegistDate;	// 기구등록일
	private String machineStatus;	// 기구상태 (Y:사용가능 N:고장)
	private String machineDel;		// 기구 삭제여부	(Y:유지 N:삭제)
	private int mcNo;				// 기구종류번호

}
