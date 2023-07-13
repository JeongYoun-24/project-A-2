package ysac.product.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.product.dto.ProductDTO;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/productAdd")
public class ProductAddController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String product_code = request.getParameter("product_code");
        String category = request.getParameter("category");
        String pro_name = request.getParameter("pro_name");
        String pro_info = request.getParameter("pro_info");
        int pro_price = Integer.parseInt(request.getParameter("pro_price"));
        int pro_stock = Integer.parseInt(request.getParameter("pro_stock"));
        String pro_img = request.getParameter("pro_img");

        ProductDTO product = ProductDTO.builder()
            .product_code(product_code)
            .category(category)
            .pro_name(pro_name)
            .pro_info(pro_info)
            .pro_price(pro_price)
            .pro_stock(pro_stock)
            .pro_img(pro_img)
            .build();

        productService.productAdd(product);
        try {
			response.sendRedirect("/productList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}