package ysac.manager_board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.service.Manager_BoardService;


@WebServlet("/users/m_boardList")
public class Manager_BoardListController extends HttpServlet{

	private	Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Manager_BoardDTO> memberList = manager_BoardService.boardList();
		System.out.println(memberList);
		req.setAttribute("boardList", memberList);
		
		nextPage ="/project/m_board.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
//	List<Manager_BoardDTO> memberList = userService.boardList();
//	System.out.println(memberList);
//	req.setAttribute("doardList", memberList);
//	
//	nextPage ="/project/m_board.jsp";
//	req.getRequestDispatcher(nextPage).forward(req, resp);
}
