package co.three.prj.totalNotice;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TotalNotice {

	private String tnId;
	private String tnName;				//물건이름
	private String tnImg;				//물건사진
	private String tnTitle;				
	private String tnContent;
	private Date tnDate;
	private String tnAddress;
	private String tnType;				//공공기관 타입(경찰서데이터, 대구지하철데이터..)
}
