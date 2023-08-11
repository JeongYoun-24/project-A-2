package ysac.qna.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.qna.domain.QnaVO;
import ysac.qna.dto.QnaDTO;
import ysac.qna.mapper.QnaMapper;
import ysac.rev.domain.RevVO;
import ysac.rev.dto.RevDTO;
import ysac.users.domain.UsersVO;
import ysac.users.domain.UsersVO2;
import ysac.users.dto.UsersDTO;
import ysac.users.dto.UsersDTO2;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public enum QnaService {

	INSTANCE;
	
	private ModelMapper modelMapper;
	private QnaMapper qnaMapper;
	
	private SqlSessionFactory factor;
	private SqlSession session;
	
	
	private QnaService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		qnaMapper = session.getMapper(QnaMapper.class);

	}
	
	public List<QnaDTO> AllList(String product_code){
		
		List<QnaVO> qnaList = qnaMapper.QnaList(product_code);
		// vo-> dto
		List<QnaDTO> dtoList = qnaList.stream()
						.map(vo -> modelMapper.map(vo, QnaDTO.class))
						.collect(Collectors.toList());
					
					
		return dtoList;	

	}
	
	// 문의 등록 1
	public int insert (QnaDTO dto) { 
		QnaVO vo = modelMapper.map(dto, QnaVO.class);
		int r = qnaMapper.insertQna(vo);
		session.commit();
		
		
		return r;
	}
	
	// 문의 조회 
	public QnaDTO findList (String qna_code ) {
		QnaVO vo = qnaMapper.findList(qna_code);
		QnaDTO dto = modelMapper.map(vo, QnaDTO.class);
		return dto;
	}
	
	// 문의 수정
	public int update (QnaDTO dto) {
		QnaVO vo = modelMapper.map(dto, QnaVO.class);
	
		int r = qnaMapper.updateQna(vo);
		session.commit();
		
		return r;
	}
	
	
	// 문의 삭제 
	public int delete (int qna_code) {
		int r = 0;
		
			r = qnaMapper.deleteQna(qna_code);  //오류 지점
			
		session.commit();
		System.out.println("delete 결과 : " + r);
		return r;
	}
	
	
	
	
	
}
