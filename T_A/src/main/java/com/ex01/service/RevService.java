package com.ex01.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.MapperUtil;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.domain.ProductVO;
import com.ex01.domain.RevVO;
import com.ex01.domain.UsersVO;
import com.ex01.dto.Manager_BoardDTO;
import com.ex01.dto.ProductDTO;
import com.ex01.dto.RevDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.RevMapper;
import com.mapper.mybatis.UsersMapper;

public enum RevService {

	INSTANCE;
	private UsersMapper userMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
	
	private RevService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		userMapper = session.getMapper(UsersMapper.class);

	}
	
	
	//공지사항 조회 
//	public List<RevDTO> revList (int product_code){
//		modelMapper = MapperUtil.INSTANCE.get();
//		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
//		session = factor.openSession();
//		revMapper = session.getMapper(RevMapper.class);
//
//		List<RevVO> boardList = revMapper.revlistAll(product_code);
//			
//		// vo-> dto
//		System.out.println(boardList);
//		List<RevDTO> dtoList = boardList.stream()
//						.map(vo -> modelMapper.map(vo, RevDTO.class))
//						.collect(Collectors.toList());
//		System.out.println(dtoList);
//			
//		session.commit();
//		return dtoList;	
//	}
	//상품 상세 조회 리뷰 서비스
		public List<RevDTO>	RevAllList(String product_code){
			List<RevVO> boardList = userMapper.revList(product_code);
			// vo-> dto
			List<RevDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, RevDTO.class))
							.collect(Collectors.toList());
				
				
			return dtoList;	
		}
	//상품 상세 조회
	public ProductDTO findProductlist(String product_code){

		
		ProductVO vo = userMapper.findProductlist(product_code);
		ProductDTO dto = modelMapper.map(vo, ProductDTO.class);
			
			
		return dto;	
	}
	
	
	
}
