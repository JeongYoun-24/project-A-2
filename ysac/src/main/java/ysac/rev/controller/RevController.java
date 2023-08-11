package ysac.rev.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

//import com.ex01.controller.ImgNameController;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.RevMapper;

import ysac.manager.service.ManagerService;
import ysac.product.dto.ProductDTO;
import ysac.qna.dto.QnaDTO;
import ysac.qna.service.QnaService;
import ysac.rev.dto.RevDTO;
import ysac.rev.service.RevService;
import ysac.users.service.UsersService;

@WebServlet("/rev/*")
public class RevController  extends HttpServlet{
private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\product_img";
	
	private ManagerService managerService = ManagerService.INSTANCE;
	private UsersService userService = UsersService.INSTANCE;
//	private ImgNameController imgname = ImgNameController.INSTENS;
	private RevService revService = RevService.INSTANCE;
	private QnaService qnaService = QnaService.INSTANCE;
//	private ModelMapper modelMapper;
//	private ManagerMapper managerMapper;
//	private SqlSessionFactory factor;
//	private SqlSession session;
//	private RevMapper revMapper;
	
	
	
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
		
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
	
		if(action == null || action.equals("/main.do")) {// 메인 페이지 
			
		
		}else if(action.equals("/revList.do")) { // 상품 상세 페이지 
			String product_code = req.getParameter("product_code");
//			String product_code ="1";
			ProductDTO product = revService.findProductlist(product_code);
			req.setAttribute("proList", product);
			
			List<RevDTO> list = revService.RevAllList(product_code);
			
			System.out.println("-=-=-=-=-=-=-=-="+list);
			req.setAttribute("RevList", list);
			
			List<QnaDTO> list2 =qnaService.AllList(product_code);
			
			System.out.println(list2);
			
			req.setAttribute("QnaList", list2);
			
			nextPage ="/project/menule.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}else if(action.equals("/revFind.do")) { // 상품 상세 페이지 	
			String rev_code = req.getParameter("rev_code");
			System.out.println("-----------=-=-=-=-=-=--="+rev_code);
			
			
			RevDTO revDTO = revService.RevFindList(rev_code);
			
			req.setAttribute("revfind", revDTO);
			
			
			
			nextPage ="/project_rev/revFind.jsp";
			req.getRequestDispatcher(nextPage).forward(req, resp);
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



