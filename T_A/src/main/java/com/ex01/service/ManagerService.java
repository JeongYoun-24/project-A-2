package com.ex01.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import com.ex01.dao.ManagerDAO;
import com.ex01.dao.MapperUtil;
import com.ex01.domain.ManagerVO;
import com.ex01.domain.UsersVO;
import com.ex01.dto.ManagerDTO;
import com.ex01.dto.UsersDTO;
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
			
			ManagerVO vo = Mdao.getIdPwd(id);
			
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
	
		
		
	
	
	
}
