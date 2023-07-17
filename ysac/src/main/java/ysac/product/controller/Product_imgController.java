package ysac.product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product_img.do")
public class Product_imgController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\product_img";
//	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doHandler(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	
	}
	protected void doHandler (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		System.out.println("다운로드 페이지 뿌려주는중");
		String fileName = req.getParameter("pro_img");
		System.out.println(fileName);
		int product_code = Integer.parseInt(req.getParameter("product_code"));
		
		
		OutputStream out = resp.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO+"\\"+product_code+"\\"+fileName;
		
		File f = new File(downFile);
		resp.setHeader("Catch-Control", "no-cache"); // "no = cache" : 파일 이름을 유지
		resp.addHeader("Content-disposition","attachment; pro_img="+fileName);

		
		FileInputStream in = new FileInputStream(f);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
				
			}
			out.write(buffer,0,count);
		}
		in.close(); out.close();
		
		
		
	}
}
