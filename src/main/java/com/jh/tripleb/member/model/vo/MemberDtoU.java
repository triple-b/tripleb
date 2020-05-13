package com.jh.tripleb.member.model.vo;

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
public class MemberDtoU {
	
	private int memberNo;				// 회원번호
	private String memberName;			// 회원이름
	private String memberGender;		// 회원 성별
	private String memberEmail;			// 회원 이메일
	private String memberPhone;			// 회원 핸드폰 번호
	private String memberAddress;		// 회원 주소
	private String memberHeight;		// 키
	private String memberWeight;		// 몸무게
	private String memberImage;			// 회원 프로필 이미지
	private Date memberEnrollDate;		// 회원등록일
	private String memberNote;			// 회원 특이사항
	private String blacklistStatus;		// 블랙리스트 여부
	private Date blacklistEnrollDate;	// 블랙리스트 등록일
	private String blacklistContent;	// 블랙리스트 사유
	private String memberStatus;		// 회원 상태 (N:유지 Y:탈퇴 P:일시정지)
	private String memberTrainer;		// 담당 트레이너
	private String memberBirth;			// 회원 생년월일
	private Date pauseStart;			// 일시정지 시작일
	private Date pauseEnd;			// 일시정지 종료일
	private String productName;			// 회원 보유 상품명
	private Date memProductStart;		// 회원권 시작일
	private Date memProductEnd;			// 회원권 종료일
	private int lockerNo;				// 락커 번호
	
