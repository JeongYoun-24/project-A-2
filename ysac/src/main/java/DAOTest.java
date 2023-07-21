import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;

import ysac.manager_board.domain.Manager_BoardVO;
import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

class DAOTest {

	private ModelMapper modelMapper;
	private Manager_BoardMapper managerBoardMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	
	@BeforeEach
	public void DAOTest() { // 생성자
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		managerBoardMapper = session.getMapper(Manager_BoardMapper.class);
		session.commit();
//		session.close();
		
	}
	
	@Test
	// 공지사항 등록 서비스 
	public int addboard(Manager_BoardDTO dto) {
		Manager_BoardVO vo = modelMapper.map(dto, Manager_BoardVO.class);
		System.out.println(vo);
		int r =managerBoardMapper.insertboard2(vo);
		session.commit();
//		session.close();
		System.out.println(r);
		return r;
	}
	@Test
	// 공지사항 수정 서비스 
	public int updateboard(Manager_BoardDTO dto) {
		Manager_BoardVO vo = modelMapper.map(dto, Manager_BoardVO.class);
		int r =managerBoardMapper.boardupdate(vo);
		session.commit();
		System.out.println("공지사항 수정 값 : "+r);
		return r;
	}
	@Test
	// 공지 사항 삭제 서비스 
	public int deleteboard(int m_board) {
		int result = 0;
//		List<Integer> m_boardList = managerMapper.selectRemoveArticles(m_board);
		result = managerBoardMapper.deleteboard(m_board);
		session.commit();
		return result;
			
	}
		
	@Test	
	// 조회수 업데이트 서비스 
	public int hitCount(int m_board) {
		System.out.println();
		int boardVO = managerBoardMapper.hitboard(m_board); 
		System.out.println("m_board 값은 : "+boardVO);
		// vo 객체  DTO 전환 
		//Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		// 값 리턴 
		return boardVO; 
	}
	@Test
	// 조회수 업데이트 서비스 
	public Manager_BoardDTO hitCount2(int m_board) {
		System.out.println();
		int boardVO = managerBoardMapper.hitboard(m_board); 
		System.out.println("m_board 값은 : "+boardVO);
		// vo 객체  DTO 전환 
		Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		// 값 리턴 
		return boardDTO; 
	}
	@Test
	//  공지사항 상세 조회 서비스 
	public Manager_BoardDTO boardfind(int m_board) {
		Manager_BoardVO boardVO = managerBoardMapper.boardfind(m_board); 
			
		// vo 객체  DTO 전환 
		Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		return boardDTO;
	}
	@Test
	//공지사항 조회 
	public List<Manager_BoardDTO> boardList (){
		List<Manager_BoardVO> boardList = managerBoardMapper.boardList();
		
		// vo-> dto
		System.out.println(boardList);
		List<Manager_BoardDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, Manager_BoardDTO.class))
							.collect(Collectors.toList());
		System.out.println(dtoList);
		
		session.commit();
		return dtoList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
