package com.jh.tripleb.notice.model.vo;

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
public class Notice {
	
	private int noticeNo;			// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent;	// 공지사항 내용
	private Date noticeDate;		// 공지사항 등록일
	private String noticeStatus;	// 공지사항 상태 (Y:유지 N:삭제)
	private int trainerNo;			// 트레이너 번호
	private String trainerName;
}
