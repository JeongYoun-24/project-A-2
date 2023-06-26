package com.ex01.dispacher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("*.do")
public class DispacherServlet extends HttpServlet {
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	private  String ctxPath;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1.요청 uri 추출 및 컨넥스트 경로 지정 
		String uri = req.getRequestURI();
		String path =  uri.substring(uri.lastIndexOf("/"));
		ctxPath = req.getContextPath();
		//String action = req.getPathInfo();
		
		//log.info(uri);
		//log.info(action);
		
		//2. path에 해당하는 Controller 검색 (추출)
		Controller controller = handlerMapping.getController(path);
		
		//3. 추출한 Controller 실행 
		String viewName = controller.handleRequest(req, resp);
		log.info("viewName : "+viewName);
		
		//4. viewResolver 를 통해 viewName에 해당하는 화면을 검색 
		String view = getNextViewPage(viewName);
		
		
//		if(!viewName.contains(".do")) {
//			if(viewName.equals("index")) {
//				view = viewName+".jsp";
//				
//			}else {
//				view = viewResolver.getView(viewName);
//			}
//			
//		}else {
//			view = viewName;			
//		}
		//5. 검색된 view 페이지러 이동하기 
		log.info("view : "+view);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
		
		
	}

	@Override
	public void init() throws ServletException {
	
		// url 에 해당되느 Controller 객체 생성 
		handlerMapping = new HandlerMapping();
		// view 페이지이동 하기 위해 view 페이지 사전 설정하는 객체  
		viewResolver = new ViewResolver();
		
		viewResolver.setPrefix("./WEB-INF/project/");
		viewResolver.setSuffix(".jsp");
		
	}

	// viewName에서 이동할 페이지 경로 및 파일명 최종 추출 
	public String getNextViewPage(String viewName) {
		String view ="";
		if(!viewName.contains(".do")) {
			if(viewName.equals("index")) {
				view = viewName+".jsp";
				
			}else {
				view = viewResolver.getView(viewName);
			}
			
		}else {
			view = viewName;			
		}
		
		
		
		return view;
	}
	
	
	
}
