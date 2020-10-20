package com.lyy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyy.dao.BookMapper;
import com.lyy.entity.Bc;
import com.lyy.entity.Book;
import com.lyy.entity.Fenye;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookmapper;
	@Override
	public Fenye<Book> selectBook(Fenye<Book> fenye) {
		// TODO Auto-generated method stub
		List<Book> selectBook=bookmapper.selectBook(fenye);
		Integer selectBookCount = bookmapper.selectBookCount(fenye);
		fenye.setRows(selectBook);
		fenye.setTotal(selectBookCount);
		return fenye;
	}

	@Override
	public List<Bc> geBc() {
		// TODO Auto-generated method stub
		return bookmapper.getBc();
	}

}
