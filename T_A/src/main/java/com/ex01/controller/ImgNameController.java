package com.ex01.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import lombok.extern.log4j.Log4j2;

@Log4j2
public enum ImgNameController {

	INSTENS;
	private static String ARTICLE_IAMGE_REPO = "c:/file";
	
	
	private ImgNameController () {
		
	}
	
	
	
	private Map<String, String > upload(HttpServletRequest req , HttpServletResponse resp)throws ServletException, IOException {
		
		Map<String, String > articleMap = new HashMap<String,String>();
		String encoding = "utf-8";
		
		// 문자열 -> 시스템 파일로 변환 
		File currentPath = new File(ARTICLE_IAMGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setRepository(currentPath);
		factory.setSizeThreshold(1024*1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			// request 에 저장되어 잇는 매개변수를 List에 저장 
			List<FileItem> items = upload.parseRequest(req);
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				
				if(fileItem.isFormField()) { // form 요소이면
					log.info(fileItem.getFieldName()+"="+fileItem.getString(encoding));
					
					// 게시글 등록 => 등등...
					articleMap.put(fileItem.getFieldName(),fileItem.getString(encoding));
				
				}else { // 아니면 
					// file 객체이면 처리 
					log.info("파라미터이름 : "+ fileItem.getFieldName());
					log.info("파일이름 : "+fileItem.getName());
					log.info("파일크기 : "+fileItem.getSize()+"byte");
					
					articleMap.put(fileItem.getFieldName(),fileItem.getName());
					
					if(fileItem.getSize()>0) {
						String separator = File.separator;
						
						
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx+1);
						// curentPath = ""
//						File uploadFile = new File(currentPath+"\\"+fileName);
						File uploadFile = new File(currentPath+"\\"+"temp"+"\\"+fileName);
						
						// 파일시스템으로 전환된 파일경로+파일이름 을 업로드 실행 
						fileItem.write(uploadFile);
						
						
					} //if (file size)
					
				}// if (file 객체)
				
			}// for()
			
			
			
		} catch (Exception e) {}
		
		
		return articleMap;
	};
	
	
}
