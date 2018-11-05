package com.houseprice.project.price.condition;

public class Point {
	private double x;
	private double y;
	
	public Point() {}
	public Point(double d, double e) {
		x = d;
		y = e;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "Point [x=" + x + ", y=" + y + "]";
	}
	
}
