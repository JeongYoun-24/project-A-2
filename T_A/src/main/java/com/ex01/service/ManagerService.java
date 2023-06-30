package com.ex01.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.ManagerDAO;
import com.ex01.dao.MapperUtil;
import com.ex01.domain.ManagerVO;
import com.ex01.domain.Manager_BoardVO;

import com.ex01.domain.UsersVO;
import com.ex01.domain.UsersVO2;
import com.ex01.dto.ManagerDTO;
import com.ex01.dto.Manager_BoardDTO;

import com.ex01.dto.UsersDTO;
import com.ex01.dto.UsersDTO2;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.UsersMapper;




public enum ManagerService {

	INSTANCE;
	
	private ManagerDAO Mdao;
	private ModelMapper modelMapper;
	private ManagerMapper managerMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	private ManagerService() { // 생성자
		Mdao =new ManagerDAO();
		modelMapper =MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		managerMapper = session.getMapper(ManagerMapper.class);
		session.commit();
//		session.close();
		
	}
	
	// 관리자 아이디 일치 여부 서비스 
	public ManagerDTO login(String id)  {
			
		ManagerVO vo = managerMapper.login(id);
		System.out.println(vo);
		ManagerDTO orcDTO = modelMapper.map(vo, ManagerDTO.class);
			
		return orcDTO;
	}

	//  
		// 회원 전체 조회 
	public List<UsersDTO> userList (){
		List<UsersVO> memberList = managerMapper.user_selectAll();
		// vo-> dto
		List<UsersDTO> dtoList = memberList.stream()
								.map(vo -> modelMapper.map(vo, UsersDTO.class))
								.collect(Collectors.toList());
		return dtoList;
	}
		
		
	// 회원 수정
	public int update (UsersDTO dto) {
		UsersVO vo = modelMapper.map(dto, UsersVO.class);
		System.out.println("--------------------------");
		System.out.println(vo);
		int r = managerMapper.userUpdate(vo);
		session.commit();
			
		return r;
	}
		
		
	// 회원 삭제 
	public int delete (String user_id) {
		int r = 0;
			
		r = managerMapper.userDelete(user_id);  //오류 지점
				
		session.commit();
		System.out.println("delete 결과 : " + r);
		return r;

	}
	// 공지사항 등록 서비스 
	public int addboard(Manager_BoardDTO dto) {
		Manager_BoardVO vo = modelMapper.map(dto, Manager_BoardVO.class);
		System.out.println(vo);
		int r =managerMapper.insertboard2(vo);
		session.commit();
//		session.close();
		System.out.println(r);
		return r;
	}
	// 공지사항 수정 서비스 
	public int updateboard(Manager_BoardDTO dto) {
		Manager_BoardVO vo = modelMapper.map(dto, Manager_BoardVO.class);
		int r =managerMapper.boardupdate(vo);
		session.commit();
		System.out.println("공지사항 수정 값 : "+r);
		return r;
	}
	// 공지 사항 삭제 서비스 
	public int deleteboard(int m_board) {
		int result = 0;
//		List<Integer> m_boardList = managerMapper.selectRemoveArticles(m_board);
		result = managerMapper.deleteboard(m_board);
		session.commit();
		return result;
			
	}
		
		
	// 조회수 업데이트 서비스 
	public int hitCount(int m_board) {
		System.out.println();
		int boardVO = managerMapper.hitboard(m_board); 
		System.out.println("m_board 값은 : "+boardVO);
		// vo 객체  DTO 전환 
		//Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		// 값 리턴 
		return boardVO; 
	}
	// 조회수 업데이트 서비스 
	public Manager_BoardDTO hitCount2(int m_board) {
		System.out.println();
		int boardVO = managerMapper.hitboard(m_board); 
		System.out.println("m_board 값은 : "+boardVO);
		// vo 객체  DTO 전환 
		Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		// 값 리턴 
		return boardDTO; 
	}
	//  공지사항 상세 조회 서비스 
	public Manager_BoardDTO boardfind(int m_board) {
		Manager_BoardVO boardVO = managerMapper.boardfind(m_board); 
			
		// vo 객체  DTO 전환 
		Manager_BoardDTO boardDTO = modelMapper.map(boardVO, Manager_BoardDTO.class);
		session.commit();
			
		return boardDTO;
	}
		
			
	//회원 목록전체 조회 서비스 
	public Map<String,Object> selectList(Map<String,Integer> pageingMap){
			
		Map<String,Object> articleMap = new HashMap<>();
					
					
		//게시글 전체 개수 반환
		int totArticles = managerMapper.recNum();
			System.out.println(totArticles);
							
			List<UsersVO> boardlist = null;
			List<UsersDTO> dtoList = null;
			
		try {
			boardlist = managerMapper.usersList(pageingMap);
			
			dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
					
						
			} catch (Exception e) {e.printStackTrace();}
				
			articleMap.put("dtoList", dtoList);
			
			articleMap.put("totArticles", totArticles);
							
			return articleMap;
		}
		
