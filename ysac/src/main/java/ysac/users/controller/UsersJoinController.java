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
import ysac.users.dto.UsersDTO2;
import ysac.users.service.UsersService;


@WebServlet("/users/usersJoin")
public class UsersJoinController extends HttpServlet{

	private UsersService usersService = UsersService.INSTANCE;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		nextPage = "/project/join.jsp";
		resp.sendRedirect(req.getContextPath() + nextPage);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		result = usersService.insert(dto);
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
					sendData.put("message", "회원가입 실패 ");
					pw.print(sendData);
			  }
		 
//		nextPage = "/users/loginPage.do";
//		resp.sendRedirect(req.getContextPath() + nextPage);
	}
}
