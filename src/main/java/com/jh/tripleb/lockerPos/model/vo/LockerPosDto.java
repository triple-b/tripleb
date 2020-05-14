package com.jh.tripleb.lockerPos.model.vo;

import java.sql.Date;

public class LockerPosDto {
	
	private int lockerPosNo;			// 락커룸번호
	private String lockerPosType;		// 락커룸이름
	private String lockerPosStatus;		// 락커룸 상태  (N=고장 M=만기 Y=사용 X=미사용)
	private String lockerPosDelet;		// 락커룸 삭제  (Y:유지 N:삭제)
	private int lockerNo;			// 락커 번호
	private Date lockerStartDate;	// 락커 시작일
	private Date lockerEndDate;		// 락커 종료일
	private Date lockerRegistDate;	// 락커등록일
	private String lockerStatus;	// 락커 상태 (Y:사용중,R:회수)
	private int memberNo;			// 회원번호
	
	public LockerPosDto() {
		
	}

	public int getLockerPosNo() {
		return lockerPosNo;
	}

	public void setLockerPosNo(int lockerPosNo) {
		this.lockerPosNo = lockerPosNo;
	}

	public String getLockerPosType() {
		return lockerPosType;
	}

	public void setLockerPosType(String lockerPosType) {
		this.lockerPosType = lockerPosType;
	}

	public String getLockerPosStatus() {
		return lockerPosStatus;
	}

	public void setLockerPosStatus(String lockerPosStatus) {
		this.lockerPosStatus = lockerPosStatus;
	}

	public String getLockerPosDelet() {
		return lockerPosDelet;
	}

	public void setLockerPosDelet(String lockerPosDelet) {
		this.lockerPosDelet = lockerPosDelet;
	}

	public int getLockerNo() {
		return lockerNo;
	}

	public void setLockerNo(int lockerNo) {
		this.lockerNo = lockerNo;
	}

	public Date getLockerStartDate() {
		return lockerStartDate;
	}

	public void setLockerStartDate(Date lockerStartDate) {
		this.lockerStartDate = lockerStartDate;
	}

	public Date getLockerEndDate() {
		return lockerEndDate;
	}

	public void setLockerEndDate(Date lockerEndDate) {
		this.lockerEndDate = lockerEndDate;
	}

	public Date getLockerRegistDate() {
		return lockerRegistDate;
	}

	public void setLockerRegistDate(Date lockerRegistDate) {
		this.lockerRegistDate = lockerRegistDate;
	}

	public String getLockerStatus() {
		return lockerStatus;
	}

	public void setLockerStatus(String lockerStatus) {
		this.lockerStatus = lockerStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "LockerPosDto [lockerPosNo=" + lockerPosNo + ", lockerPosType=" + lockerPosType + ", lockerPosStatus="
				+ lockerPosStatus + ", lockerPosDelet=" + lockerPosDelet + ", lockerNo=" + lockerNo
				+ ", lockerStartDate=" + lockerStartDate + ", lockerEndDate=" + lockerEndDate + ", lockerRegistDate="
				+ lockerRegistDate + ", lockerStatus=" + lockerStatus + ", memberNo=" + memberNo + "]";
	}

	public LockerPosDto(int lockerPosNo, String lockerPosType, String lockerPosStatus, String lockerPosDelet,
			int lockerNo, Date lockerStartDate, Date lockerEndDate, Date lockerRegistDate, String lockerStatus,
			int memberNo) {
		super();
		this.lockerPosNo = lockerPosNo;
		this.lockerPosType = lockerPosType;
		this.lockerPosStatus = lockerPosStatus;
		this.lockerPosDelet = lockerPosDelet;
		this.lockerNo = lockerNo;
		this.lockerStartDate = lockerStartDate;
		this.lockerEndDate = lockerEndDate;
		this.lockerRegistDate = lockerRegistDate;
		this.lockerStatus = lockerStatus;
		this.memberNo = memberNo;
	}
}
