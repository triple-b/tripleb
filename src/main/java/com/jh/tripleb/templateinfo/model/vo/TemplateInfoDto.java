package com.jh.tripleb.templateinfo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString()
public class TemplateInfoDto {

	private String itemType;
	private String itemName;
	private String itemLink;
	private String itemIcon;
	private String childInfo;		// itemLink@itemName^itemLink@itemName
}
