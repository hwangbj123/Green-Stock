package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.BoardSearchDto;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.interfaces.BoardRepository;
import com.green.greenstock.repository.model.Board;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	public List<String> findCategoryList(){
		return boardRepository.findCategoryList();
	}
	
	public int insertBoard(Board board) {
		return boardRepository.insertBoard(board); 
	}
	public List<Board> selectBoardListAll(PagingDto paging){
		return boardRepository.selectBoardListAll(paging);
	}
	public int selectBoardCount(PagingDto paging) {
		return boardRepository.selectBoardCount(paging);
	}
	
	public Board selectBoardById(int id) {
		return boardRepository.selectBoardById(id);
	}

	public int updateBoard(Board board) {
		return boardRepository.updateBoard(board);
	}
	
	public int deleteBoard(int boardId) {
		return boardRepository.deleteBoard(boardId);
	}
	
	public List<Board> selectBoardSearchList(PagingDto paging){
		return boardRepository.selectBoardSearchList(paging);
	}

}
