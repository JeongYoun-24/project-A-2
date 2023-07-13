package ysac.category.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.category.dto.CategoryDTO;
import ysac.category.service.CategoryService;
import ysac.category.service.CategoryServiceImpl;

@WebServlet("/category/list")
public class CategoryListController extends HttpServlet {
    private CategoryService categoryService;

    public CategoryListController() {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryDTO> categoryList = categoryService.categoryList();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/category_list.jsp").forward(request, response);
    }
}
