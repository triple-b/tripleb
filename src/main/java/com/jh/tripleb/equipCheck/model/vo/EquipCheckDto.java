package com.jh.tripleb.equipCheck.model.vo;

import java.sql.Date;

public class EquipCheckDto {
	private int eqcheckNo;		// 비품관리번호
	private String broken;		// 파손수
	private String lost;		// 분실수
	private Date mtDate;		// 비품 점검일
	private int equipmentNo;	// 비품번호
	private int trainerNo;		// 트레이너번호
	private String equipmentName;		// 비품명
	private int equipmentStock;			// 총재고
	private String trainerName; // 트레이너 이름
	
	public EquipCheckDto() {
		
	}

	public int getEqcheckNo() {
		return eqcheckNo;
	}

	public void setEqcheckNo(int eqcheckNo) {
		this.eqcheckNo = eqcheckNo;
	}

	public String getBroken() {
		return broken;
	}

	public void setBroken(String broken) {
		this.broken = broken;
	}

	public String getLost() {
		return lost;
	}

	public void setLost(String lost) {
		this.lost = lost;
	}

	public Date getMtDate() {
		return mtDate;
	}

	public void setMtDate(Date mtDate) {
		this.mtDate = mtDate;
	}

	public int getEquipmentNo() {
		return equipmentNo;
	}

	public void setEquipmentNo(int equipmentNo) {
		this.equipmentNo = equipmentNo;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public int getEquipmentStock() {
		return equipmentStock;
	}

	public void setEquipmentStock(int equipmentStock) {
		this.equipmentStock = equipmentStock;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public EquipCheckDto(int eqcheckNo, String broken, String lost, Date mtDate, int equipmentNo, int trainerNo,
			String equipmentName, int equipmentStock, String trainerName) {
		super();
		this.eqcheckNo = eqcheckNo;
		this.broken = broken;
		this.lost = lost;
		this.mtDate = mtDate;
		this.equipmentNo = equipmentNo;
		this.trainerNo = trainerNo;
		this.equipmentName = equipmentName;
		this.equipmentStock = equipmentStock;
		this.trainerName = trainerName;
	}

	@Override
	public String toString() {
		return "EquipCheckDto [eqcheckNo=" + eqcheckNo + ", broken=" + broken + ", lost=" + lost + ", mtDate=" + mtDate
				+ ", equipmentNo=" + equipmentNo + ", trainerNo=" + trainerNo + ", equipmentName=" + equipmentName
				+ ", equipmentStock=" + equipmentStock + ", trainerName=" + trainerName + "]";
	}
	
}