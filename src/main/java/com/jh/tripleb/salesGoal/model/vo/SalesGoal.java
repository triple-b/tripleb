package com.jh.tripleb.salesGoal.model.vo;

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
public class SalesGoal {
	
	private int month;		// 월
	private int salesPrice;	// 목표액

}
