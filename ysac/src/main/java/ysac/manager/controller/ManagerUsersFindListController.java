package ysac.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;
import ysac.users.dto.UsersDTO;
import ysac.users.service.UsersService;

@Log4j2
@WebServlet("/managerUserFindList")
public class ManagerUsersFindListController extends HttpServlet{

	UsersService usersService = UsersService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String action = req.getPathInfo();
		String nextPage = null;
		
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		
		String user_id = req.getParameter("user_id");
		String user_name = req.getParameter("user_name");	
		String user_email = req.getParameter("user_email");
		String phone = req.getParameter("phone");
		
		System.out.println("user_name : "+user_name);
		System.out.println("user_id : "+user_id);
		System.out.println("user_email : "+user_email);
		List<UsersDTO> List = null;
		
		
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
		
			
		if(user_id != null) { // 아이디값 들어오면 실행 
			String _section1 = req.getParameter("pageBlock");
			String _pageNum1 = req.getParameter("pageNum");
			user_id = req.getParameter("user_id");
				
			
//			int section3 = Integer.parseInt((_section == null) ? "1" : _section);
//			int pageNum3 = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
			String section1 = ((_section == null) ? "1" : _section1);
			String pageNum1 = ((_pageNum == null) ? "1" : _pageNum1);
			
//			Map<String, String> emailMap = new HashMap<>();
//			emailMap.put("email", email);
			
			
			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section1);
			pageingMap.put("pageNum", pageNum1);
			pageingMap.put("user_id", user_id);
			
			Map<String, Object>  articlesMap = usersService.idList(pageingMap);
			req.setAttribute("articlesMap", articlesMap);
			
			req.setAttribute("totArticles", totArticles);
			req.setAttribute("section", section);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
			req.setAttribute("lastPage", lastPage);
			
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
		
		}
		if(user_name != null) { // 이름 값 들어오면 실행 
			
			String _section2 = req.getParameter("pageBlock");
			String _pageNum2 = req.getParameter("pageNum");
			user_name = req.getParameter("user_name");
				
			
//			int section3 = Integer.parseInt((_section == null) ? "1" : _section);
//			int pageNum3 = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
			String section3 = ((_section == null) ? "1" : _section2);
			String pageNum3 = ((_pageNum == null) ? "1" : _pageNum2);
			
//			Map<String, String> emailMap = new HashMap<>();
//			emailMap.put("email", email);
			
			
			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section3);
			pageingMap.put("pageNum", pageNum3);
			pageingMap.put("user_name", user_name);
			
			Map<String, Object>  articlesMap = usersService.nameList(pageingMap);
			req.setAttribute("articlesMap", articlesMap);
			
			req.setAttribute("totArticles", totArticles);
			req.setAttribute("section", section);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
			req.setAttribute("lastPage", lastPage);
			
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
			
			}	
		if(user_email != null) { // 이름 값 들어오면 실행 
			String _section3 = req.getParameter("pageBlock");
			String _pageNum3 = req.getParameter("pageNum");
			user_email = req.getParameter("user_email");
				
			String section3 = ((_section == null) ? "1" : _section3);
			String pageNum3 = ((_pageNum == null) ? "1" : _pageNum3);

			
			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section3);
			pageingMap.put("pageNum", pageNum3);
			pageingMap.put("user_email", user_email);
			
			Map<String, Object>  articlesMap = usersService.emailList(pageingMap);
			req.setAttribute("articlesMap", articlesMap);
			
			req.setAttribute("totArticles", totArticles);
			req.setAttribute("section", section);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
			req.setAttribute("lastPage", lastPage);
			
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
		
		}
		if(phone != null) {
			String _section3 = req.getParameter("pageBlock");
			String _pageNum3 = req.getParameter("pageNum");
			phone = req.getParameter("phone");
				
			String section3 = ((_section == null) ? "1" : _section3);
			String pageNum3 = ((_pageNum == null) ? "1" : _pageNum3);

			
			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section3);
			pageingMap.put("pageNum", pageNum3);
			pageingMap.put("phone", phone);
			
			Map<String, Object>  articlesMap = usersService.phoneList(pageingMap);
			req.setAttribute("articlesMap", articlesMap);
			
			req.setAttribute("totArticles", totArticles);
			req.setAttribute("section", section);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
			req.setAttribute("lastPage", lastPage);
			
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
		}
		
		nextPage ="/project_m_users/usersList.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	
	}
}
