package com.ex01.dispacher.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex01.dispacher.Controller;
import com.ex01.service.ManagerService;


import lombok.extern.log4j.Log4j2;

@Log4j2
public class UsersListController implements Controller {
	ManagerService servicecall = ManagerService.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {

		String action = req.getPathInfo();
		String nextPage = null;
		System.out.println(action+" "+nextPage);
		

		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		Map<String, Integer> pageingMap = new HashMap<>();
		pageingMap.put("section", section);
		pageingMap.put("pageNum", pageNum);
		
		Map<String, Object>  articlesMap = servicecall.selectList(pageingMap);
		articlesMap.put("section",section);
		articlesMap.put("pageNum",pageNum);
		req.setAttribute("articlesMap", articlesMap);

		
	
		
		
		
		
		
		
		
		log.info("view로 이동 ");
		return "usersList";
	}

	
	
	
}
