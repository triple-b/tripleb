package com.jh.tripleb.reply.model.vo;

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
public class Reply {
	
	private int replyNo;			// 댓글 번호
	private int replyTitle;			// 댓글 타이틀
	private Date replyDate;			// 댓글 등록일
	private String replyStatus;		// 댓글 상태 (Y:유지 N:삭제)
	private int sugNo;				// 건의사항번호

}
