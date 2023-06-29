package com.ex01.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;


import com.ex01.dao.ManagerDAO;
import com.ex01.dao.MapperUtil;
import com.ex01.dao.UsersDAO;
import com.ex01.domain.Manager_BoardVO;
import com.ex01.domain.UsersVO;
import com.ex01.domain.UsersVO2;
import com.ex01.dto.Manager_BoardDTO;
import com.ex01.dto.UsersDTO;
import com.ex01.dto.UsersDTO2;
import com.ex01.util.ConnectionUtil;
import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.UsersMapper;




public enum UsersService {

	INSTANCE;
	
	private UsersDAO userDAO;
	private ModelMapper modelMapper;
	private UsersMapper usersMapper;
	private ManagerMapper managerMaper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	private UsersService() {
		userDAO = new UsersDAO();
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionUtil.INSTANCE.getSqlSessionFactorty();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);
		managerMaper = session.getMapper(ManagerMapper.class);
		
	}
	
	
	// 로그인 서비스 
		public UsersDTO login(String user_id)  {
			UsersVO vo = usersMapper.login(user_id);
			UsersDTO dto = modelMapper.map(vo, UsersDTO.class);

			return dto;
				
	}
		// 로그인 서비스 
		public UsersDTO2 login2(String user_id)  {
			UsersVO2 vo = usersMapper.SelectOne(user_id);
			UsersDTO2 dto = modelMapper.map(vo, UsersDTO2.class);

			return dto;
				
		}	
		
		
	// 회원 등록 2
	public int insert (UsersDTO2 dto) { 
		UsersVO2 vo = modelMapper.map(dto, UsersVO2.class);
		int r = usersMapper.userinsert2(vo);
		session.commit();
		
		
		return r;
	}
	// 회원 등록 2
	public int insert2 (UsersDTO dto) { 
		UsersVO vo = modelMapper.map(dto, UsersVO.class);
		int r = usersMapper.userinsert(vo);
		session.commit();
			
			
		return r;
	}
	
	// 회원 조회 
	public void findList (String id ) {
		UsersVO vo = usersMapper.login(id);
		UsersDTO dto = modelMapper.map(vo, UsersDTO.class);
		
	}
	//공지사항 조회 
	public List<Manager_BoardDTO> boardList (){
		List<Manager_BoardVO> boardList = managerMaper.boardList();
		
		// vo-> dto
		System.out.println(boardList);
		List<Manager_BoardDTO> dtoList = boardList.stream()
							.map(vo -> modelMapper.map(vo, Manager_BoardDTO.class))
							.collect(Collectors.toList());
		System.out.println(dtoList);
		
		session.commit();
		return dtoList;
		
	}
	
	
	// 회원 전체 조회 
		public List<UsersDTO> userList (){
			List<UsersVO> memberList = usersMapper.selectAll();
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
			int r = usersMapper.userUpdate(vo);
			session.commit();
			
			return r;
		}
		
		
		// 회원 삭제 
		public int delete (String user_id) {
			int r = 0;
			System.out.println(user_id);
				r = usersMapper.userDelete(user_id);  //오류 지점
				
			session.commit();
			System.out.println("delete 결과 : " + r);
			return r;
		}
	
	//id 중복 서비스 
	public Boolean CheckID(String id) {
				
		Boolean chk = usersMapper.checkID(id);
				
		return chk;
	}
	// 자동로그인 체크시 uuid에 임의문자열을 저장(수정)
		public void updateUuid(String id, String uuid){
			
			usersMapper.updateUuid(id, uuid);
			
		}
		// 자동 로그인 상태일 경우 쿠키값을 읽어 db정보을 추추하는 메서드
		public UsersDTO getByUUID(String uuid) {
			UsersVO vo = usersMapper.selectUUID(uuid);
			
			UsersDTO orcDTO = modelMapper.map(vo, UsersDTO.class);
			return orcDTO ;
		}
		
		// 아이디 찾기 서비스 
		public String findID(String email) {
			String vo = usersMapper.findID( email);
//			OrcDTO dto = modelMapper.map(vo, OrcDTO.class);
			return vo;
		}
		// 비밀번호 찾기 서비스 
		public String findPWD(String id ,String email) {
			String vo = usersMapper.findPwd(id ,email);
//			OrcDTO dto = modelMapper.map(vo, OrcDTO.class);
			return vo;
		}
		
	
	
	
}
