package ysac.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.category.service.CategoryService;
import ysac.category.service.CategoryServiceImpl;

@WebServlet("/category/delete")
public class CategoryDeleteController extends HttpServlet {
    private CategoryService categoryService;

    public CategoryDeleteController() {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int category = Integer.parseInt(request.getParameter("category"));

        categoryService.deleteCategory(category);
        response.sendRedirect(request.getContextPath() + "/category/list");
    }
}

