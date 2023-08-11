package ysac.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import lombok.extern.log4j.Log4j2;
import ysac.cart.dto.CartDTO;
import ysac.cart.dto.CartJoinDTO;
import ysac.cart.service.CartService;
import ysac.cart.service.CartServiceImpl;

@Log4j2
@WebServlet("/cartList")
public class CartlistController extends HttpServlet {

	 private CartService cartService = new CartServiceImpl();
	    String action = null;
	    String nextPage = null;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		int cart = 1;
		
		log.info(user_id);
		
		
		
		List<CartJoinDTO> cartDTO =cartService.getCartById2(user_id);
		log.info(cartDTO);
		
		req.setAttribute("cartDTO",cartDTO);
		
		
		nextPage ="/project/cart.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     PrintWriter pw = resp.getWriter();
				//	resp.setContentType("text/html; charset=utf-8");
					resp.setContentType("text/plane; charset=utf-8");
					
					JSONObject sendData = new JSONObject();
					
				
		
		
		log.info("장바구니 등록 요청");
//		String user_id = req.getParameter("user_id");
//		log.info(user_id);
		String user_id = req.getParameter("user_id");
		String product_code = req.getParameter("product_code");
		int cart_qty = (Integer.parseInt(req.getParameter("pro_qty")));
	
		
		
		
		log.info(user_id);
		log.info(product_code);
		log.info(cart_qty);
		
		
		int result = 0;
		
		 CartDTO cartDTO = new CartDTO();
		 cartDTO.setUser_id(user_id);
	        cartDTO.setProduct_code(req.getParameter("product_code"));
	        cartDTO.setPro_qty(Integer.parseInt(req.getParameter("pro_qty")));
	        log.info(cartDTO);
	        
	        
	        if(cartDTO.getUser_id() == null){
				 sendData.put("code", "idError");
			 		sendData.put("message", "장바구니 오류");
			 		pw.print(sendData);
			}else {
				 result = cartService.insertCart(cartDTO);
			      System.out.println("성공값 ="+result);
			      
				
			}
			
	      
	    
	 				
	 	if(result ==1) {
	 		 sendData.put("code", "ok");
		 		sendData.put("message", "장바구니 저장");
		 		pw.print(sendData);
	 					  
	 	}else {
	 			sendData.put("code", "carterror");
	 			sendData.put("message", "장바구니 저장실패 ");
	 			pw.print(sendData);
	 	}
	        
	      
	      
	        
	        
	        
	        
		
	}
	
	
	
	
	
	
}
