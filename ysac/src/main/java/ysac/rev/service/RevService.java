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
import ysac.users.domain.UsersVO;
import ysac.users.dto.UsersDTO;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public enum RevService {
	INSTANCE;
	
	private UsersMapper usersMapper;
	private RevMapper revMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	
//	private RevService() {
//		modelMapper = MapperUtil.INSTANCE.get();
//		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
//		session = factor.openSession();
//		revMapper = session.getMapper(RevMapper.class);
//
//	}
	
	// 리뷰 등록 서비스 
	public int RevInsert(RevDTO revDTO) {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);

		System.out.println("fdsdsfs"+revDTO);
		
		System.out.println("0000");
		RevVO vo = modelMapper.map(revDTO, RevVO.class);
		
		System.out.println("ssssssssssss"+vo);
		System.out.println("1111");
		int r = usersMapper.revinsert(vo);
		System.out.println("2222");
		session.commit();

		return r;	
	}
	
	
	// 리뷰 수정 서비스 
	public int RevUpdate(RevDTO revDTO) {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		revMapper = session.getMapper(RevMapper.class);

		RevVO vo = modelMapper.map(revDTO, RevVO.class);
		
		int r = revMapper.revupdate(vo);
		session.commit();
		
		return r;
	}
	

	// 리뷰 삭제 서비스 
	
	
	

	
	
	
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
