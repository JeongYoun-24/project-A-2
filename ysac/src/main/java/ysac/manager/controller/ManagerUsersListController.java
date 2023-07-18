package ysac.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;
import ysac.users.service.UsersService;

@Log4j2
@WebServlet("/managerUserList")
public class ManagerUsersListController extends HttpServlet{

	UsersService usersService = UsersService.INSTANCE;
	String nextPage = null;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		Map<String, Integer> pageingMap = new HashMap<>();
		pageingMap.put("section", section);
		pageingMap.put("pageNum", pageNum);
		
		Map<String, Object>  articlesMap = usersService.selectList(pageingMap);
		int totArticles = usersService.selectTotArticles();
		
		// 전체 페이지수 = 전체레코드수/10(1page: 10개묶음) + 1
		int totalPage = (int)Math.ceil(totArticles*1.0/10); // 소수점이하기 있으면 자리올림(10.1=>11)
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/10);
		
		 int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			 
			log.info("("+section+"-1)*10) + "+i+": "+(endPage));
			
			if (pageNum==i) {
				log.info("현재페이지와 동일 번호: "+i);
			}
			
			if (endPage <=  totalPage){
				
				lastPage = i;
			}
		 }
	
		
//		Map<String, Object>  articlesMap = managerService.selectList(pageingMap);
		 req.setAttribute("articlesMap", articlesMap);
			
			req.setAttribute("totArticles", totArticles);
			req.setAttribute("section", section);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
			req.setAttribute("lastPage", lastPage);
			
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
		
		
		
		nextPage ="/project_m_users/usersList.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
}
