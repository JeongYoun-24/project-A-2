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

@WebServlet("/order/detail")
public class UorderViewController extends HttpServlet {
    private UorderService uorderService;

    public UorderViewController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_code = Integer.parseInt(request.getParameter("order_code"));
        String user_id = request.getParameter("user_id");

        UorderDTO uorderDTO = uorderService.getOrderById(order_code, user_id);
        request.setAttribute("order", uorderDTO);
        request.getRequestDispatcher("/order_detail.jsp").forward(request, response);
    }
}