package ysac.main.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.product.dto.ProductDTO;
import ysac.product.service.ProService;
import ysac.product.service.ProductService;
import ysac.users.service.UsersService;




@WebServlet("/main.do")
public class MainController extends HttpServlet {
	String nextPage = null;

	private UsersService servicecall = UsersService.INSTANCE;
	private ProService service = ProService.INSTANCE;
	private	ProductService productService ;
		
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductDTO> list = service.proList();
		req.setAttribute("proList", list);
		
		List<ProductDTO> list2 = service.proList2();
		req.setAttribute("proList2", list2);
		
		
		
		
		nextPage = "/project/spmmain.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		
		
	}
	
	
	
}
