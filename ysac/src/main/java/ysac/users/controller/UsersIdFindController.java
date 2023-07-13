package ysac.users.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.users.dto.UsersDTO;
import ysac.users.service.UsersService;

@WebServlet("/usersId")
public class UsersIdFindController extends HttpServlet{

	private UsersService usersService = UsersService.INSTANCE;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		nextPage = "/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UsersDTO dto = UsersDTO.builder()
				.user_name(req.getParameter("user_name"))
				.user_email(req.getParameter("user_email"))
				.build();
		String	user_id = usersService.findID(dto);
		
		req.setAttribute("user_id", user_id);
		
		nextPage ="/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
}
