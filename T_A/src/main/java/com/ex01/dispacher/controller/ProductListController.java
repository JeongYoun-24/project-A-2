package com.ex01.dispacher.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex01.dispacher.Controller;
import com.ex01.service.UsersService;


import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductListController implements Controller {
	UsersService servicecall = UsersService.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
			
		
		

		
		

	
		
		log.info("view로 이동 ");
		return "productList";
	}

	
	
	
}
