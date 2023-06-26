package com.ex01.dispacher;

import java.util.HashMap;
import java.util.Map;

import com.ex01.dispacher.controller.MainController;
import com.ex01.dispacher.controller.ProductListController;



public class HandlerMapping {

	
	public Map<String ,Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap();
		
		mappings.put("/productList.do", new ProductListController()); // 상품 전체 페이지
		mappings.put("/main.do", new MainController()); // 메인 페이지 
		
		
		
	}
	
	public Controller getController(String path) {
		
		// Map에 등록된 Controller들 중에서 특정 경로에 해당하는  Controller 반환 
		//  url : Controller => 1:1맵핑
		
		return mappings.get(path);
	}
	
	
}
