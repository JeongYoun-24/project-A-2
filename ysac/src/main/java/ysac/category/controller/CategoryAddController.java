package ysac.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.category.dto.CategoryDTO;
import ysac.category.service.CategoryService;
import ysac.category.service.CategoryServiceImpl;

@WebServlet("/category/add")
public class CategoryAddController extends HttpServlet {
    private CategoryService categoryService;

    public CategoryAddController() {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int category = Integer.parseInt(request.getParameter("category"));
        String category_name = request.getParameter("category_name");

        CategoryDTO categoryDTO = CategoryDTO.builder()
                .category(category)
                .category_name(category_name)
                .build();

        categoryService.insertCategory(categoryDTO);
        response.sendRedirect(request.getContextPath() + "/category/list");
    }
}

