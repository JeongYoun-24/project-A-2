package ysac.users.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;
import ysac.users.dto.UsersDTO;
import ysac.users.service.UsersService;

@Log4j2
@WebServlet("/users/loginID.do")
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
		
		log.info("클라이언트에게서 받은 송신 데이터 :"+dto.getUser_name());
		log.info("클라이언트에게서 받은 송신 데이터 :"+dto.getUser_email());
		
		
		req.setAttribute("user_id", user_id);
	
		
		
		
		nextPage ="/project/loginID.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
}
