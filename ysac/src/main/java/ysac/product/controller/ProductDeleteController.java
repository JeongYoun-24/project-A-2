package ysac.product.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/productDelete")
public class ProductDeleteController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String product_code = request.getParameter("product_code");

        productService.productDelete(product_code);
        try {
			response.sendRedirect("/productList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}