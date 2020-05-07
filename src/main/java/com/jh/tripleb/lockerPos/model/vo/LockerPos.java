package com.jh.tripleb.lockerPos.model.vo;

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
public class LockerPos {
	
	private String lockerPosName;		// 락커룸이름
	private String lockerPosQuantity;	// 락커룸 내부 개수
	private String lockerPosStatus;		// 락커룸 상태 (Y:유지 N:삭제)

}
