package ysac.manager_board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.service.Manager_BoardService;



@WebServlet("/users/m_boardview.do")
public class Manager_BoardFindListController extends HttpServlet {
	
	
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img";
	private	Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	String nextPage = null;
	
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int m_board = Integer.parseInt(req.getParameter("m_board"));
		System.out.println("m_board 값 :"+m_board);
		
		int dto = manager_BoardService.hitCount(m_board);
		
		Manager_BoardDTO article = manager_BoardService.boardfind(m_board);
		req.setAttribute("boardfind", article);
		
		nextPage ="/project_board/boardview.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);

	}
	
	

}
