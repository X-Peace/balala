package com.lyy.dao;

import java.util.List;

import com.lyy.entity.Bc;
import com.lyy.entity.Book;
import com.lyy.entity.Fenye;


public interface BookMapper {
	Integer selectBookCount(Fenye<Book> fenye);
	List<Book> selectBook(Fenye<Book> fenye);
	List<Bc> getBc();
	/*Integer updateBook(Book Book);
	Integer insertBook(Book Book);*/
}
