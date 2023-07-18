package ysac.users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import ysac.users.dto.UsersDTO;
import ysac.users.service.UsersService;


@WebServlet("/users/usersInfo")
public class UsersInfoController extends HttpServlet{

	private UsersService usersService = UsersService.INSTANCE;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		UsersDTO dto = usersService.login2(req.getParameter("user_id"));
		req.setAttribute("users", dto);
		
		nextPage = "/project/myinfo.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		
		result = usersService.update(dto);
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
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String user_id = req.getParameter("user_id");
//		System.out.println("111");
//		System.out.println(user_id);
//		
//		int result =0;
//		result = usersService.delete(req.getParameter("user_id"));
//		
//		System.out.println(result);
//		
//		nextPage = "/logout";
//		resp.sendRedirect(req.getContextPath() + nextPage);
	}
	
}
