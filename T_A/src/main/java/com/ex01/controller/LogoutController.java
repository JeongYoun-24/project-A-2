package com.ex01.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.log4j.Log4j2;


@Log4j2
@WebServlet("/logout")
public class LogoutController extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	
	}
	
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	log.info("log out .. ");
		
		
		HttpSession session = req.getSession();
		
		//해당 세션 삭제
		session.removeAttribute("loginInfo");
		session.invalidate();
		
		resp.sendRedirect(req.getContextPath()+"/main.do");
	
		
	}
	
	
	
	
	
	
	
}
