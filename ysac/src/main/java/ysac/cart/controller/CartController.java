package ysac.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;
import ysac.cart.dto.CartDTO;
import ysac.cart.service.CartService;
import ysac.cart.service.CartServiceImpl;

@Log4j2
@WebServlet("/cart")
public class CartController extends HttpServlet {

    private CartService cartService = new CartServiceImpl();
    String action = null;
    String nextPage = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getPathInfo();

        int cart = Integer.parseInt(request.getParameter("cart"));
        String user_id = request.getParameter("user_id");
        CartDTO cartDTO = cartService.getCartById(cart, user_id);

        String jsonResponse = toJson(cartDTO);
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getPathInfo();

        CartDTO cartDTO = new CartDTO();
        cartDTO.setCart(Integer.parseInt(request.getParameter("cart")));
        cartDTO.setUser_id(request.getParameter("user_id"));
        cartDTO.setProduct_code(request.getParameter("product_code"));
        cartDTO.setPro_qty(Integer.parseInt(request.getParameter("cart_qty")));

        cartService.insertCart(cartDTO);

        String jsonResponse = "{\"result\": \"Cart Added\"}";
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getPathInfo();

        CartDTO cartDTO = new CartDTO();
        cartDTO.setCart(Integer.parseInt(request.getParameter("cart")));
        cartDTO.setUser_id(request.getParameter("user_id"));
        cartDTO.setProduct_code(request.getParameter("product_code"));
        cartDTO.setCart_qty(Integer.parseInt(request.getParameter("cart_qty")));

        cartService.updateCart(cartDTO);

        String jsonResponse = "{\"result\": \"Cart Updated\"}";
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getPathInfo();

        int cart = Integer.parseInt(request.getParameter("cart"));
        String user_id = request.getParameter("user_id");

        cartService.deleteCart(cart, user_id);

        String jsonResponse = "{\"result\": \"Cart Deleted\"}";
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    private String toJson(CartDTO cartDTO) {
        return "{" +
                "\"cart\":" + cartDTO.getCart() + "," +
                "\"user_id\":\"" + cartDTO.getUser_id() + "\"," +
                "\"product_code\":\"" + cartDTO.getProduct_code() + "\"," +
                "\"cart_qty\":" + cartDTO.getCart_qty() +
                "}";
    }
}