		// 등록된 회원 전체 갯수
	public int selectTotArticles() {
		int totArticles = managerMapper.recNum();
		return totArticles;
	}
	
	// 아이디 이름 검색 조회 서비스 
	public Map<String,Object>  idList(Map<String,String> pageingMap){
		Map<String,Object> articleMap = new HashMap<>();
		
		//게시글 전체 개수 반환
		int totArticles = managerMapper.recNum();
			
			List<UsersVO> boardlist = null;
			List<UsersDTO> dtoList = null;
		
			try {
				boardlist = managerMapper.idList(pageingMap);
					System.out.println(boardlist);
					dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
							
					} catch (Exception e) {e.printStackTrace();}
			
			articleMap.put("dtoList", dtoList);
			articleMap.put("totArticles", totArticles);
						
		return articleMap;
		}
		
		//  이름 검색 조회 서비스 
		public Map<String,Object>  nameList(Map<String,String> pageingMap){
			Map<String,Object> articleMap = new HashMap<>();
			
			//게시글 전체 개수 반환
			int totArticles = managerMapper.recNum();
				
				List<UsersVO> boardlist = null;
				List<UsersDTO> dtoList = null;
			
				try {
					boardlist = managerMapper.nameList(pageingMap);
						System.out.println(boardlist);
						dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
								
						} catch (Exception e) {e.printStackTrace();}
				
				articleMap.put("dtoList", dtoList);
				articleMap.put("totArticles", totArticles);
							
			return articleMap;
			}
		
		
		//  이메일 검색 조회 서비스 
		public Map<String,Object> emailList(Map<String,String> pageingMap){

			Map<String,Object> articleMap = new HashMap<>();
			
			//게시글 전체 개수 반환
			int totArticles = managerMapper.recNum();
				
				List<UsersVO> boardlist = null;
				List<UsersDTO> dtoList = null;
			
				try {
					boardlist = managerMapper.emailList(pageingMap);
						System.out.println(boardlist);
						dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
								
						} catch (Exception e) {e.printStackTrace();}
				
				articleMap.put("dtoList", dtoList);
				articleMap.put("totArticles", totArticles);
							
			return articleMap;
			}
		
		//  전화 번호 검색 조회 서비스 
		public Map<String,Object> phoneList(Map<String,String> pageingMap){

			Map<String,Object> articleMap = new HashMap<>();
			
			//게시글 전체 개수 반환
			int totArticles = managerMapper.recNum();
				
				List<UsersVO> boardlist = null;
				List<UsersDTO> dtoList = null;
			
				try {
					boardlist = managerMapper.phoneList(pageingMap);
						System.out.println(boardlist);
						dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
								
						} catch (Exception e) {e.printStackTrace();}
				
				articleMap.put("dtoList", dtoList);
				articleMap.put("totArticles", totArticles);
							
			return articleMap;
			}		

		
		
		
//		// 회원 등록 2
//		public int insert (UsersDTO2 dto) { 
//			UsersVO2 vo = modelMapper.map(dto, UsersVO2.class);
//			int r = usersMapper.userinsert2(vo);
//			session.commit();
//			
//			
//			return r;
//		}
//		
	
	
}
