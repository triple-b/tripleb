package com.jh.tripleb.mcAllCheck.model.vo;

import java.sql.Date;

public class mcAllCheckDto {

	private int MACHINE_ALLCHKNO;				// 기구점검번호 *
	private String machineTitle;			// 점검제목 *
	private Date machineChkDate;			// 점검일
	private int trainerNo;					// 트레이너번호 *
	
	private int machineChkNo;			// 기구상세점검번호 
	private String machineChkContent;	// 기구점검내용 *
	private int machineNo;				// 기구번호  *
	private String machineNoList;       // 기구번호 임시 * 1,2,3
	private String machineChkContentList;  //  점검내용 임시 * 1^2^3
	
	private Date machineRegistDate;	// 기구등록일
	private String machineStatus;	// 기구상태 (Y:사용가능 N:고장)
	private String machineDel;		// 기구 삭제여부	(Y:유지 N:삭제)
	private int mcNo;				// 기구종류번호
	
	private String mcName;		// 기구명
	private String mcExplain;	// 기구 설명
	private String thumbnail;	// 기구썸네일
	private String mcStatus;    // 기구상태
	private Date mcDate;		// 기구 등록날짜
	private String thumbChange;	// 기구썸네일수정
	
	public mcAllCheckDto() {
		
	}

	public mcAllCheckDto(int machineAllChkNo, String machineTitle, Date machineChkDate, int trainerNo, int machineChkNo,
			String machineChkContent, int machineNo, String machineNoList, String machineChkContentList,
			Date machineRegistDate, String machineStatus, String machineDel, int mcNo, String mcName, String mcExplain,
			String thumbnail, String mcStatus, Date mcDate, String thumbChange) {
		super();
		this.MACHINE_ALLCHKNO = machineAllChkNo;
		this.machineTitle = machineTitle;
		this.machineChkDate = machineChkDate;
		this.trainerNo = trainerNo;
		this.machineChkNo = machineChkNo;
		this.machineChkContent = machineChkContent;
		this.machineNo = machineNo;
		this.machineNoList = machineNoList;
		this.machineChkContentList = machineChkContentList;
		this.machineRegistDate = machineRegistDate;
		this.machineStatus = machineStatus;
		this.machineDel = machineDel;
		this.mcNo = mcNo;
		this.mcName = mcName;
		this.mcExplain = mcExplain;
		this.thumbnail = thumbnail;
		this.mcStatus = mcStatus;
		this.mcDate = mcDate;
		this.thumbChange = thumbChange;
	}

	@Override
	public String toString() {
		return "mcAllCheckDto [machineAllChkNo=" + MACHINE_ALLCHKNO + ", machineTitle=" + machineTitle
				+ ", machineChkDate=" + machineChkDate + ", trainerNo=" + trainerNo + ", machineChkNo=" + machineChkNo
				+ ", machineChkContent=" + machineChkContent + ", machineNo=" + machineNo + ", machineNoList="
				+ machineNoList + ", machineChkContentList=" + machineChkContentList + ", machineRegistDate="
				+ machineRegistDate + ", machineStatus=" + machineStatus + ", machineDel=" + machineDel + ", mcNo="
				+ mcNo + ", mcName=" + mcName + ", mcExplain=" + mcExplain + ", thumbnail=" + thumbnail + ", mcStatus="
				+ mcStatus + ", mcDate=" + mcDate + ", thumbChange=" + thumbChange + "]";
	}

	public int getMachineAllChkNo() {
		return MACHINE_ALLCHKNO;
	}

	public void setMachineAllChkNo(int machineAllChkNo) {
		this.MACHINE_ALLCHKNO = machineAllChkNo;
	}

	public String getMachineTitle() {
		return machineTitle;
	}

	public void setMachineTitle(String machineTitle) {
		this.machineTitle = machineTitle;
	}

	public Date getMachineChkDate() {
		return machineChkDate;
	}

	public void setMachineChkDate(Date machineChkDate) {
		this.machineChkDate = machineChkDate;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public int getMachineChkNo() {
		return machineChkNo;
	}

	public void setMachineChkNo(int machineChkNo) {
		this.machineChkNo = machineChkNo;
	}

	public String getMachineChkContent() {
		return machineChkContent;
	}

	public void setMachineChkContent(String machineChkContent) {
		this.machineChkContent = machineChkContent;
	}

	public int getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(int mNo) {
		this.machineNo = mNo;
	}

	public String getMachineNoList() {
		return machineNoList;
	}

	public void setMachineNoList(String machineNoList) {
		this.machineNoList = machineNoList;
	}

	public String getMachineChkContentList() {
		return machineChkContentList;
	}

	public void setMachineChkContentList(String machineChkContentList) {
		this.machineChkContentList = machineChkContentList;
	}

	public Date getMachineRegistDate() {
		return machineRegistDate;
	}

	public void setMachineRegistDate(Date machineRegistDate) {
		this.machineRegistDate = machineRegistDate;
	}

	public String getMachineStatus() {
		return machineStatus;
	}

	public void setMachineStatus(String machineStatus) {
		this.machineStatus = machineStatus;
	}

	public String getMachineDel() {
		return machineDel;
	}

	public void setMachineDel(String machineDel) {
		this.machineDel = machineDel;
	}

	public int getMcNo() {
		return mcNo;
	}

	public void setMcNo(int mcNo) {
		this.mcNo = mcNo;
	}

	public String getMcName() {
		return mcName;
	}

	public void setMcName(String mcName) {
		this.mcName = mcName;
	}

	public String getMcExplain() {
		return mcExplain;
	}

	public void setMcExplain(String mcExplain) {
		this.mcExplain = mcExplain;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getMcStatus() {
		return mcStatus;
	}

	public void setMcStatus(String mcStatus) {
		this.mcStatus = mcStatus;
	}

	public Date getMcDate() {
		return mcDate;
	}

	public void setMcDate(Date mcDate) {
		this.mcDate = mcDate;
	}

	public String getThumbChange() {
		return thumbChange;
	}

	public void setThumbChange(String thumbChange) {
		this.thumbChange = thumbChange;
	}

	
}