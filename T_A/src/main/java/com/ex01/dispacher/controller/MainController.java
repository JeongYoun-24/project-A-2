package com.ex01.dispacher.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex01.dispacher.Controller;
import com.ex01.dto.ProductDTO;
import com.ex01.service.ProductService;
import com.ex01.service.UsersService;

public class MainController implements Controller {

	UsersService servicecall = UsersService.INSTANCE;
	ProductService proService = ProductService.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
//		List<ProductDTO> list = proService.proAllList();
//		req.setAttribute("proList", list);
		List<ProductDTO> list = proService.proList();
		req.setAttribute("proList", list);
		
		
		
		
		return "spmmain";
		
		
	}
}
