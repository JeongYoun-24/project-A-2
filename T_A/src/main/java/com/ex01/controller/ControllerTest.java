package com.ex01.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.ex01.dto.UsersDTO;

@WebServlet("/users/*")
public class ControllerTest extends HttpServlet {

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
		
		
		
		if(action == null || action.equals("/main.do")) {// 메인 페이지 
			
		}else if (action.equals("/loginPage.do")) { // 로그인 페이지 	
			
			nextPage ="/project/login.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if (action.equals("/userForm.do")) { // 회원가입 페이지 
			
			
			nextPage ="/project/join.jsp";
			resp.sendRedirect(req.getContextPath()+ nextPage);
		}else if (action.equals("/userForm.do")) { // 회원가입 데이터  
			
			String formdate = req.getParameter("formdata");
		
			System.out.println(formdate);
			
			req.setCharacterEncoding("utf-8");
			String user_id = req.getParameter("user_id");
			String user_pwd = req.getParameter("user_pwd");
			String user_name = req.getParameter("user_name");
			
			//클라이언트에서 json 구조 형식 데이터를 ajax 로 보냈을 경우
			String logindata = req.getParameter("formdata");
			System.out.println(logindata);
			
			JSONObject jsonObject = null;
			JSONParser jsonParser = new JSONParser(); //json 객체 변환
			try {
				jsonObject = (JSONObject)jsonParser.parse(logindata);
				System.out.println(jsonObject);
				System.out.println(jsonObject.get("user_id"));
				
				user_id = (String) jsonObject.get("user_id");
				user_pwd = (String) jsonObject.get("user_pwd");
				
				
				System.out.println(user_id);
				System.out.println(user_pwd);
				
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
//			UsersDTO dto = new UsersDTO();
//			dto.setUser_id(req.getParameter("user_id"));
//			dto.setUser_pwd(req.getParameter("user_pwd"));
//			dto.setUser_name(req.getParameter("user_name"));
//			dto.setUser_email(req.getParameter("user_email"));
//			dto.setAddress(req.getParameter("address"));
//			dto.setPhone(req.getParameter("phone"));			

			
			
			
			// 입력데이터 서비스 요청
//			int result = userService.addUser(dto);
						
			nextPage ="/users/loginPage.do";
			resp.sendRedirect(req.getContextPath()+ nextPage);
		}else if (action.equals("/myinfo.do")) { // 회원정보 수정 페이지 	
			
			nextPage ="/project/myinfo.jsp";
			resp.sendRedirect(req.getContextPath()+ nextPage);
			
		}else if (action.equals("/U_update.do")) { // 회원정보 수정 페이지 		
			
			
			
			nextPage ="/main.do";
			resp.sendRedirect(req.getContextPath()+ nextPage);
		}else if (action.equals("/m_board.do")) { // 공지사항 페이지		
			
			nextPage ="/project/m_board.jsp";
			resp.sendRedirect(req.getContextPath()+ nextPage);
			
		}else if (action.equals("/11")) { // 장바구니 페이지 
			
			
		}else {
			
			
		}
		
		
		
	}
	
	
	
}
