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
@ToString
public class TemplateInfo {
	
	private int templateItemNo;				// 서비스 항목 번호
	private int templateParentItemNo;		// 상위 서비스 항목 번호
	private String templateItemName;		// 서비스항목 이름
	private String templateItemDescription; // 서비스항목 설명
	private int templateItemPrice;			// 서비스항목 가격
	private String templateParentName;		// 상위 서비스 항목 이름
	private String templateIcon;			// 서비스 항목 아이콘
	private String templateLinkpage;		// 미리보기시 연결할 페이지		

}
