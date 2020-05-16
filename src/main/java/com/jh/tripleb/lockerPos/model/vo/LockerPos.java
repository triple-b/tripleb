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
	
	private int lockerPosNo;			// 락커룸번호
	private String lockerPosType;		// 락커룸 타입
	
	private String lockerPosStatus;		// 락커룸 상태  (N=고장 M=만기 Y=사용 X=미사용)
	private String lockerPosDelet;		// 락커룸 삭제  (Y:유지 N:삭제)

}
