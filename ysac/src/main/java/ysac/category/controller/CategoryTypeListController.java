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

@WebServlet("/category/typeList")
public class CategoryTypeListController extends HttpServlet {
    private CategoryService categoryService;

    public CategoryTypeListController() {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category_name = request.getParameter("category_name");
        int section = Integer.parseInt(request.getParameter("section"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        CategoryDTO categoryDTO = categoryService.categoryTypeList(category_name, section, pageNum);
        request.setAttribute("categoryDTO", categoryDTO);
        request.getRequestDispatcher("/category_detail.jsp").forward(request, response);
    }
}
