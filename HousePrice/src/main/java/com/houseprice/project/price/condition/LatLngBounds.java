package com.houseprice.project.price.condition;

public class LatLngBounds {
	
	private Point sw;
	private Point ne;
	public Point getSw() {
		return sw;
	}
	public void setSw(Point sw) {
		this.sw = sw;
	}
	public Point getNe() {
		return ne;
	}
	public void setNe(Point ne) {
		this.ne = ne;
	}
	
	public double getTop() {
		return ne.getY();
	}
	
	public double getBottom() {
		return sw.getY();
	}
	
	public double getLeft() {
		return sw.getX();
	}
	
	public double getRight() {
		return ne.getX();
	}
	
	public Point getCenter() {
		return new Point((getLeft() + getRight())/2, (getTop() + getBottom())/2);
	}
	@Override
	public String toString() {
		return "LatLngBounds [sw=" + sw + ", ne=" + ne + ", getCenter()=" + getCenter() + "]";
	}
}
