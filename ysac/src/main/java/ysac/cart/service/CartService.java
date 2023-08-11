package ysac.cart.service;

import java.util.List;

import ysac.cart.dto.CartDTO;
import ysac.cart.dto.CartJoinDTO;

public interface CartService {

	public List<CartDTO> getAllCarts();

	public CartDTO getCartById(int cart, String user_id);
	public List<CartJoinDTO> getCartById2(String user_id);

	public int insertCart(CartDTO dto);

	public void updateCart(CartDTO dto);

	public void deleteCart(int cart, String user_id);
}
