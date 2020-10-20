package com.lyy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyy.entity.Bc;
import com.lyy.entity.Book;
import com.lyy.entity.Fenye;
import com.lyy.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService  bookService;
	
	@Autowired
	private Fenye<Book> fenye;
	
	@RequestMapping(value="/Book",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Book> selectStu(Fenye<Book> fenye,Book book,Bc bc,Integer page,Integer rows){
		book.setBc(bc);
		fenye.setBook(book);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye= bookService.selectBook(fenye);
		return fenye;
		
	}
}
