package com.jh.tripleb.classInfo.model.vo;


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
public class ClassInfo {
	
	private int classNo;		// 수업번호
	private int classCount;		// 수강생수 주희 : null로 되어 있는데 필수 입력 사항인 듯 하여 우선 int로 해두었습니다 아리송..
	private Date classStDate;	// 수업 시작일
	private Date classEndDate;	// 수업 종료일
	private String classStatus;	// 수업 상태 (Y:승인 R:반려  N:미승인)
	private int trainerNo;		// 트레이너 번호
	private int productNo;		// 상품권 번호
	private String className;	// 수업 이름
	private String times;		// 주 2회, 3회
	private int classMaxCount;	// 최대 수강생수
	private String classContent;// 수업 내용
	private String weekDay;		// 주중, 주말
	
	private String trainerName; // 수업 강사명
	private String confirmerName; // 결재자이름

}
