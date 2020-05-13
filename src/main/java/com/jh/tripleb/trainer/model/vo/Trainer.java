package com.jh.tripleb.trainer.model.vo;

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
public class Trainer {
	
	private int trainerNo;			// 트레이너 번호
	private String trainerName;		// 르테이너 이름
	private String trainerPwd;		// 트레이너 비밀번호
	private String trainerNick;		// 닉네임
	private int trainerBirth;		// 트레이너 생년월일
	private String trainerGender;	// 트레이너 성별
	private String trainerPhone;		// 트레이너 핸드폰
	private String trainerEmail;	// 트레이너 이메일
	private String trainerAddress;	// 트레이너 주소
	private String trainerStatus;	// 트레이너 상태 (Y:유지 N:퇴사)
	private String trainerGrade;	// 트레이너 등급 (N:일반 T:팀장)
	private String trainerAward;	// 수상경력
	private Date trainerJoin;		// 입사일
	private Date trainerEnd;		// 퇴사일
	private Date trainerScheck;		// 출근시간
	private Date trainerEcheck;		// 퇴근시간
	private String trainerThumbnail;	// 트레이너 사진

}
