package com.jh.tripleb.equipCheck.model.vo;

public class EquipDto {

	private int eqcheckNo;		// 비품관리번호
	private String broken;		// 파손수
	private String lost;		// 분실수
	private String equipmentName;		// 비품명
	private int equipmentStock;			// 총재고
	private int equipmentNo;
	private int trainerNo;
	public EquipDto() {
		
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
	public EquipDto(int eqcheckNo, String broken, String lost, String equipmentName, int equipmentStock,
			int equipmentNo, int trainerNo) {
		super();
		this.eqcheckNo = eqcheckNo;
		this.broken = broken;
		this.lost = lost;
		this.equipmentName = equipmentName;
		this.equipmentStock = equipmentStock;
		this.equipmentNo = equipmentNo;
		this.trainerNo = trainerNo;
	}
	@Override
	public String toString() {
		return "EquipDto [eqcheckNo=" + eqcheckNo + ", broken=" + broken + ", lost=" + lost + ", equipmentName="
				+ equipmentName + ", equipmentStock=" + equipmentStock + ", equipmentNo=" + equipmentNo + ", trainerNo="
				+ trainerNo + "]";
	}
}