package com.lyy.service;

import java.util.List;

import com.lyy.entity.Bc;
import com.lyy.entity.Book;
import com.lyy.entity.Fenye;


public interface BookService {
	Fenye<Book> selectBook(Fenye<Book> fenye);
	List<Bc> geBc();
	//Integer updateStu(Book student);
}
