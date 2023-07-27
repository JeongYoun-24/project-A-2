package ysac.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qna/view")
public class QnaController  extends HttpServlet{
	
	String nextPage = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		nextPage = "/project_qna/qnaview.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		nextPage = "/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
	}
	
	
	
	
	
}
