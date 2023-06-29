package com.ex01.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.ManagerDAO;
import com.ex01.dao.MapperUtil;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.dto.ManagerDTO;
import com.ex01.dto.Manager_BoardDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.service.ManagerService;
import com.ex01.service.UsersService;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/order/m_list.do")
public class userListController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\T_A\\src\\main\\webapp\\project_A_img";
	
	private ManagerService managerService = ManagerService.INSTANCE;
	private UsersService userService = UsersService.INSTANCE;
	private ImgNameController imgname = ImgNameController.INSTENS;
	
	private ModelMapper modelMapper;
	private ManagerMapper managerMapper;
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
		String action = req.getPathInfo();//작업 구분하기 위해
		String nextPage = null;
			
		String id = req.getParameter("id");
		String name = req.getParameter("name");	
		String user_email = req.getParameter("user_email");
		
		System.out.println("name : "+name);
		System.out.println("id : "+id);
		System.out.println("email : "+user_email);
		List<UsersDTO> List = null;
		int totArticles = managerService.selectTotArticles();
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		
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
		
		
		
		/*	
		if(id != null) { // 아이디값 들어오면 실행 
			String _section = req.getParameter("pageBlock");
			String _pageNum = req.getParameter("pageNum");
			id = req.getParameter("id");

			String section = ((_section == null) ? "1" : _section);
			String pageNum = ((_pageNum == null) ? "1" : _pageNum);

			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section);
			pageingMap.put("pageNum", pageNum);
			pageingMap.put("id", id);
			
			
			Map<String, Object>  articlesMap = managerService.idList(pageingMap);
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
			req.setAttribute("articlesMap", articlesMap);
		
		}
		
		if(name != null) { // 이름 값 들어오면 실행 
			
			String _section = req.getParameter("pageBlock");
			String _pageNum = req.getParameter("pageNum");
			name = req.getParameter("name");

			String section = ((_section == null) ? "1" : _section);
			String pageNum = ((_pageNum == null) ? "1" : _pageNum);

			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section);
			pageingMap.put("pageNum", pageNum);
			pageingMap.put("name", name);
			
			
			Map<String, Object>  articlesMap = managerService.nameList(pageingMap);
			articlesMap.put("section",section);
			articlesMap.put("pageNum",pageNum);
			req.setAttribute("articlesMap", articlesMap);
			
			}*/
		if(user_email != null) { // 이름 값 들어오면 실행 
			String _section3 = req.getParameter("pageBlock");
			String _pageNum3 = req.getParameter("pageNum");
			user_email = req.getParameter("user_email");
				
			String section3 = ((_section == null) ? "1" : _section3);
			String pageNum3 = ((_pageNum == null) ? "1" : _pageNum3);
			
			System.out.println("컨트롤 실행 1");
			Map<String, String> pageingMap = new HashMap<>();
			pageingMap.put("section", section3);
			pageingMap.put("pageNum", pageNum3);
			pageingMap.put("user_email", user_email);
			System.out.println("컨트롤 실행 2");
			System.out.println(pageingMap);
			Map<String, Object>  articlesMap = managerService.emailList(pageingMap);
			req.setAttribute("articlesMap", articlesMap);
			System.out.println(articlesMap);
			System.out.println("컨트롤 실행 3");
			
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
	
}// controller



