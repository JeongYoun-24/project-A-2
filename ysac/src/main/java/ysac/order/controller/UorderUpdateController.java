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

@WebServlet("/order/update")
public class UorderUpdateController extends HttpServlet {
    private UorderService uorderService;

    public UorderUpdateController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UorderDTO uorderDTO = UorderDTO.builder()
        		.order_code(request.getParameter("order_code"))
                .user_id(request.getParameter("user_id"))
                .order_status(Integer.parseInt(request.getParameter("order_status")))
            .build();

        uorderService.updateOrder(uorderDTO);
        response.sendRedirect(request.getContextPath() + "/order/detail?order_code=" + uorderDTO.getOrder_code() + "&user_id=" + uorderDTO.getUser_id());
    }
}
