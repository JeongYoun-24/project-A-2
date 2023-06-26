package com.ex01.dispacher.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex01.dispacher.Controller;
import com.ex01.service.UsersService;

public class MainController implements Controller {

	UsersService servicecall = UsersService.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		
		
		
		return "spmmain";
		
		
	}
}
