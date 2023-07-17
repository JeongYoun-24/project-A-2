package ysac.users.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import ysac.users.dto.UsersDTO;
import ysac.users.dto.UsersDTO2;
import ysac.users.service.UsersService;


@WebServlet("/users/loginPWD.do")
public class UsersPwdFindController extends HttpServlet{

	private UsersService usersService = UsersService.INSTANCE;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getPathInfo();
		String nextPage = null;
		
			nextPage = "/project/loginPWD.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getPathInfo();
		String nextPage = null;
	
			String user_id = req.getParameter("user_id");
			String user_name = req.getParameter("user_name");
			String user_email = req.getParameter("user_email");
			
			UsersDTO dto = UsersDTO.builder()
					.user_id(user_id)
					.user_name(user_name)
					.user_email(user_email)
					.build();
			String	user_pwd = usersService.findPWD(dto);
			System.out.println(user_pwd);
			req.setAttribute("user_pwd", user_pwd);
		
			nextPage ="/project/loginPWD.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
	}
}
