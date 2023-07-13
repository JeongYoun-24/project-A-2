package ysac.product.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.product.domain.ProductVO;
import ysac.product.dto.ProductDTO;
import ysac.product.mapper.ProductSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public class ProductServiceImpl implements ProductService{
	
	private ModelMapper modelMapper;
	private ProductSqlMapper productSqlMapper;
	private SqlSessionFactory factory;
	private SqlSession session;
	
	public ProductServiceImpl() {
		modelMapper = MapperUtil.INSTANCE.get();
		factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factory.openSession();
	}

	@Override
	public ProductDTO proCodeSelectOne(String product_code) {
		
		ProductVO vo = productSqlMapper.proCodeSelectOne(product_code);
		ProductDTO dto = modelMapper.map(vo, ProductDTO.class);
		
		return dto;
	}

	
	//상품 전체 4번쩨까지 서비스
	@Override
	public List<ProductDTO>	proList(){
			List<ProductVO> boardList = productSqlMapper.proList();
			// vo-> dto
			List<ProductDTO> dtoList = boardList.stream()
								.map(vo -> modelMapper.map(vo, ProductDTO.class))
								.collect(Collectors.toList());
						
						
		return dtoList;	
	}	
	
	
	@Override
	public List<ProductDTO> proAllList(Map<String, Integer> pagingMap) {
        List<ProductVO> voList = productSqlMapper.proAllList(pagingMap);
        List<ProductDTO> dtoList = voList.stream()
                                         .map(vo -> modelMapper.map(vo, ProductDTO.class))
                                         .collect(Collectors.toList());
        return dtoList;
    }

	@Override
	public List<ProductDTO> proNameSelectList(String pro_name, Map<String, Integer> pageingMap) {
		
		List<ProductVO> voList = productSqlMapper.proNameSelectList(pro_name, pageingMap);
		List<ProductDTO> dtoList = voList.stream()
									.map(vo -> modelMapper.map(vo, ProductDTO.class))
									.collect(Collectors.toList());
		return dtoList;
		
	}

	@Override
	public void productAdd(ProductDTO dto) {
		
		ProductVO vo = modelMapper.map(dto, ProductVO.class);
		productSqlMapper.productAdd(vo);
		session.commit();
		
	}

	@Override
	public void productModify(ProductDTO dto) {
		
		ProductVO vo = modelMapper.map(dto, ProductVO.class);
		productSqlMapper.productModify(vo);
		session.commit();
		
	}

	@Override
	public void productDelete(String product_code) {
		
		productSqlMapper.productDelete(product_code);
		session.commit();
		
	}

	@Override
	public int proTotNum() {
		int proTotNum = productSqlMapper.proTotNum();
		return proTotNum;
	}

	

	
	
}
