package com.jh.tripleb.mcAllCheck.model.vo;

import java.sql.Date;

public class mcAllDto {

	private String MACHINE_TITLE;
	private Date MACHINE_CHECKDATE;
	private int MACHINE_NO;
	private String MACHINE_CHECKCONTENT;
	private int MACHINE_CHKNO;
	private String Mc_Name;
	private int MACHINE_ALLCHKNO;
	public mcAllDto() {
		
	}
	public String getMACHINE_TITLE() {
		return MACHINE_TITLE;
	}
	public void setMACHINE_TITLE(String mACHINE_TITLE) {
		MACHINE_TITLE = mACHINE_TITLE;
	}
	public Date getMACHINE_CHECKDATE() {
		return MACHINE_CHECKDATE;
	}
	public void setMACHINE_CHECKDATE(Date mACHINE_CHECKDATE) {
		MACHINE_CHECKDATE = mACHINE_CHECKDATE;
	}
	public int getMACHINE_NO() {
		return MACHINE_NO;
	}
	public void setMACHINE_NO(int mACHINE_NO) {
		MACHINE_NO = mACHINE_NO;
	}
	public String getMACHINE_CHECKCONTENT() {
		return MACHINE_CHECKCONTENT;
	}
	public void setMACHINE_CHECKCONTENT(String mACHINE_CHECKCONTENT) {
		MACHINE_CHECKCONTENT = mACHINE_CHECKCONTENT;
	}
	public int getMACHINE_CHKNO() {
		return MACHINE_CHKNO;
	}
	public void setMACHINE_CHKNO(int mACHINE_CHKNO) {
		MACHINE_CHKNO = mACHINE_CHKNO;
	}
	public String getMc_Name() {
		return Mc_Name;
	}
	public void setMc_Name(String mc_Name) {
		Mc_Name = mc_Name;
	}
	public int getMACHINE_ALLCHKNO() {
		return MACHINE_ALLCHKNO;
	}
	public void setMACHINE_ALLCHKNO(int mACHINE_ALLCHKNO) {
		MACHINE_ALLCHKNO = mACHINE_ALLCHKNO;
	}
	@Override
	public String toString() {
		return "mcAllDto [MACHINE_TITLE=" + MACHINE_TITLE + ", MACHINE_CHECKDATE=" + MACHINE_CHECKDATE + ", MACHINE_NO="
				+ MACHINE_NO + ", MACHINE_CHECKCONTENT=" + MACHINE_CHECKCONTENT + ", MACHINE_CHKNO=" + MACHINE_CHKNO
				+ ", Mc_Name=" + Mc_Name + ", MACHINE_ALLCHKNO=" + MACHINE_ALLCHKNO + "]";
	}
	public mcAllDto(String mACHINE_TITLE, Date mACHINE_CHECKDATE, int mACHINE_NO, String mACHINE_CHECKCONTENT,
			int mACHINE_CHKNO, String mc_Name, int mACHINE_ALLCHKNO) {
		super();
		MACHINE_TITLE = mACHINE_TITLE;
		MACHINE_CHECKDATE = mACHINE_CHECKDATE;
		MACHINE_NO = mACHINE_NO;
		MACHINE_CHECKCONTENT = mACHINE_CHECKCONTENT;
		MACHINE_CHKNO = mACHINE_CHKNO;
		Mc_Name = mc_Name;
		MACHINE_ALLCHKNO = mACHINE_ALLCHKNO;
	}
}