package ysac.manager.service;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.manager.domain.ManagerVO;
import ysac.manager.dto.ManagerDTO;
import ysac.manager.mapper.ManagerMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;




public enum ManagerService {

	INSTANCE;
	
	private ModelMapper modelMapper;
	private ManagerMapper managerMapper;
	private SqlSessionFactory factor;
	private SqlSession session;
	
	private ManagerService() { // 생성자
		modelMapper =MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
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
