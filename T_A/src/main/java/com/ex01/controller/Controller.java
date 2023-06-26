package com.ex01.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex01.dto.ManagerDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.service.ManagerService;
import com.ex01.service.UsersService;

@WebServlet("/order/*")
public class Controller extends HttpServlet {
	
	private ManagerService managerService = ManagerService.INSTANCE;
	private UsersService userService = UsersService.INSTANCE;
	private ImgNameController imgname = ImgNameController.INSTENS;
	
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
			
			
			nextPage ="/show/main.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if(action.equals("/login.do")) { // 로그인 페이지 이동 
//			String id = req.getParameter("id");
//			String pwd = req.getParameter("pwd");
	
			
		
			nextPage ="/show/login.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if(action.equals("/loginID.do"))	{// 로그인 일치 서비스 
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			System.out.println(id);
			System.out.println(pwd);
		
			
			if(id.equals("dobi")) { // 관리자 아이디 
				ManagerDTO mDTO = managerService.login(id);
				
				String  mgid = mDTO.getId();
				String  mgpwd = mDTO.getPwd();
				int isOK =0;
				System.out.println(mDTO);
				if(mgid.equals(id)) {
					
					
					
					if(mgpwd.equals(pwd)) {
						isOK =1;
						
						HttpSession session =req.getSession();
						session.setAttribute("manager", mDTO.getName());
						if(session.isNew()) {
							session.setAttribute("manager", mDTO.getName());
						}else {
							session.getAttribute("manager");
						}
						
						
						
					}else {
						isOK =2;
						System.out.println("비밀번호 틀림");
						
					}
					
					
				}else {
					isOK =0;
					System.out.println("아이디 틀림");
					
				}
				nextPage ="/show/main.jsp";
				req.getRequestDispatcher(nextPage).forward(req, resp);
				return;
			}
			
			UsersDTO mDTO = userService.login(id);
			
			String  mgid = mDTO.getUser_id();
			String  mgpwd = mDTO.getUser_pwd();
			

			HttpSession session = req.getSession();
			
			session.setAttribute("loginInfo", mDTO.getUser_name());
			
			resp.sendRedirect(req.getContextPath()+"/order/main.do");
			
			
//			nextPage ="/show/main.jsp";
//			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if(action.equals("/M_logout.do")) {//관리자 로그아웃 	
			HttpSession session = req.getSession();
			
			session.removeAttribute("loginInfo");
			session.invalidate();
			
			nextPage ="/show/main.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
			
			
		}else if(action.equals("/logout.do")) { // 회원 로그아웃	
			HttpSession session = req.getSession();
			
			session.removeAttribute("loginInfo");
			session.invalidate();
			
			nextPage ="/main.do";
			req.getRequestDispatcher(nextPage).forward(req, resp);
			
		}else if(action.equals("/userForm.do")) {	// 회원가입 페이지 
			
			
			nextPage ="/show/userForm.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if(action.equals("/userinsert.do")) { // 회원가입 데이터 저장 
			
			UsersDTO dto = new UsersDTO();
			dto.setUser_id(req.getParameter("id"));
			dto.setUser_pwd(req.getParameter("pwd"));
			dto.setUser_name(req.getParameter("name"));
			dto.setUser_email(req.getParameter("email"));
			dto.setPhone(req.getParameter("phone"));			
//			dto.setZip_code(req.getParameter("zip_code"));
			dto.setAddress(req.getParameter("address"));
			System.out.println(dto);
			
			
			// 입력데이터 서비스 요청
//			int result = userService.addUser(dto);
						
			nextPage ="/order/login.do";
			resp.sendRedirect(req.getContextPath()+ nextPage);
			
			
			
			
		}else {
			
			
			nextPage ="/show/main.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}
		
	
		
		
	}// do hand
		
	
}// controller
