package com.ex01.service;

import java.util.List;
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
//			session.close();
			System.out.println(r);
			return r;
			
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
