package ysac.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex01.dto.RevDTO;

import ysac.product.dto.ProductDTO;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/product/get")
public class ProductViewController extends HttpServlet {
    private ProductService productService;

    public ProductViewController() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String product_code = request.getParameter("product_code");
//        ProductDTO productDTO = productService.proCodeSelectOne(product_code);
//        request.setAttribute("productDTO", productDTO);
        
//        request.getRequestDispatcher("/productView.jsp").forward(request, response);
    	
//		String product_code = req.getParameter("product_code");
//		String product_code ="1";
//		ProductDTO product = revService.findProductlist(product_code);
//		req.setAttribute("proList", product);
//		
//	
//		
//		List<RevDTO> list = revService.RevAllList(product_code);
//		req.setAttribute("RevList", list);
//		
//		nextPage ="/project/menule.jsp";
//		req.getRequestDispatcher(nextPage).forward(req, resp);
		
//		String product_code = req.getParameter("product_code");
		String product_code ="1";
//		ProductDTO product = revService.findProductlist(product_code);
//		request.setAttribute("proList", product);
//
//		List<RevDTO> list = revService.RevAllList(product_code);
//		request.setAttribute("RevList", list);

    	
    	String nextPage = null;
    	nextPage ="/project/menule.jsp";
    	request.getRequestDispatcher(nextPage).forward(request, response);
    	
//        request.getRequestDispatcher("/menule.jsp").forward(request, response);
    }
    
}