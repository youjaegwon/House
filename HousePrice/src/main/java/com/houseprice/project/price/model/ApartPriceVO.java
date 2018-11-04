package com.houseprice.project.price.model;

public class ApartPriceVO {
	
	private long rnum;
	private int cre_year;
	private int cre_month;
	private String road_main_num;
	private String road_miner_num;
	private String com_name;
	private String com_dong_name;
	private String com_ho_name;
	private String com_full_name;
	private double area;
	private String area_rank;
	private long price;
	private AddrDataVO addrData;
	public long getRnum() {
		return rnum;
	}
	public void setRnum(long rnum) {
		this.rnum = rnum;
	}
	public int getCre_year() {
		return cre_year;
	}
	public void setCre_year(int cre_year) {
		this.cre_year = cre_year;
	}
	public int getCre_month() {
		return cre_month;
	}
	public void setCre_month(int cre_month) {
		this.cre_month = cre_month;
	}
	public String getRoad_main_num() {
		return road_main_num;
	}
	public void setRoad_main_num(String road_main_num) {
		this.road_main_num = road_main_num;
	}
	public String getRoad_miner_num() {
		return road_miner_num;
	}
	public void setRoad_miner_num(String road_miner_num) {
		this.road_miner_num = road_miner_num;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_dong_name() {
		return com_dong_name;
	}
	public void setCom_dong_name(String com_dong_name) {
		this.com_dong_name = com_dong_name;
	}
	public String getCom_ho_name() {
		return com_ho_name;
	}
	public void setCom_ho_name(String com_ho_name) {
		this.com_ho_name = com_ho_name;
	}
	public String getCom_full_name() {
		return com_full_name;
	}
	public void setCom_full_name(String com_full_name) {
		this.com_full_name = com_full_name;
	}
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public String getArea_rank() {
		return area_rank;
	}
	public void setArea_rank(String area_rank) {
		this.area_rank = area_rank;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	
	public AddrDataVO getAddrData() {
		return addrData;
	}
	public void setAddrData(AddrDataVO addrData) {
		this.addrData = addrData;
	}
	@Override
	public String toString() {
		return "ApartPriceVO [rnum=" + rnum + ", cre_year=" + cre_year + ", cre_month=" + cre_month + ", road_main_num="
				+ road_main_num + ", road_miner_num=" + road_miner_num + ", com_name=" + com_name + ", com_dong_name="
				+ com_dong_name + ", com_ho_name=" + com_ho_name + ", com_full_name=" + com_full_name + ", area=" + area
				+ ", area_rank=" + area_rank + ", price=" + price + ", addrData=" + addrData + "]";
	}
}
