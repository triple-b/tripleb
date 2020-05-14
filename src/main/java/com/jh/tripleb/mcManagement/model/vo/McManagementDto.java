package com.jh.tripleb.mcManagement.model.vo;

import java.sql.Date;

public class McManagementDto {

	private int machineNo;			// 기구번호 !
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
	
	public McManagementDto() {
		
	}

	public int getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(int machineNo) {
		this.machineNo = machineNo;
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

	@Override
	public String toString() {
		return "McManagementDto [machineNo=" + machineNo + ", machineRegistDate=" + machineRegistDate
				+ ", machineStatus=" + machineStatus + ", machineDel=" + machineDel + ", mcNo=" + mcNo + ", mcName="
				+ mcName + ", mcExplain=" + mcExplain + ", thumbnail=" + thumbnail + ", mcStatus=" + mcStatus
				+ ", mcDate=" + mcDate + ", thumbChange=" + thumbChange + "]";
	}

	public McManagementDto(int machineNo, Date machineRegistDate, String machineStatus, String machineDel, int mcNo,
			String mcName, String mcExplain, String thumbnail, String mcStatus, Date mcDate, String thumbChange) {
		super();
		this.machineNo = machineNo;
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
}
