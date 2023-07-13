package ysac.category.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.category.domain.CategoryVO;
import ysac.category.dto.CategoryDTO;
import ysac.category.mapper.CategorySqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public class CategoryServiceImpl implements CategoryService {
	

    private ModelMapper modelMapper;
    private CategorySqlMapper categorySqlMapper;
    private SqlSessionFactory factory;
    private SqlSession session;

    public CategoryServiceImpl() {
    	modelMapper = MapperUtil.INSTANCE.get();
        factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
        session = factory.openSession();
    }

    @Override
    public List<CategoryDTO> categoryList() {
        List<CategoryVO> voList = categorySqlMapper.categoryList();
        return voList.stream()
                .map(vo -> modelMapper.map(vo, CategoryDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public CategoryDTO categoryTypeList(String category_name, int section, int pageNum) {
        CategoryVO vo = categorySqlMapper.categoryTypeList(category_name, section, pageNum);
        return modelMapper.map(vo, CategoryDTO.class);
    }

    @Override
    public void insertCategory(CategoryDTO dto) {
        CategoryVO vo = modelMapper.map(dto, CategoryVO.class);
        categorySqlMapper.insertCategory(vo);
        session.commit();
    }

    @Override
    public void updateCategory(CategoryDTO dto) {
        CategoryVO vo = modelMapper.map(dto, CategoryVO.class);
        categorySqlMapper.updateCategory(vo);
        session.commit();
    }

    @Override
    public void deleteCategory(int category) {
        categorySqlMapper.deleteCategory(category);
        session.commit();
    }

}
