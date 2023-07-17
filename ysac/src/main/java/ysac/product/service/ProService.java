
package ysac.product.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;


import com.mapper.mybatis.UsersMapper;

import ysac.product.domain.ProductVO;
import ysac.product.dto.ProductDTO;
import ysac.product.mapper.ProductSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public enum ProService {

	INSTANCE;
	private ProductSqlMapper productSqlMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
	
	private ProService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		productSqlMapper = session.getMapper(ProductSqlMapper.class);

	}
	
	//상품 전체 4번쩨까지 서비스
	public List<ProductDTO>	proList(){
			List<ProductVO> boardList = productSqlMapper.proList();
				// vo-> dto
			List<ProductDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, ProductDTO.class))
							.collect(Collectors.toList());
							
							
		return dtoList;	
	}
	//상품 전체 5번~9조회 서비스
	public List<ProductDTO>	proList2(){
			List<ProductVO> boardList = productSqlMapper.proList2();
				// vo-> dto
			List<ProductDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, ProductDTO.class))
							.collect(Collectors.toList());
							
							
		return dtoList;	
	}	
	
	
	
	
}
