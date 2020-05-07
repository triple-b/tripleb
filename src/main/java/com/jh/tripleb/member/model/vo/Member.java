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
public class Member {
	
	private int memberNo;				// 회원번호
	private String memberName;			// 회원이름
	private String mmeberGender;		// 회원 성별
	private String memberEmail;			// 회원 이메일
	private String memberPhone;			// 회원 핸드폰 번호
	private String memberAddress;		// 회원 주소
	private String height;				// 키
	private String weight;				// 몸무게
	private String memberImage;			// 회원 프로필 이미지
	private Date memberEnrollDate;		// 회원등록일
	private String memberNote;			// 회원 특이사항
	private String blStatus;			// 블랙리스트 여부
	private Date blEnrollDate;			// 블랙리스트 등록일
	private String blContent;			// 블랙리스트 사유
	private String memberStatus;		// 회원 상태 (N:유지 Y:탈퇴)
	private String memberTrainer;		// 담당 트레이너

}
