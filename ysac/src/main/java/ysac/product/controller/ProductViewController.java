package ysac.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        String product_code = request.getParameter("product_code");
        ProductDTO productDTO = productService.proCodeSelectOne(product_code);
        request.setAttribute("productDTO", productDTO);
        request.getRequestDispatcher("/productView.jsp").forward(request, response);
    }
    
}