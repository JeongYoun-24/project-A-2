
package ysac.product.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.manager_board.domain.Manager_BoardVO;
import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.product.domain.ProductVO;
import ysac.product.dto.ProductDTO;
import ysac.product.mapper.ProductSqlMapper;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public enum ProService {

	INSTANCE;
	private ProductSqlMapper productSqlMapper;
	private UsersMapper usersMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
	
	private ProService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		productSqlMapper = session.getMapper(ProductSqlMapper.class);
//		usersMapper  = session.getMapper(UsersMapper.class);

	}
	
	//  상품 상세 조회 서비스 
	public ProductDTO profind(int procuct_code) {
		ProductVO proVO = productSqlMapper.proCodeSelectOne2(procuct_code); 
			
		// vo 객체  DTO 전환 
		ProductDTO proDTO = modelMapper.map(proVO, ProductDTO.class);
		session.commit();
			
		return proDTO;
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
