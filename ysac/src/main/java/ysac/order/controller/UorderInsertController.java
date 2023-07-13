package ysac.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.order.dto.UorderDTO;
import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;

@WebServlet("/order/insert")
public class UorderInsertController extends HttpServlet {
    private UorderService uorderService;

    public UorderInsertController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UorderDTO uorderDTO = UorderDTO.builder()
    		.order_code(request.getParameter("order_code"))
			.user_id(request.getParameter("user_id"))
			.product_code(request.getParameter("product_code"))
			.pro_price(Integer.parseInt(request.getParameter("pro_price")))
			.order_img(request.getParameter("order_img"))
			.order_comment(request.getParameter("order_comment"))
			.name(request.getParameter("name"))
			.address(request.getParameter("address"))
			.phone(request.getParameter("phone"))
			.pro_name(request.getParameter("pro_name"))
			.order_status(Integer.parseInt(request.getParameter("order_status")))
			.pro_qty(request.getParameter("pro_qty"))
			.build();

        uorderService.insertOrder(uorderDTO);
        response.sendRedirect(request.getContextPath() + "/order/list");
    }
}