package com.jh.tripleb.suggestions.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Suggestions {
	
	private int sugNo;
	private String sugTitle;
	private String sugContent;
	private Date sugDate;
	private int trainerNo;
	

}
