package ysac.manager_board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.manager_board.domain.Manager_BoardVO;

public interface Manager_BoardMapper {

	
	
	@Select("select *from manager_board ") // 공지사항 전체 조회
	public List<Manager_BoardVO> boardList();
	
	@Select("SELECT * FROM manager_board WHERE m_board = #{m_board}  ") // 공지사항 상세 조회
	public Manager_BoardVO boardfind(int m_board);
	
	@Select("select max(m_board)+1 from manager_board") // 공지사항 글 번호 생성
	public int getmanager_board();
	
	@Update("update manager_board set hitcount=hitcount+1 where m_board= #{m_board}") // 조회수 증가 업데이트 
	public int hitboard(int m_board);

	String boardInsert = """
			insert into manager_board (m_board,id,title,content,img_name,name) 
				VALUES (#{m_board},#{id},#{title},#{content},#{img_name},#{name});
			""";
	
	@Insert(boardInsert) // 공지사항 등록 
	@Options(useGeneratedKeys = true,keyProperty = "m_board")
	public int insertboard(Manager_BoardVO vo);
	// 회원가입  성공한 SQL 
	@Insert("insert into manager_board (m_board, id, title, content, img_name,name,hitcount)"
			+ "values(#{m_board},#{id},#{title},#{content},#{img_name},#{name},#{hitcount})")
//	@Options(useGeneratedKeys = true,keyProperty = "m_board")
	public int insertboard2(Manager_BoardVO vo);
		
	
	@Update("update manager_board set title=#{title},content=#{content},img_name=#{img_name} WHERE m_board=#{m_board} ")
	public int boardupdate(Manager_BoardVO vo); // 공지사항 업데이트 
	
	@Delete("delete manager_board where m_board = #{m_board} ") // 공지사항 삭제 
	public int deleteboard (int m_board);
}
