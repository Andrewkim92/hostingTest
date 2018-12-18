package com.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.common.vo.ObjectVO;
import com.common.vo.boardVO;
import com.common.vo.memberVO;

public interface MemberMapper {

	@Insert("insert into user (id,pwd,name)"
			+ "value (#{userid},#{userpw},#{username})")
	public void create(memberVO vo) throws Exception;
	
	@Select("select * from user"
			+ "where id=#{userid}")
	public memberVO read(memberVO vo)throws Exception;
	public memberVO login(memberVO vo)throws Exception;

	public int createObject(ObjectVO vo);
	
	@Update("update vistor set vistorCnt=vistorCnt+1")
	public int cntVistor();

	@Insert("insert into board (subject,content,writer)"
			+ "value (#{subject},#{content},#{writer})")
	public void createItem(boardVO vo);

	@Select("select * from board")
	public List<boardVO> getAllItemList();

	@Select("select * from board where bno=#{bno}")
	public boardVO getBoardDetail(int bno);

	@Update("update board set subject='${subject}',content='${content}',writer='${writer}'"
			+ "where bno=${bno}")
	public void updateItem(boardVO vo);

	@Delete("delete from board where bno=${bno}")
	public void deleteItem(boardVO vo);

	@Insert("insert into reply (bno,reply,replyWriter)"
			+ "value (#{bno},#{reply},#{replyWriter})")
	public void createReply(boardVO vo);

	@Select("select *,COUNT(*) as cnt from reply where bno=#{bno}")
	public boardVO getReplyList(int bno);
	
}
