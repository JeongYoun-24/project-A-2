package ysac.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;

import lombok.extern.log4j.Log4j2;
import ysac.cart.domain.CartJoinVO;
import ysac.cart.domain.CartVO;
import ysac.cart.dto.CartDTO;
import ysac.cart.mapper.CartSqlMapper;
import ysac.cart.service.CartService;
import ysac.manager_board.domain.Manager_BoardVO;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.manager_board.service.Manager_BoardService;
import ysac.product.service.ProService;
import ysac.rev.mapper.RevMapper;
import ysac.rev.service.RevService;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;

@Log4j2
public class CartTest {

	private CartSqlMapper cartSqlMapper;
	private CartService cartService;
	private UsersMapper usersMapper;
	private RevMapper revMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	private RevService revService = RevService.INSTANCE;
	private ProService proService = ProService.INSTANCE;
	private Manager_BoardMapper manager_BoardMapper;
	private Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	
	
	
	@BeforeEach
	public void test1() {

		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		cartSqlMapper = session.getMapper(CartSqlMapper.class);
		
		
	
	}
	@Test
	@DisplayName("장바구니 조회 테스트  (MAPPER) ")
	public void boardInsertTest() {
	String user_id = "aaa";
		
	List<CartVO> cart = cartSqlMapper.CartList(user_id);
	System.out.println("값 나와라 "+cart);
	List<CartDTO> cartDTOList = new ArrayList<>();
	
	for(CartVO cart2: cart){
//		CartDTO movieImgDTO = CartDTO.of(cart2);// entity->dto 메서드호출
		CartDTO dto = CartDTO.builder()
				.cart(1)
				
				.build();
		
		
		cartDTOList.add(dto);

    }
	log.info("ddddd"+cartDTOList);
	
	
	}
	@Test
	@DisplayName("장바구니 조회 테스트  (MAPPER) ")
	public void boardInsertTest2() {
		String user_id = "aaa";
	List<CartDTO>cartDTO=cartService.CartList(user_id);
	
	log.info(cartDTO);
//	List<CartDTO> cartDTO = cartService.getCartById(1, user_id);
	
	
		
	}
	@Test
	@DisplayName("장바구니 조인 테스트 ")
	public void Cart22() {
		String user_id = "aaa";
//		CartJoinVO vo = cartSqlMapper.getCartById2(user_id);
		
		List<CartJoinVO> vo = cartSqlMapper.getCartById2(user_id);
	
	System.out.println(vo);
			
	}
		
	
	
	
	
}
