package com.jh.tripleb.student.model.vo;

import java.sql.Date;

public class StudentDtoJ {

	private int memberNo;				// 회원번호
	private String memberName;			// 회원명
	private String memberBirth;			// 회원 생년월일
	private String memberGender;		// 회원 성별
	private String memberPhone;			// 회원 휴대폰
	private String blackListStatus;		// 블랙리스트 여부
	private Date memberEnrollDate;		// 회원 등록일
	private String className;			// 수업명
	private String memberTrainer;		// 강사명
	private Date memProductStart;		// 회원권 시작일
	private Date memProductEnd;
	
	public StudentDtoJ() {
		
	}
	
	public StudentDtoJ(int memberNo, String memberName, String memberBirth, String memberGender, String memberPhone,
			String blackListStatus, Date memberEnrollDate, String className, String memberTrainer, Date memProductStart,
			Date memProductEnd) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.blackListStatus = blackListStatus;
		this.memberEnrollDate = memberEnrollDate;
		this.className = className;
		this.memberTrainer = memberTrainer;
		this.memProductStart = memProductStart;
		this.memProductEnd = memProductEnd;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getBlackListStatus() {
		return blackListStatus;
	}

	public void setBlackListStatus(String blackListStatus) {
		this.blackListStatus = blackListStatus;
	}

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMemberTrainer() {
		return memberTrainer;
	}

	public void setMemberTrainer(String memberTrainer) {
		this.memberTrainer = memberTrainer;
	}

	public Date getMemProductStart() {
		return memProductStart;
	}

	public void setMemProductStart(Date memProductStart) {
		this.memProductStart = memProductStart;
	}

	public Date getMemProductEnd() {
		return memProductEnd;
	}

	public void setMemProductEnd(Date memProductEnd) {
		this.memProductEnd = memProductEnd;
	}

	@Override
	public String toString() {
		return "StudentDtoJ [memberNo=" + memberNo + ", memberName=" + memberName + ", memberBirth=" + memberBirth
				+ ", memberGender=" + memberGender + ", memberPhone=" + memberPhone + ", blackListStatus="
				+ blackListStatus + ", memberEnrollDate=" + memberEnrollDate + ", className=" + className
				+ ", memberTrainer=" + memberTrainer + ", memProductStart=" + memProductStart + ", memProductEnd="
				+ memProductEnd + "]";
	}
	
	
}
