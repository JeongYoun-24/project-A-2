package ysac.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.qna.dto.QnaDTO;
import ysac.qna.service.QnaService;
import ysac.rev.dto.RevDTO;

@WebServlet("/qna/view")
public class QnaController  extends HttpServlet{
	
	private QnaService qnaService = QnaService.INSTANCE;
	
	
	String nextPage = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qna_code = req.getParameter("qna_code");
		System.out.println("-----------=-=-=-=-=-=--="+qna_code);
		
		
		QnaDTO qnaDTO = qnaService.findList(qna_code);
		
		req.setAttribute("qnafind", qnaDTO);
		
	
		
		
		
		
		nextPage = "/project_qna/qnaview.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		nextPage = "/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
	}
	
	
	
	
	
}