	private int pauseDate;				// 일시정지 일자
	private Date pauseCancelDate;		// 일시정지 해제 시작일
	

/*	
	public MemberDtoU() {}


	
	// 회원 전체 조회
	public MemberDtoU(int memberNo, String memberName, String memberGender, String memberPhone, Date memberEnrollDate,
			String memberTrainer, String productName, Date memProductStart, Date memProductEnd) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.memberEnrollDate = memberEnrollDate;
		this.memberTrainer = memberTrainer;
		this.productName = productName;
		this.memProductStart = memProductStart;
		this.memProductEnd = memProductEnd;
	}
		

	// 회원 상세 조회
	public MemberDtoU(int memberNo, String memberName, String memberGender, String memberEmail, String memberPhone,
			String memberAddress, String memberHeight, String memberWeight, String memberImage, Date memberEnrollDate,
			String memberNote, String memberTrainer, String memberBirth, String pauseStart, String pauseEnd,
			String productName, Date memProductStart, Date memProductEnd, int lockerNo) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberHeight = memberHeight;
		this.memberWeight = memberWeight;
		this.memberImage = memberImage;
		this.memberEnrollDate = memberEnrollDate;
		this.memberNote = memberNote;
		this.memberTrainer = memberTrainer;
		this.memberBirth = memberBirth;
		this.pauseStart = pauseStart;
		this.pauseEnd = pauseEnd;
		this.productName = productName;
		this.memProductStart = memProductStart;
		this.memProductEnd = memProductEnd;
		this.lockerNo = lockerNo;
	}
	

	public MemberDtoU(int memberNo, String memberName, String memberGender, String memberEmail, String memberPhone,
			String memberAddress, String memberHeight, String memberWeight, String memberImage, Date memberEnrollDate,
			String memberNote, String blacklistStatus, Date blacklistEnrollDate, String blacklistContent,
			String memberStatus, String memberTrainer, String memberBirth, String pauseStart, String pauseEnd,
			String productName, Date memProductStart, Date memProductEnd, int lockerNo) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberHeight = memberHeight;
		this.memberWeight = memberWeight;
		this.memberImage = memberImage;
		this.memberEnrollDate = memberEnrollDate;
		this.memberNote = memberNote;
		this.blacklistStatus = blacklistStatus;
		this.blacklistEnrollDate = blacklistEnrollDate;
		this.blacklistContent = blacklistContent;
		this.memberStatus = memberStatus;
		this.memberTrainer = memberTrainer;
		this.memberBirth = memberBirth;
		this.pauseStart = pauseStart;
		this.pauseEnd = pauseEnd;
		this.productName = productName;
		this.memProductStart = memProductStart;
		this.memProductEnd = memProductEnd;
		this.lockerNo = lockerNo;
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



	public String getMemberGender() {
		return memberGender;
	}



	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMemberAddress() {
		return memberAddress;
	}



	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}



	public String getMemberHeight() {
		return memberHeight;
	}



	public void setMemberHeight(String memberHeight) {
		this.memberHeight = memberHeight;
	}



	public String getMemberWeight() {
		return memberWeight;
	}



	public void setMemberWeight(String memberWeight) {
		this.memberWeight = memberWeight;
	}



	public String getMemberImage() {
		return memberImage;
	}



	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}



	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}



	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}



	public String getMemberNote() {
		return memberNote;
	}



	public void setMemberNote(String memberNote) {
		this.memberNote = memberNote;
	}



	public String getBlacklistStatus() {
		return blacklistStatus;
	}



	public void setBlacklistStatus(String blacklistStatus) {
		this.blacklistStatus = blacklistStatus;
	}



	public Date getBlacklistEnrollDate() {
		return blacklistEnrollDate;
	}



	public void setBlacklistEnrollDate(Date blacklistEnrollDate) {
		this.blacklistEnrollDate = blacklistEnrollDate;
	}



	public String getBlacklistContent() {
		return blacklistContent;
	}



	public void setBlacklistContent(String blacklistContent) {
		this.blacklistContent = blacklistContent;
	}



	public String getMemberStatus() {
		return memberStatus;
	}



	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}



	public String getMemberTrainer() {
		return memberTrainer;
	}



	public void setMemberTrainer(String memberTrainer) {
		this.memberTrainer = memberTrainer;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
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
	

	public int getLockerNo() {
		return lockerNo;
	}



	public void setLockerNo(int lockerNo) {
		this.lockerNo = lockerNo;
	}
	
	
	
	

	public String getMemberBirth() {
		return memberBirth;
	}



	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}



	public String getPauseStart() {
		return pauseStart;
	}



	public void setPauseStart(String pauseStart) {
		this.pauseStart = pauseStart;
	}



	public String getPauseEnd() {
		return pauseEnd;
	}



	public void setPauseEnd(String pauseEnd) {
		this.pauseEnd = pauseEnd;
	}



	@Override
	public String toString() {
		return "MemberDtoU [memberNo=" + memberNo + ", memberName=" + memberName + ", memberGender=" + memberGender
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberAddress=" + memberAddress
				+ ", memberHeight=" + memberHeight + ", memberWeight=" + memberWeight + ", memberImage=" + memberImage
				+ ", memberEnrollDate=" + memberEnrollDate + ", memberNote=" + memberNote + ", blacklistStatus="
				+ blacklistStatus + ", blacklistEnrollDate=" + blacklistEnrollDate + ", blacklistContent="
				+ blacklistContent + ", memberStatus=" + memberStatus + ", memberTrainer=" + memberTrainer
				+ ", productName=" + productName + ", memProductStart=" + memProductStart + ", memProductEnd="
				+ memProductEnd + ", lockerNo=" + lockerNo + ", getMemberNo()=" + getMemberNo() + ", getMemberName()="
				+ getMemberName() + ", getMemberGender()=" + getMemberGender() + ", getMemberEmail()="
				+ getMemberEmail() + ", getMemberPhone()=" + getMemberPhone() + ", getMemberAddress()="
				+ getMemberAddress() + ", getMemberHeight()=" + getMemberHeight() + ", getMemberWeight()="
				+ getMemberWeight() + ", getMemberImage()=" + getMemberImage() + ", getMemberEnrollDate()="
				+ getMemberEnrollDate() + ", getMemberNote()=" + getMemberNote() + ", getBlacklistStatus()="
				+ getBlacklistStatus() + ", getBlacklistEnrollDate()=" + getBlacklistEnrollDate()
				+ ", getBlacklistContent()=" + getBlacklistContent() + ", getMemberStatus()=" + getMemberStatus()
				+ ", getMemberTrainer()=" + getMemberTrainer() + ", getProductName()=" + getProductName()
				+ ", getMemProductStart()=" + getMemProductStart() + ", getMemProductEnd()=" + getMemProductEnd()
				+ ", getLockerNo()=" + getLockerNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


*/



	
}
