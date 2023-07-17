package ysac.manager_board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.manager_board.service.Manager_BoardService;

@WebServlet("/delete_M_board")
public class Manager_BoardDeleteController extends HttpServlet{
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img";
	
	
	Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	private Manager_BoardMapper manager_BoardMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHand(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHand(req, resp);
	
	}
	protected void doHand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getPathInfo();
		String nextPage = null;
		
		
		int m_board = Integer.parseInt(req.getParameter("m_board"));
//		Manager_BoardDTO article = managerService.boardfind(m_board);
//		List<Integer> m_boardList = managerService.deleteArticle(m_board);
		int dto = manager_BoardService.deleteboard(m_board);
		//이미지 폴더 및 파일 삭제
		
		int _m_boardno = m_board; 
			
			File imgDir = new File(ARTICLE_IMAGE_REPO+"\\"+_m_boardno);
			
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
				
			}
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print("<script> alert('글 삭제 완료'); location.href='" + req.getContextPath() + "/main.do" +" </script>");
		
		nextPage ="/main.do";
		resp.sendRedirect(req.getContextPath()+ nextPage);
	
	}
	
	
}
