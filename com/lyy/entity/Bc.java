package com.lyy.entity;

public class Bc {
	private Integer bcid;
	private String bcname;
	public Integer getBcid() {
		return bcid;
	}
	public void setBcid(Integer bcid) {
		this.bcid = bcid;
	}
	public String getBcname() {
		return bcname;
	}
	public void setBcname(String bcname) {
		this.bcname = bcname;
	}
	@Override
	public String toString() {
		return "Bc [bcid=" + bcid + ", bcname=" + bcname + "]";
	}
	
}
