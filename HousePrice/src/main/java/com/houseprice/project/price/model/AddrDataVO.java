package com.houseprice.project.price.model;

public class AddrDataVO {
	
	private long rnumId;
	private double coord_x; 
	private double coord_y;
	private String gu_code;
	private String legal_dong_code;
	private String road_addr_full;
	private String road_sido;
	private String road_gungu;
	private String road_donglee;
	public long getRnumId() {
		return rnumId;
	}
	public void setRnumId(long rnumId) {
		this.rnumId = rnumId;
	}
	public double getCoord_x() {
		return coord_x;
	}
	public void setCoord_x(double coord_x) {
		this.coord_x = coord_x;
	}
	public double getCoord_y() {
		return coord_y;
	}
	public void setCoord_y(double coord_y) {
		this.coord_y = coord_y;
	}
	public String getGu_code() {
		return gu_code;
	}
	public void setGu_code(String gu_code) {
		this.gu_code = gu_code;
	}
	public String getLegal_dong_code() {
		return legal_dong_code;
	}
	public void setLegal_dong_code(String legal_dong_code) {
		this.legal_dong_code = legal_dong_code;
	}
	public String getRoad_addr_full() {
		return road_addr_full;
	}
	public void setRoad_addr_full(String road_addr_full) {
		this.road_addr_full = road_addr_full;
	}
	public String getRoad_sido() {
		return road_sido;
	}
	public void setRoad_sido(String road_sido) {
		this.road_sido = road_sido;
	}
	public String getRoad_gungu() {
		return road_gungu;
	}
	public void setRoad_gungu(String road_gungu) {
		this.road_gungu = road_gungu;
	}
	public String getRoad_donglee() {
		return road_donglee;
	}
	public void setRoad_donglee(String road_donglee) {
		this.road_donglee = road_donglee;
	}
	@Override
	public String toString() {
		return "AddrDataVO [rnumId=" + rnumId + ", coord_x=" + coord_x + ", coord_y=" + coord_y + ", gu_code=" + gu_code
				+ ", legal_dong_code=" + legal_dong_code + ", road_addr_full=" + road_addr_full + ", road_sido="
				+ road_sido + ", road_gungu=" + road_gungu + ", road_donglee=" + road_donglee + "]";
	}
	
	
}
