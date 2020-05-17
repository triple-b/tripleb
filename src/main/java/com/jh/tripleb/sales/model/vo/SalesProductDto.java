package com.jh.tripleb.sales.model.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SalesProductDto {
	private String productName;
	private String trainerNick; 
	private String trainerName;  
	private int payPrice;
}
