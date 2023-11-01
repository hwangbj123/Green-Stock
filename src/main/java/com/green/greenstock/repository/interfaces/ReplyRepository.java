package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.repository.model.Reply;

@Mapper
public interface ReplyRepository {
	public List<Reply> selectReplyList(ReplyPagingDto paging);
	public int selectReplyCount(int boardId);
	public int selectMaxRef(int boardId);
	public int getStep(Reply reply);
	public int maxStep(Reply reply);
	public int updateReply(Reply reply);
	public int updateReply2(Reply reply);
	public int insertReply(Reply reply);
	public int deleteReply(Reply reply);
}
