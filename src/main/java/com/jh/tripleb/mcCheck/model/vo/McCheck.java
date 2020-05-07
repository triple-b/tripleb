package com.jh.tripleb.mcCheck.model.vo;


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
public class McCheck {
	
	private int machineChkNo;			// 기구점검번호
	private String machineChkContent;	// 기구점검내용
	private int machineNo;				// 기구번호
	private int trainerNo;				// 트레이너번호
}
