package ysac.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import ysac.manager.domain.ManagerVO;

@Mapper
public interface ManagerMapper { // 관리자 sql 

	@Select("select *from m_manager") // 관리자 전체 조회
	public List<ManagerVO> selectAll();
	
	@Select("select *from m_manager where id = #{id}") // 관리자 id 조회
	public int selectfind(String id);
	
	@Select("select *from m_manager where id = #{id}") // 관리자 로그인 일치 조회
	public ManagerVO login(String id);

	
	
	
	
	
	
}
