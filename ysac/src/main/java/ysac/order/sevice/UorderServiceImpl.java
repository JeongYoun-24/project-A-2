package ysac.order.sevice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.order.domain.UorderVO;
import ysac.order.dto.UorderDTO;
import ysac.order.mapper.UorderSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;


public class UorderServiceImpl implements UorderService{
	
	private ModelMapper modelMapper;
    private UorderSqlMapper uorderSqlMapper;
    private SqlSessionFactory factory;
    private SqlSession session;

    public UorderServiceImpl() {
    	modelMapper = MapperUtil.INSTANCE.get();
        factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
        session = factory.openSession();
    }

    public Map<String, List<UorderDTO>> orderList(int month, int section, int pageNum, String user_id) {
        List<UorderVO> combinedList = uorderSqlMapper.orderList(month, section, pageNum, user_id);

        List<UorderDTO> orderDTOList = new ArrayList<>();
        List<UorderDTO> orderCancelDTOList = new ArrayList<>();

        for (UorderVO uorderVO : combinedList) {
            UorderDTO uorderDTO = modelMapper.map(uorderVO, UorderDTO.class);
            int orderStatus = uorderDTO.getOrder_status();

            if (orderStatus >= 0 && orderStatus <= 5) {
                orderDTOList.add(uorderDTO);
            } else if (orderStatus >= 6 && orderStatus <= 8) {
                orderCancelDTOList.add(uorderDTO);
            }
        }

        Map<String, List<UorderDTO>> result = new HashMap<>();
        result.put("orderList", orderDTOList);
        result.put("orderCancelList", orderCancelDTOList);

        return result;
    }

    @Override
    public UorderDTO getOrderById(int order_code, String user_id) {
        UorderVO vo = uorderSqlMapper.getOrderById(order_code, user_id);
        return modelMapper.map(vo, UorderDTO.class);
    }

    @Override
    public void insertOrder(UorderDTO dto) {
        UorderVO vo = modelMapper.map(dto, UorderVO.class);
        uorderSqlMapper.insertOrder(vo);
        session.commit();
    }

    @Override
    public void updateOrder(UorderDTO dto) {
        UorderVO vo = modelMapper.map(dto, UorderVO.class);
        uorderSqlMapper.updateOrder(vo);
        session.commit();
    }

    @Override
    public void deleteOrder(int order_code, String user_id) {
        uorderSqlMapper.deleteOrder(order_code, user_id);
        session.commit();
    }
}
