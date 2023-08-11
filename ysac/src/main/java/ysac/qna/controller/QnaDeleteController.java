package ysac.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.qna.service.QnaService;

@WebServlet("/qna/delete")
public class QnaDeleteController extends HttpServlet {
	
	private QnaService  qnaService = QnaService.INSTANCE;
	
	String nextPage = null;	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("---------삭제 요청------------- ");
		int qan_code = (Integer.parseInt(req.getParameter("qna_code")));
		System.out.println(qan_code);
		
		
		int result = qnaService.delete(qan_code);
		
		
		
		
		if(result== 1) {
			System.out.println("삭제 성공 ");
			
		}else {
			System.out.println("삭제 실패 ");
			
			
		}
		
		
		
		
		nextPage = "/main.do";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		nextPage = "/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
	}
	
	
	
}
