package ysac.cart.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.cart.domain.CartVO;
import ysac.cart.dto.CartDTO;
import ysac.cart.mapper.CartSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public class CartServiceImpl implements CartService  {
		
	
	    private  ModelMapper modelMapper;
	    private  CartSqlMapper cartSqlMapper;
	    private  SqlSessionFactory factory;
	    private  SqlSession session;

	    public CartServiceImpl() {
	        modelMapper = MapperUtil.INSTANCE.get();
	        factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
	        session = factory.openSession();
	    }

	    @Override
	    public List<CartDTO> getAllCarts() {
	        List<CartVO> voList = cartSqlMapper.getAllCarts();
	        return voList.stream()
	                .map(vo -> modelMapper.map(vo, CartDTO.class))
	                .collect(Collectors.toList());
	    }

	    @Override
	    public CartDTO getCartById(int cart, String user_id) {
	        CartVO vo = cartSqlMapper.getCartById(cart, user_id);
	        return modelMapper.map(vo, CartDTO.class);
	    }

	    @Override
	    public void insertCart(CartDTO dto) {
	        CartVO vo = modelMapper.map(dto, CartVO.class);
	        cartSqlMapper.insertCart(vo);
	        session.commit();
	    }

	    @Override
	    public void updateCart(CartDTO dto) {
	        CartVO vo = modelMapper.map(dto, CartVO.class);
	        cartSqlMapper.updateCart(vo);
	        session.commit();
	    }

	    @Override
	    public void deleteCart(int cart, String user_id) {
	        cartSqlMapper.deleteCart(cart, user_id);
	        session.commit();
	    }
	}
