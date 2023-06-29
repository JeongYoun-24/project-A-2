package com.ex01.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import com.ex01.dto.ManagerDTO;
import com.ex01.dto.Manager_BoardDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.dto.UsersDTO2;
import com.ex01.service.ManagerService;
import com.ex01.service.UsersService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/users/*")
public class ControllerTest extends HttpServlet {
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
		req.setCharacterEncoding("utf-8");
		String action = req.getPathInfo();
		String nextPage = null;

		if (action == null || action.equals("/main2.do")) {// 메인 페이지

		} else if (action.equals("/loginPage.do")) { // 로그인 페이지

			nextPage = "/project/login.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		} else if (action.equals("/userForm.do")) { // 회원가입 페이지

			nextPage = "/project/join.jsp";
			resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/userinsert.do")) { // 회원가입 데이터
			String user_id = req.getParameter("user_id");
			String user_pwd = req.getParameter("user_pwd");
			String user_name = req.getParameter("user_name");
			String user_email = req.getParameter("user_email");
			String phone = req.getParameter("phone");

			UsersDTO2 dto = new UsersDTO2();
			dto.setUser_id(req.getParameter("user_id"));
			dto.setUser_pwd(req.getParameter("user_pwd"));
			dto.setUser_name(req.getParameter("user_name"));
			dto.setUser_email(req.getParameter("user_email"));
			dto.setPhone(req.getParameter("phone"));
			System.out.println(dto);
			int result = 0;
			// 입력데이터 서비스 요청
			System.out.println(result);
			result = userService.insert(dto);
			System.out.println(result);
			PrintWriter pw = resp.getWriter();
			//	resp.setContentType("text/html; charset=utf-8");
				
				resp.setContentType("text/plane; charset=utf-8");
				
				JSONObject sendData = new JSONObject();
				
				
				
				  if(result ==1) {
					  sendData.put("code", "ok");
						sendData.put("message", "로그인승인");
						pw.print(sendData);
					  
				  }else {
					  
						sendData.put("code", "id_fail");
						sendData.put("message", "로그인실패");
						pw.print(sendData);
				  }
			 
			nextPage = "/users/loginPage.do";
			resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/myinfo.do")) { // 회원정보 수정 페이지
			String user_id = req.getParameter("user_id");
//			System.out.println(user_id);
			UsersDTO2 dto = userService.login2(user_id);
//			System.out.println(dto);
			req.setAttribute("users", dto);
			nextPage = "/project/myinfo.jsp";
//			resp.sendRedirect(req.getContextPath() + nextPage);
			req.getRequestDispatcher(nextPage).forward(req, resp);
		} else if (action.equals("/U_update.do")) { // 회원정보 수정 데이터

			String user_id = req.getParameter("user_id");
			String user_pwd = req.getParameter("user_pwd");
			String user_name = req.getParameter("user_name");
			String user_email = req.getParameter("user_email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String birthdate = req.getParameter("birthdate");
			
			UsersDTO dto = UsersDTO.builder()
					.user_id(user_id)
					.user_pwd(user_pwd)
					.user_name(user_name)
					.user_email(user_email)
					.phone(phone)
					.address(address)
					.birthdate(birthdate)
					.build();
			
			System.out.println(dto);
			int result = 0;
			
			result = userService.update(dto);
			System.out.println(result);
			PrintWriter pw = resp.getWriter();
			//	resp.setContentType("text/html; charset=utf-8");
				resp.setContentType("text/plane; charset=utf-8");
				
				JSONObject sendData = new JSONObject();
				
				  if(result ==1) {
					  sendData.put("code", "ok");
						sendData.put("message", "수정 완료");
						pw.print(sendData);
					  
				  }else {
					  
						sendData.put("code", "id_fail");
						sendData.put("message", "수정실패");
						pw.print(sendData);
				  }
			
				  nextPage = "/main.do";
					resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/U_delete.do")) { // 회원 정보 삭제
			String user_id = req.getParameter("user_id");		
			
			System.out.println(user_id);
			int result =0;
			result = userService.delete(user_id);
			System.out.println(result);
			
			nextPage = "/order/logout.do";
//			nextPage = "/main.do";
			resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/m_board.do")) { // 공지사항 페이지
			List<Manager_BoardDTO> memberList = userService.boardList();
			System.out.println(memberList);
			req.setAttribute("doardList", memberList);
			
			nextPage ="/project/m_board.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
			
//			nextPage = "/project/m_board.jsp";
//			resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/m_boardview.do")) { // 공지사항 상세 페이지
			int m_board = Integer.parseInt(req.getParameter("m_board"));
//			int m_board =req.getIntHeader("m_board");
			System.out.println("m_board 값 :"+m_board);
			
			int dto = managerService.hitCount(m_board);
			log.info(dto);
			Manager_BoardDTO article = managerService.boardfind(m_board);
			log.info("------------");
			log.info(m_board);
			req.setAttribute("boardfind", article);
			
			nextPage ="/project_board/boardview.jsp";
//			nextPage ="/project/boardtest.jsp";
//			resp.sendRedirect(req.getContextPath() + nextPage);
			req.getRequestDispatcher(nextPage).forward(req, resp);
		} else if (action.equals("/cart.do")) { // 장바구니 페이지
			
			nextPage = "/project/cart.jsp";
			resp.sendRedirect(req.getContextPath() + nextPage);
			
		} else if (action.equals("/order.do")) { // 상품 페이지 	
			
			
			nextPage = "/project/menule.jsp";
			resp.sendRedirect(req.getContextPath() + nextPage);
//			${ctxPath}/users/cart.do
			
		} else if (action.equals("/mypage.do")) { // 회원 정보 상세 페이지	
			
			
			nextPage = "/project/menule.jsp";
			resp.sendRedirect(req.getContextPath() + nextPage);
		} else if (action.equals("/managerlogin.do")) { // 관리자 로그인 페이지 
			
			nextPage = "/project/managerlogin.jsp";
			resp.sendRedirect(req.getContextPath() + nextPage);
		} else {

		}

	}

}
