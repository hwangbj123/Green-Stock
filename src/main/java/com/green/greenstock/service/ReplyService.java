package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.repository.interfaces.ReplyRepository;
import com.green.greenstock.repository.model.Reply;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;

	public List<Reply> selectReplyList(int boardId) {
		return replyRepository.selectReplyList(boardId);
	}
	
	public int selectMaxRef(int boardId) {
		return replyRepository.selectMaxRef(boardId);
	}
	
	public int updateReply(Reply reply) {
		return replyRepository.updateReply(reply);
	}

	public int insertReply(Reply reply) {
		return replyRepository.insertReply(reply);
	}
	
	public int deleteReply(Reply reply) {
		return replyRepository.deleteReply(reply);
	}

}
