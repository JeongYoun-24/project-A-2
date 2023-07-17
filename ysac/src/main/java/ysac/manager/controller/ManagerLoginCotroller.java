package ysac.manager.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONObject;
import org.modelmapper.ModelMapper;


import com.mapper.mybatis.ManagerMapper;

import lombok.extern.log4j.Log4j2;
import ysac.manager.dto.ManagerDTO;
import ysac.manager.service.ManagerService;
import ysac.users.service.UsersService;


@Log4j2
@WebServlet("/users/managerlogin.do")
public class ManagerLoginCotroller extends HttpServlet {

	String nextPage = "";
	private ManagerService managerService = ManagerService.INSTANCE;
	private UsersService userService = UsersService.INSTANCE;
//	private ImgNameController imgname = ImgNameController.INSTENS;
	
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info("/login Get.....");
			String ctxPath = req.getContextPath();
			
			
			
			
			
			nextPage = "/project/managerlogin.jsp";
			resp.sendRedirect(req.getContextPath()+nextPage);
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			log.info("/login post.....");
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			System.out.println(id);
			System.out.println(pwd);
		
			ManagerDTO manager = new ManagerDTO();
			
			manager = managerService.login(id);

			System.out.println(manager);
			String memberId = manager.getId();
			String memberPwd = manager.getPwd();
			
			System.out.println(memberId);
			System.out.println(memberPwd);
			
			int isOK =0;
			if(memberId.equals(id)) { // 아이디 일치
				if(memberPwd.equals(pwd)) { // 비밀번호 일치
					isOK =1;
					HttpSession session =req.getSession();
					session.setAttribute("manager", manager.getName());
					session.setAttribute("managerid", manager.getId());
					req.getRequestDispatcher(nextPage).forward(req, resp);
					if(session.isNew()) {
						session.setAttribute("manager", manager.getName());
						session.setAttribute("managerid", manager.getId());
						
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
			System.out.println(isOK);
			//1. text타입으로 응답
			resp.setContentType("text/plane; charset=utf-8");
			
			//2. html 타입으로 응답
			//resp.setContentType("text/html; charset=utf-8");
			PrintWriter pw = resp.getWriter();
			
			JSONObject sendData = new JSONObject();
			
			
			
			if(isOK ==1) {
			System.out.println("로그인승인");
				pw.print("로그인승인");
				
			}else if(isOK == 2) {
			
				pw.print("비밀번호");
				
			}else {
				//pw.print("<script> alert('로그인 실패');  location.href='/web01/login'</script>");
				
				
				pw.print("로그인오류");
				
			}
			
			
			
			
//			nextPage ="/users/managerlogin.do";
//			req.getRequestDispatcher(nextPage).forward(req, resp);
			
		
			
			/*
			
		
			
			//db에 회원여부 확인 후 로그인 상태로 전환
			ManagerService service = ManagerService.INSTANCE;
			
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
//			String login_auto = req.getParameter("auto");
			
			//클라이언트에서 json 구조 형식 데이터를 ajax 로 보냈을 경우
			String logindata = req.getParameter("logindata");
			System.out.println("1"+logindata);
			
			JSONObject jsonObject = null;
			JSONParser jsonParser = new JSONParser(); //json 객체 변환
			try {
				jsonObject = (JSONObject)jsonParser.parse(logindata);
				System.out.println("2"+jsonObject);
				System.out.println("3"+jsonObject.get("id"));
				
				id = (String) jsonObject.get("id");
				pwd = (String) jsonObject.get("pwd");
//				login_auto = (String) jsonObject.get("auto");
				
				System.out.println(id);
				System.out.println(pwd);
				
				
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			

			
			
			ManagerDTO member = null;
//			log.info("login_auto => "+login_auto);

			//자동 로그인 체크 on과 null의 값 
//			boolean rememberMe = login_auto != null && login_auto.equals("on");
			int isOk =0;
			try {
				
				member = service.login(id);
				
				String memberId = member.getId();
				String memberPwd = member.getPwd();
				if(memberId.equals(id)) {
					
					if(memberPwd.equals(pwd)) {
						
						isOk = 1;
						HttpSession session = req.getSession();
						session.setAttribute("loginInfo", member.getName());
						
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
					
					resp.sendRedirect("/web01/login.do");
					
					
					sendData.put("code", "id_fail");
					sendData.put("message", "아이디틀림");
					pw.print(sendData);
					
				}
				
				
				
				
				
//				//자동 로그인 등록 처리
//				if(rememberMe) {
//					//랜덤 아이디 값 얻기
//					 String uuid = UUID.randomUUID().toString();
//					 System.out.println(uuid);
//					 
//					 service.updateUuid(user_id, uuid);
//					 
//					 member.setUuid(uuid);
//					 
//					 //---------------------
//					 
//					 Cookie rememberCookie = new Cookie("remember-me", uuid);
//					 rememberCookie.setMaxAge(24*60*60);
//					 rememberCookie.setPath("/");
//					 
//					 resp.addCookie(rememberCookie);
//					 
//					 
//					 
//				}
				
				
				
//				HttpSession session = req.getSession();
//				session.setAttribute("loginInfo", memberDTO);
//				resp.sendRedirect(req.getContextPath() + "/todo/list");
				
				
				
			
			} catch (Exception e) {
				resp.sendRedirect(req.getContextPath() + "/login?result=error");
				
				e.printStackTrace();
			}
			 	*/
		}
			
	}
	
	
	
	
