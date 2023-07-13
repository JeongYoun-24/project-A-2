package ysac.product.service;

import java.util.List;
import java.util.Map;

import ysac.product.dto.ProductDTO;

public interface ProductService {

	public ProductDTO proCodeSelectOne(String product_code);
	
	public int proTotNum();
	
	public List<ProductDTO> proList();
	
	public List<ProductDTO> proAllList(Map<String, Integer> pageingMap);
	
	public List<ProductDTO> proNameSelectList(String pro_name, Map<String, Integer> pageingMap);
	
	public void productAdd(ProductDTO dto);
	
	public void productModify(ProductDTO dto);
	
	public void productDelete(String product_code);
	
}
