package co.three.prj.lfNotice;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LfNoticeVO {
	private String lFnid;
	private String lFTitle;
	private String lFncontent;
	private Date lFnDate;
	private String lFnAdress;
	private String lFnHit;
	private String lFnObj;					//물건이름
	private String lFnImg;
	private String lFnobjType;				//물건타입(가방, 핸드폰...)	
	private String lFnStatus; 				//페이지 상태(분실,습득)
	private String id;						//회원 id
}
