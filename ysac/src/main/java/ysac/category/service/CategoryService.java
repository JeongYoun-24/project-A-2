package ysac.category.service;

import java.util.List;

import ysac.category.dto.CategoryDTO;

public interface CategoryService {

	
	public List<CategoryDTO> categoryList();

	public CategoryDTO categoryTypeList(String category_name, int section, int pageNum);

	public void insertCategory(CategoryDTO dto);

	public void updateCategory(CategoryDTO dto);

	public void deleteCategory(int category);

}
