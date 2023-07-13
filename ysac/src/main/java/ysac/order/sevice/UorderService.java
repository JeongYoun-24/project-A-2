package ysac.order.sevice;

import java.util.List;
import java.util.Map;

import ysac.order.dto.UorderDTO;

public interface UorderService {

	public Map<String, List<UorderDTO>> orderList(int month, int section, int pageNum, String user_id);

	public UorderDTO getOrderById(int order_code, String user_id);

	public void insertOrder(UorderDTO dto);

	public void updateOrder(UorderDTO dto);

	public void deleteOrder(int order_code, String user_id);
}
