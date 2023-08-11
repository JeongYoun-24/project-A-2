package ysac.qna.controller;

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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import lombok.extern.log4j.Log4j2;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.product.dto.ProductDTO;
import ysac.product.service.ProService;
import ysac.product.service.ProductService;
import ysac.qna.dto.QnaDTO;
import ysac.qna.mapper.QnaMapper;
import ysac.qna.service.QnaService;
import ysac.rev.dto.RevDTO;
import ysac.util.ConnectionOracleUtil;


@Log4j2
@WebServlet("/qna/insert")
public class QnainsertController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\project_qna_img";
	private ProService proService = ProService.INSTANCE;
	private QnaMapper qnaMapper;
	private QnaService qnaService = QnaService.INSTANCE;
	
	private SqlSessionFactory factor;
	private SqlSession session;
	String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int product_code = Integer.parseInt(req.getParameter("product_code"));
//		int m_board =req.getIntHeader("m_board");
		System.out.println("m_board 값 :"+product_code);
		
		ProductDTO article = proService.profind(product_code);
		log.info("------------");
		log.info(product_code);
		req.setAttribute("proDTO", article);
		
		
		nextPage = "/project_qna/users_QnA.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("문의 등록 데이터 들어옵니다. 받으시오 ");
		
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		qnaMapper = session.getMapper(QnaMapper.class);
		
		int qna_code = qnaMapper.getQna();
		System.out.println(qna_code);
		
		Map<String, String> articleMap = upload(req, resp);//
		QnaDTO dto = new  QnaDTO();	
		
		dto.setQna_code(qna_code);
		dto.setProduct_code(Integer.parseInt(articleMap.get("product_code")));
		dto.setUser_id(articleMap.get("user_id"));
		dto.setQna_title(articleMap.get("qna_title"));
		dto.setQna_content(articleMap.get("qna_content"));
		dto.setQna_img(articleMap.get("qna_img"));
		
		System.out.println(dto);
		int result=	qnaService.insert(dto);
		System.out.println(result);
		
//		req.setAttribute("massage", dto);
		PrintWriter pw = resp.getWriter();
		resp.setContentType("text/html; charset=utf-8");
		
		if(result ==1) {
			pw.print("<script> alert('문의등록 완료');  location.href='/ysac/qna/insert'</script>");
			
		}else {
			pw.print("<script> alert('문의등록 실패');  location.href='/ysac/qna/insert'</script>");
			
		}
		
		
		
		nextPage = "/main.do";
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

