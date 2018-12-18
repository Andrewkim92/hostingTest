package com.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.common.vo.ObjectVO;
import com.common.vo.boardVO;
import com.common.vo.memberVO;

public interface replyMapper {

	@Insert("insert into reply (bno,reply,replyWriter)"
			+ "value (#{bno},#{reply},#{replyWriter})")
	public void createReply(boardVO vo);

	@Select("select * from reply where bno=#{bno}")
	public List<boardVO> getReplyList(int bno);

	@Update("update reply set reply=#{reply} where rno=#{rno}")
	public void updateReply(boardVO vo);

	@Delete("delete from reply where rno=#{rno}")
	public void deleteReply(Integer rno);
	
}
