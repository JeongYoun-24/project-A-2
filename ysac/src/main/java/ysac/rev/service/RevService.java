package ysac.rev.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;




import ysac.product.domain.ProductVO;
import ysac.product.dto.ProductDTO;
import ysac.rev.domain.RevVO;
import ysac.rev.dto.RevDTO;
import ysac.rev.mapper.RevMapper;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public enum RevService {
	INSTANCE;
	
	private UsersMapper usersMapper;
//	private RevMapper revMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
//	private RevService() {
//		modelMapper = MapperUtil.INSTANCE.get();
//		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
//		session = factor.openSession();
//		usersMapper = session.getMapper(UsersMapper.class);
//
//	}
	
	
	//상품 상세 조회 리뷰 서비스
	public List<RevDTO>	RevAllList(String product_code){
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);

		
		List<RevVO> boardList = usersMapper.revList(product_code);
		// vo-> dto
		List<RevDTO> dtoList = boardList.stream()
						.map(vo -> modelMapper.map(vo, RevDTO.class))
						.collect(Collectors.toList());
					
					
		return dtoList;	
	}
	//상품 상세 조회
	public ProductDTO findProductlist(String product_code){	
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);

		
		ProductVO vo = usersMapper.findProductlist(product_code);
		ProductDTO dto = modelMapper.map(vo, ProductDTO.class);
				
				
		return dto;	
	}

}
