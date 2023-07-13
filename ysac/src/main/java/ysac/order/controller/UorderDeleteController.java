package ysac.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;

@WebServlet("/order/delete")
public class UorderDeleteController extends HttpServlet {
    private UorderService uorderService;

    public UorderDeleteController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_code = Integer.parseInt(request.getParameter("order_code"));
        String user_id = request.getParameter("user_id");

        uorderService.deleteOrder(order_code, user_id);
        response.sendRedirect(request.getContextPath() + "/order/list");
    }
}