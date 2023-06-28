package com.ex01.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.ManagerDAO;
import com.ex01.dao.MapperUtil;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.dto.ManagerDTO;
import com.ex01.dto.Manager_BoardDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.service.ManagerService;
import com.ex01.service.UsersService;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/order/*")
public class Controller extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\T_A\\src\\main\\webapp\\project_A_img";
	
	private ManagerService managerService = ManagerService.INSTANCE;
	private UsersService userService = UsersService.INSTANCE;
	private ImgNameController imgname = ImgNameController.INSTENS;
	
	private ModelMapper modelMapper;
	private ManagerMapper managerMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	
	
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
					nextPage ="/main.do";
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
			nextPage ="/main.do";
			req.getRequestDispatcher(nextPage).forward(req, resp);
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
			
		}else if(action.equals("/M_board.do")) { // 공지사항 등록 페이지 
			factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			session = factor.openSession();
			managerMapper = session.getMapper(ManagerMapper.class);
			
			managerMapper.getmanager_board();
			
			
			
			nextPage ="/project/m_boardform.jsp";
			resp.sendRedirect(req.getContextPath()+ nextPage);
		}else if(action.equals("/add_M_board.do")) { // 공지사항 데이터 등록 	
			factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
			session = factor.openSession();
			managerMapper = session.getMapper(ManagerMapper.class);
			
			
			
			Manager_BoardDTO dto = new Manager_BoardDTO();
			
//			dto.setArticleNO( Integer.parseInt(req.getParameter("articleNO")));
//			dto.setId(req.getParameter("id"));
//			dto.setTitle(req.getParameter("title"));
//			dto.setContent(req.getParameter("content"));
//			dto.setImageFileName(req.getParameter("imageFileName"));
			
			
			
			// 업로드 기능 있을때 호출
			Map<String, String> articleMap = upload(req, resp);// 업로드기능 호출
			
//			dto.setM_board(Integer.parseInt(articleMap.get("m_board")));
			dto.setM_board(managerMapper.getmanager_board());
			dto.setId(articleMap.get("id")) ;
			dto.setTitle(articleMap.get("title"));
			dto.setContent(articleMap.get("content"));
			dto.setName(articleMap.get("name"));
			dto.setImg_name (articleMap.get("img_name"));
			System.out.println(dto);
			
			// 서비스 호출 
			int result = managerService.addboard(dto);
				//첨부파일 있을 경우만 처리 	
			if (dto.getImg_name()!= null && dto.getImg_name().length() != 0) {
				// temp폴더에 임시로 보관된 파일경로 설정
				File srcFile = 
					new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+dto.getImg_name());
				
				//  ARTICLE_IMAGE_REPO 하위 경로에 글 번호 폴더를 생성: "d:\\file_repo\글번호폴더
				File descFile = new File(ARTICLE_IMAGE_REPO+"\\"+dto.getM_board());
				descFile.mkdirs();
				
				//temp폴더의 이미지 첨부파일을 글번호이름으로하는 폴더로 이동
				FileUtils.moveFileToDirectory(srcFile, descFile, true);
				
				
			}
			
			
			nextPage ="/users/m_board.do";
			resp.sendRedirect(req.getContextPath()+ nextPage);
		}else {

			
//			nextPage ="/show/main.jsp";
//			req.getRequestDispatcher(nextPage).forward(req, resp);
		}

		
	
		
		
	}// do hand
	//이미지 업로드 메서드 선언
			private Map<String, String> upload(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
				
				Map<String, String> articleMap = new HashMap<String,String>();
				String encoding = "utf-8";
				//문자열 -<> 시스템 파일로 변환
				File currentPath = new File(ARTICLE_IMAGE_REPO);
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				factory.setRepository(currentPath);
				factory.setSizeThreshold(1024*1024);
				
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				try {
					// req에 저장되어있는 매개변수를 List에 저장
					List<FileItem> items = upload.parseRequest(request);
					
					
					for(int i = 0; i < items.size(); i++) {
						
						FileItem fileItem = items.get(i);
						if(fileItem.isFormField()) { //form 요소이면
							System.out.println(fileItem.getFieldName() + fileItem.getString(encoding));
						
							articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
							
						}else {
							
							System.out.println("파라미터이름 : " + fileItem.getFieldName());
							System.out.println("파일 이름 : " + fileItem.getName() );
							System.out.println("파일 크기 : "+ fileItem.getSize());
							
							
							
							articleMap.put(fileItem.getFieldName(),fileItem.getName());
							
							if(fileItem.getSize() > 0) {
								int idx = fileItem.getName().lastIndexOf("\\");
								if(idx == -1) {
									idx = fileItem.getName().lastIndexOf("/");
									
								}
								
								String fileName = fileItem.getName().substring(idx +1);
								File uploadFile = new File(currentPath +"\\"+"temp"+"\\"+fileName);
								
								fileItem.write(uploadFile);
							}
							
						}
					}
					
				} catch (Exception e) {

				}
				
				return articleMap;
			}	
	
	
	
	
}// controller



