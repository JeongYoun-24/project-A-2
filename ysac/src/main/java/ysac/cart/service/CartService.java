package ysac.cart.service;

import java.util.List;

import ysac.cart.dto.CartDTO;

public interface CartService {

	public List<CartDTO> getAllCarts();

	public CartDTO getCartById(int cart, String user_id);

	public void insertCart(CartDTO dto);

	public void updateCart(CartDTO dto);

	public void deleteCart(int cart, String user_id);
}
