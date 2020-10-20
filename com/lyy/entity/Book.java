package com.lyy.entity;

public class Book {
	private Integer bid;
	private String bname;
	private Double bsale;
	private String bzuoze;
	private String bjieshao;
	private Bc bc;
	
	private Double startbsale;
	private Double endbsale;
	
	public Double getStartbsale() {
		return startbsale;
	}
	public void setStartbsale(Double startbsale) {
		this.startbsale = startbsale;
	}
	public Double getEndbsale() {
		return endbsale;
	}
	public void setEndbsale(Double endbsale) {
		this.endbsale = endbsale;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Double getBsale() {
		return bsale;
	}
	public void setBsale(Double bsale) {
		this.bsale = bsale;
	}
	public String getBzuoze() {
		return bzuoze;
	}
	public void setBzuoze(String bzuoze) {
		this.bzuoze = bzuoze;
	}
	public String getBjieshao() {
		return bjieshao;
	}
	public void setBjieshao(String bjieshao) {
		this.bjieshao = bjieshao;
	}
	public Bc getBc() {
		return bc;
	}
	public void setBc(Bc bc) {
		this.bc = bc;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", bsale=" + bsale
				+ ", bzuoze=" + bzuoze + ", bjieshao=" + bjieshao + ", bc="
				+ bc + "]";
	}
	
	
}
