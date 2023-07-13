package ysac.order.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.order.dto.UorderDTO;
import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;

@WebServlet("/order/list")
public class UorderListController extends HttpServlet {
    private UorderService uorderService;

    public UorderListController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int month = Integer.parseInt(request.getParameter("month"));
        int section = Integer.parseInt(request.getParameter("section"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        String user_id = request.getParameter("user_id");
        
        Map<String, List<UorderDTO>> orderList = uorderService.orderList(month, section, pageNum, user_id);
        
        request.setAttribute("orderList", orderList.get("orderList"));
        request.setAttribute("orderCancelList", orderList.get("orderCancelList"));
        
        request.getRequestDispatcher("/combined_order_list.jsp").forward(request, response);
    }
}

