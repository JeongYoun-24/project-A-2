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
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import lombok.extern.log4j.Log4j2;
import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.manager_board.service.Manager_BoardService;
import ysac.product.dto.ProductDTO;
import ysac.product.service.ProService;
import ysac.rev.dto.RevDTO;
import ysac.rev.mapper.RevMapper;
import ysac.rev.service.RevService;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;


@Log4j2
@WebServlet("/pro/revForm")
public class RevInsrtController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\project_rev_img";
	private Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	private RevService revService = RevService.INSTANCE;
	private ProService proService = ProService.INSTANCE;
	private RevMapper revMapper;
	private UsersMapper usersMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getPathInfo();
		String nextPage = null;
		
	
		
//		String product_code = req.getParameter("product_code");
//		System.out.println("-------------"+product_code);
		
		int product_code = Integer.parseInt(req.getParameter("product_code"));
//		int m_board =req.getIntHeader("m_board");
		System.out.println("m_board 값 :"+product_code);
		
		ProductDTO article = proService.profind(product_code);
		log.info("------------");
		log.info(product_code);
		req.setAttribute("proDTO", article);
		
		
		
		
		nextPage ="/project_rev/revForm.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getPathInfo();
		String nextPage = null;
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);
		int rev_code = usersMapper.getproduct_rev();
		
		
//		int product_code = Integer.parseInt(req.getParameter("product_code"));
//		String user_id = req.getParameter("user_id");
	
		
//		int product_code = 1;
		
		
		Map<String, String> articleMap = upload(req, resp);// 업로드기능 호출
		
		int result2 = Integer.parseInt(articleMap.get("product_code"));
		System.out.println(result2);
		
		
		
//		int rev_code = Integer.parseInt(articleMap.get("rev_code"));
//		int product_code = Integer.parseInt(articleMap.get("product_code"));
		System.out.println();
		
//		String product_code = req.getParameter("product_code");
		
//		ProductDTO article = proService.profind(product_code);
		RevDTO dto = new  RevDTO();	

//		dto.setRev_code(revMapper.getproduct_rev());
		dto.setRev_code(rev_code);
		dto.setProduct_code(Integer.parseInt(articleMap.get("product_code")));
		dto.setUser_id(articleMap.get("user_id"));
		dto.setRev_title(articleMap.get("rev_title"));
		dto.setRev_content(articleMap.get("rev_content"));
		dto.setRev_img(articleMap.get("rev_img"));
		
		System.out.println(dto.getProduct_code());
		System.out.println(dto.getRev_code());
		System.out.println(dto.getUser_id());
		

		
		
		
//				.product_code(Integer.parseInt( articleMap.get("m_board")));
		System.out.println(111);
		
		int result=	 revService.RevInsert(dto);
//		System.out.println(result);
		
		if (dto.getRev_img()!= null && dto.getRev_img().length() != 0) {
			// temp폴더에 임시로 보관된 파일경로 설정
			File srcFile = 
				new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+dto.getRev_img());
			
			//  ARTICLE_IMAGE_REPO 하위 경로에 글 번호 폴더를 생성: "d:\\file_repo\글번호폴더
			File descFile = new File(ARTICLE_IMAGE_REPO+"\\"+dto.getRev_code());
			descFile.mkdirs();
			
			//temp폴더의 이미지 첨부파일을 글번호이름으로하는 폴더로 이동
			FileUtils.moveFileToDirectory(srcFile, descFile, true);
		}
		
		
		
		
		
		
		nextPage ="/main.do";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	
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
	
	
	
	
}
