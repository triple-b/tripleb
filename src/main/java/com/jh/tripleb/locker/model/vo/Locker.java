package com.jh.tripleb.locker.model.vo;


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
public class Locker {
	
	private int lockerNo;			// 락커 번호
	private String lockerName;		// 락커룸 이름
	private Date lockerStartDate;	// 락커 시작일
	private Date lockerEndDate;		// 락커 종료일
	private Date lockerRegistDate;	// 락커등록일
	private String lockerStatus;	// 락커 상태 ( N:고장 M:만기 Y:사용 X:미사용)
	private int memberNo;			// 회원번호

}
