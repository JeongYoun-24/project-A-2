package ysac.users.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class UsersLogoutController extends HttpServlet {

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	
	}
	
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		HttpSession session = req.getSession();
		
		//해당 세션 삭제
		session.removeAttribute("loginInfo");
		session.invalidate();
		
		resp.sendRedirect(req.getContextPath()+"/main.do");
	
		
	}
	
	
}
