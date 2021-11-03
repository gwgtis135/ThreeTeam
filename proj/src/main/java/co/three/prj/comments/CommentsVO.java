package co.three.prj.comments;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
//댓글 테이블
public class CommentsVO {

	private String cId;
	private String cCnotent;
	private Date cDate;
	private String id;
	private String cStatus;
}
