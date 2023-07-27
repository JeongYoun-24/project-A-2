package ysac.rev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.rev.service.RevService;

@WebServlet("/rev/delete")
public class RevRemoveController extends HttpServlet {

	private RevService revService = RevService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getPathInfo();
		String nextPage = null;
		int rev_code = (Integer.parseInt(req.getParameter("rev_code")));
		
		revService.revDelete(rev_code);
		
		
		nextPage ="/main.do";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
	}
	
	
	
}
