package com.ex01.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.MapperUtil;
import com.ex01.domain.ProductVO;
import com.ex01.domain.RevVO;
import com.ex01.dto.ProductDTO;
import com.ex01.dto.RevDTO;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.UsersMapper;

public enum ProductService {

	INSTANCE;
	private UsersMapper userMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
	
	private ProductService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		userMapper = session.getMapper(UsersMapper.class);

	}
	
	
	
	//상품 전체 조회 서비스
	public List<ProductDTO>	proAllList(){
		List<ProductVO> boardList = userMapper.productAllList();
		// vo-> dto
		List<ProductDTO> dtoList = boardList.stream()
						.map(vo -> modelMapper.map(vo, ProductDTO.class))
						.collect(Collectors.toList());
				
				
		return dtoList;	
	}
	//상품 전체 4번쩨까지 서비스
	public List<ProductDTO>	proList(){
		List<ProductVO> boardList = userMapper.proList();
		// vo-> dto
		List<ProductDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, ProductDTO.class))
							.collect(Collectors.toList());
					
					
		return dtoList;	
	}	
	//상품 전체 5~9번쩨까지 서비스
	public List<ProductDTO>	proList2(){
		List<ProductVO> boardList = userMapper.proList2();
		// vo-> dto
		List<ProductDTO> dtoList = boardList.stream()
								.map(vo -> modelMapper.map(vo, ProductDTO.class))
								.collect(Collectors.toList());
						
						
		return dtoList;	
	}		
	
	
	
}
