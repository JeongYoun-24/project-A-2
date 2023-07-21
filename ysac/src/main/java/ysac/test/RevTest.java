package ysac.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;

import com.mapper.mybatis.ManagerMapper;

import lombok.extern.log4j.Log4j2;
import ysac.manager_board.domain.Manager_BoardVO;
import ysac.manager_board.dto.Manager_BoardDTO;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.manager_board.service.Manager_BoardService;
import ysac.product.service.ProService;
import ysac.rev.dto.RevDTO;
import ysac.rev.mapper.RevMapper;
import ysac.rev.service.RevService;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;

@Log4j2
//@AutoConfigureMockMvc 
public class RevTest {

	private UsersMapper usersMapper;
	private RevMapper revMapper;
	private ModelMapper modelMapper;
	private SqlSessionFactory factor ;
	private SqlSession session ;
	private RevService revService = RevService.INSTANCE;
	private ProService proService = ProService.INSTANCE;
	private Manager_BoardMapper manager_BoardMapper;
	private Manager_BoardService manager_BoardService = Manager_BoardService.INSTANCE;
	
	
	@BeforeEach
	public void test1() {
//		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
//		session = factor.openSession();
//		usersMapper = session.getMapper(UsersMapper.class);
		factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		manager_BoardMapper = session.getMapper(Manager_BoardMapper.class);
		
		
		
		
		
	}
	
	
//	@Test
//	@DisplayName("리뷰 등록 테스트 ")
//	public void revTest() {
//		
//		RevDTO dto = RevDTO.builder()
//				.rev_code(10)
//				.user_id("aaa")
//				.product_code(1)
//				.rev_title("1312312")
//				.rev_content("fdsfdsfds")
//				.rev_img("fdsfdsf")
//				.build();
//		int result=	 revService.RevInsert(dto);
//		System.out.println(result);
//	
//	}
	
	
	@Test
	@DisplayName("공지사항  등록 테스트 (MAPPER) ")
	public void boardInsertTest() {
		Manager_BoardVO vo = Manager_BoardVO.builder()
				.m_board(6)
				.id("dobi1")
				.name("관리자1")
				.title("테스트 제목입니다.")
				.content("태스트 제목입니다.")
				.img_name("테스트 이미지입니다.")
				.build();
		
		int r =manager_BoardMapper.insertboard2(vo);
		
		System.out.println("테스트 중입니다.");
		
	}
	@Test
	@DisplayName("공지사항  등록 테스트 (Service) ")
	public void boardInsertTest2() {
		Manager_BoardDTO dto = Manager_BoardDTO.builder()
				.m_board(6)
				.id("dobi1")
				.name("관리자1")
				.title("테스트 제목입니다.")
				.content("태스트 제목입니다.")
				.img_name("테스트 이미지입니다.")
				.build();
		
		int r =manager_BoardService.addboard(dto);
		
		System.out.println("테스트 중입니다.");
		
	}
	
	@Test
	@DisplayName("공지사항  등록 테스트 (Service) ")
	public void boardInsertTest2() {
		Manager_BoardDTO dto = Manager_BoardDTO.builder()
				.m_board(6)
				.id("dobi1")
				.name("관리자1")
				.title("테스트 제목입니다.")
				.content("태스트 제목입니다.")
				.img_name("테스트 이미지입니다.")
				.build();
		
		int r =manager_BoardService.addboard(dto);
		
		System.out.println("테스트 중입니다.");
		
	}
	
	
	
	
	
	
	
	
	
	
	@Test
	public void boardList() { // 메소드명으로 한글을 많이 사용한다.
		
		// 목록의 개수가 5개이면 테스트 성공, 아니면 실패
//		List<boar> boards = BoardDao.getInstance().selectAllBoards();
//		assertEquals(5, boards.size()); // 몇개를 기대했는데 실제론 몇개다.
		
	}
	
	
	
	
	
	
	
	
}
