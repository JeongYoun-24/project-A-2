package ysac.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.users.domain.UsersVO;
import ysac.users.domain.UsersVO2;
import ysac.users.dto.UsersDTO;
import ysac.users.dto.UsersDTO2;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;




public enum UsersService {

	INSTANCE;
	
	private ModelMapper modelMapper;
	private UsersMapper usersMapper;
	
	private SqlSessionFactory factor;
	private SqlSession session;
	
	private UsersService() {
		modelMapper = MapperUtil.INSTANCE.get();
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		usersMapper = session.getMapper(UsersMapper.class);
		
		
		
	}
	
	
	
	// 로그인 서비스 
		public UsersDTO login(String user_id)  {
			UsersVO vo = usersMapper.login(user_id);
			UsersDTO dto = modelMapper.map(vo, UsersDTO.class);

			return dto;
				
	}
		// 로그인 서비스 
		public UsersDTO login2(String user_id)  {
			UsersVO vo = usersMapper.SelectOne(user_id);
			UsersDTO dto = modelMapper.map(vo, UsersDTO.class);

			return dto;
				
		}	
		
		// 회원 등록 1
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
		public String findID(UsersDTO dto) {
			UsersVO vo = modelMapper.map(dto, UsersVO.class);
			String id = usersMapper.loginId(vo);

			return id;
		}
		// 비밀번호 찾기 서비스 
		public String findPWD(UsersDTO dto) {
			UsersVO vo = modelMapper.map(dto, UsersVO.class);
			String pwd = usersMapper.loginPwd(vo);
			
			return pwd;
		}
		
		public Map<String,Object> selectList(Map<String,Integer> pageingMap){
			
			Map<String,Object> articleMap = new HashMap<>();
						
						
			//게시글 전체 개수 반환
			int totArticles = usersMapper.recNum();
				System.out.println(totArticles);
								
				List<UsersVO> boardlist = null;
				List<UsersDTO> dtoList = null;
				
			try {
				boardlist = usersMapper.usersList(pageingMap);
				
				dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
						
							
				} catch (Exception e) {e.printStackTrace();}
					
				articleMap.put("dtoList", dtoList);
				
				articleMap.put("totArticles", totArticles);
								
				return articleMap;
			}
		
		public int selectTotArticles() {
			int totArticles = usersMapper.recNum();
			return totArticles;
		}
	
		// 아이디 이름 검색 조회 서비스 
		public Map<String,Object>  idList(Map<String,String> pageingMap){
			Map<String,Object> articleMap = new HashMap<>();
			
			//게시글 전체 개수 반환
			int totArticles = usersMapper.recNum();
				
				List<UsersVO> boardlist = null;
				List<UsersDTO> dtoList = null;
			
				try {
					boardlist = usersMapper.idList(pageingMap);
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
				int totArticles = usersMapper.recNum();
					
					List<UsersVO> boardlist = null;
					List<UsersDTO> dtoList = null;
				
					try {
						boardlist = usersMapper.nameList(pageingMap);
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
				int totArticles = usersMapper.recNum();
					
					List<UsersVO> boardlist = null;
					List<UsersDTO> dtoList = null;
				
					try {
						boardlist = usersMapper.emailList(pageingMap);
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
				int totArticles = usersMapper.recNum();
					
					List<UsersVO> boardlist = null;
					List<UsersDTO> dtoList = null;
				
					try {
						boardlist = usersMapper.phoneList(pageingMap);
							System.out.println(boardlist);
							dtoList = boardlist.stream().map(x -> modelMapper.map(x,UsersDTO.class)).collect(Collectors.toList());
									
							} catch (Exception e) {e.printStackTrace();}
					
					articleMap.put("dtoList", dtoList);
					articleMap.put("totArticles", totArticles);
								
				return articleMap;
				}		
	
	
}
