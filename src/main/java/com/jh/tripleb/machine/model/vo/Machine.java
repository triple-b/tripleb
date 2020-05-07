package com.jh.tripleb.machine.model.vo;


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
	private String mcThumbnail;	// 기구썸네일

}
