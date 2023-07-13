package ysac.users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import lombok.extern.log4j.Log4j2;
import ysac.manager.service.ManagerService;
import ysac.users.dto.UsersDTO;
import ysac.users.service.UsersService;


@Log4j2
@WebServlet("/users/usersLogin")
public class UsersLoginController extends HttpServlet{

	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		nextPage = "/project/login.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		log.info("/login post.....");

		//db에 회원여부 확인 후 로그인 상태로 전환
		UsersService service = UsersService.INSTANCE;
		ManagerService m_serverce = ManagerService.INSTANCE;
		
		req.setCharacterEncoding("utf-8");
		String user_id = req.getParameter("user_id");
		String user_pwd = req.getParameter("user_pwd");
		String login_auto = req.getParameter("auto");
		
		//클라이언트에서 json 구조 형식 데이터를 ajax 로 보냈을 경우
		String logindata = req.getParameter("logindata");
		System.out.println(logindata);
		
		JSONObject jsonObject = null;
		JSONParser jsonParser = new JSONParser(); //json 객체 변환
		try {
			jsonObject = (JSONObject)jsonParser.parse(logindata);
			System.out.println(jsonObject);
			System.out.println(jsonObject.get("user_id"));
			
			user_id = (String) jsonObject.get("user_id");
			user_pwd = (String) jsonObject.get("user_pwd");
			login_auto = (String) jsonObject.get("auto");
			
			System.out.println(user_id);
			System.out.println(user_pwd);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		

		
		
		UsersDTO member = null;
		
		log.info("login_auto => "+login_auto);

		//자동 로그인 체크 on과 null의 값 
		boolean rememberMe = login_auto != null && login_auto.equals("on");
		int isOk =0;
		try {
			member = service.login(user_id);
			

			String memberId = member.getUser_id();
			String memberPwd = member.getUser_pwd();
			
			System.out.println(member);
			
			
			
			
			if(memberId.equals(user_id)) {
				
				if(memberPwd.equals(user_pwd)) {
					
					isOk = 1;
					HttpSession session = req.getSession();
					session.setAttribute("loginInfo", member.getUser_id());
					
				}else {
					isOk=2;
					System.out.println("비밀번호 틀림");
				}
				
				
			}else {
				isOk= -1;
				System.out.println("아이디 정보 없음");
				
			}
			
			
			//1. text타입으로 응답
			resp.setContentType("text/plane; charset=utf-8");
			
			//2. html 타입으로 응답
			//resp.setContentType("text/html; charset=utf-8");
			PrintWriter pw = resp.getWriter();
			
			JSONObject sendData = new JSONObject();
			
			
			
			if(isOk ==1) {
			
				//pw.print("<script> alert('로그인성공');  location.href='/web01/boardlist/list.do'</script>");
				sendData.put("code", "ok");
				sendData.put("message", "로그인승인");
				pw.print(sendData);
				
			}else if(isOk == 2) {
				//pw.print("<script> alert('비밀번호 틀림');  location.href='/web01/login'</script>");
				sendData.put("code", "pw_fail");
				sendData.put("message", "비밀번호틀림");
				pw.print(sendData);
				
			}else {
				//pw.print("<script> alert('로그인 실패');  location.href='/web01/login'</script>");
				
				resp.sendRedirect("/T_A/login.do");
				
				
				sendData.put("code", "id_fail");
				sendData.put("message", "아이디틀림");
				pw.print(sendData);
				
			}
			
			
			
			
			/*
			//자동 로그인 등록 처리
			if(rememberMe) {
				//랜덤 아이디 값 얻기
				 String uuid = UUID.randomUUID().toString();
				 System.out.println(uuid);
				 
				 service.updateUuid(user_id, uuid);
				 
				 member.setUuid(uuid);
				 
				 //---------------------
				 
				 Cookie rememberCookie = new Cookie("remember-me", uuid);
				 rememberCookie.setMaxAge(24*60*60);
				 rememberCookie.setPath("/");
				 
				 resp.addCookie(rememberCookie);
				 
				 
				 
			}
			*/
			
			
//			HttpSession session = req.getSession();
//			session.setAttribute("loginInfo", memberDTO);
//			resp.sendRedirect(req.getContextPath() + "/todo/list");
			
			
			
		
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/login?result=error");
			
			e.printStackTrace();
		}

	}
		
}