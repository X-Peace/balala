package com.lyy.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Fenye<T> {
	private Integer page;//当前页
	private Integer pageSize;
	private Integer total;//总条数
	private List<T> rows;
	private Book book;
	
	
	
	

	
	

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
	

}
