package com.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.common.vo.cityVO;

public interface searchMapper {

//	@Insert("insert into reply (bno,reply,replyWriter)"
//			+ "value (#{bno},#{reply},#{replyWriter})")
//	public void createReply(boardVO vo);

	@Select("select * from city where name=#{searchWord}")
	public List<cityVO> getLocationList(String searchWord);

//	@Update("update reply set reply=#{reply} where rno=#{rno}")
//	public void updateReply(boardVO vo);

//	@Delete("delete from reply where rno=#{rno}")
//	public void deleteReply(Integer rno);
	
}
