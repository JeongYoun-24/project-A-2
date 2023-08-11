package ysac.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.qna.domain.QnaVO;
import ysac.qna.dto.QnaDTO;
import ysac.rev.domain.RevVO;
import ysac.users.domain.UsersVO;

@Mapper
public interface QnaMapper {

	
	
	@Select("select *from Qna")
	public List<QnaVO> selectAll();
	
	@Select("select *from Qna where qna_code =#{qna_code}")
	public QnaVO findList(String qna_code);
	
	@Insert("insert into qna (qna_code ,user_id,product_code , qna_title , qna_content)\n"
			+ "VALUES (#{qna_code},#{user_id},#{product_code},#{qna_title},#{qna_content})")
	public int insertQna(QnaVO vo );
	
	@Update("UPDATE qna SET qna_title = #{qna_title} ,qna_content=#{qna_content} WHERE qna_code= #{qna_code}")
	public int updateQna(QnaVO vo);
	
	@Delete("delete qna WHERE qna_code = #{qna_code}")
	public int deleteQna(int Qna_code);
	
	
	@Select("select max(qna_code)+1 from qna") // 리뷰 글 번호 생성
	public int getQna();
	
	// 상품 문의 상품값으로 조회 
	@Select("select *from qna where product_code=#{product_code}")
	public List<QnaVO> QnaList(String product_code);
	
	
	
}
