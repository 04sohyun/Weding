package com.oracle.Weding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.Weding.dao.BoardDao;
import com.oracle.Weding.dto.Board;

import lombok.extern.java.Log;

@Service
@Log
public class BoardServiceImpl implements BoardService {
	
	@Autowired private BoardDao bd;
	
	
	/**
	 * Q&A 전체 게시글 수
	 * 작성자: 장동호
	 */
	@Override
	public int qnaBoardListTotal() {
		int totCnt = bd.qnaBoardListTotal();
		log.info("qnaBoardListTotal totCnt: " + totCnt);
		
		return totCnt;
	}
	
	
	/**
	 * 관리자 - Q&A 게시글 전체 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Board> qnaBoardList(Board board) {
		List<Board> qnaBoardList = bd.qnaBoardList(board);
		
		return qnaBoardList;
	}

	
	/**
	 * 리뷰 목록 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Board> reviewBoardList(Board board) {
		List<Board> reviewBoardList = bd.reviewBoardList(board);
		
		return reviewBoardList;
	}

	
	/**
	 * 리뷰 작성
	 * 작성자: 장동호
	 */
	@Override
	public int reviewBoardWrite(Board board) {
		int result = bd.reviewBoardWrite(board);
		
		return result;
	}

	
	/**
	 * 리뷰 게시글 수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int reviewBoardListTotal() {
		int totCnt = bd.reviewBoardListTotal();
		log.info("reviewBoardListTotal totCnt: " + totCnt);
		
		return totCnt;
	}
	
	
	/**
	 * 전체 게시글 수 조회
	 * 작성자: 임채영, 송지훈
	 */
	@Override
	public int total(Board board) {
		System.out.println("BoardServiceImpl total Start...");
		int totCnt = bd.total(board);
		System.out.println("BoardServiceImpl total totCnt ->" + totCnt);
		return totCnt;
	}

	
	/**
	 * 전체 게시글 조회
	 * 작성자: 임채영, 송지훈
	 */
	@Override
	public List<Board> listBoard(Board board) {
		List<Board> boardList = null;
		System.out.println("BoardServiceImpl listBoard Start...");
		boardList = bd.listBoard(board);

		return boardList;
	}
	
	
	/**
	 * 해당 게시글 조회
	 * 작성자: 송지훈, 임채영
	 */
	@Override
	public Board detail(int b_num) {
		System.out.println("BoardServiceImpl detail ");
		Board board = null;
		board = bd.detail(b_num);
		bd.hit(b_num);
		
		return board;
	}

	
	/**
	 * 해당 게시글 삭제
	 * 작성자: 송지훈, 임채영
	 */
	@Override
	public int delete(int b_num) {
		System.out.println("BoardServiceImpl  delete Start...");
		int result = bd.delete(b_num);
		
		return result;
	}

	/**
	 * 해당 글 수정
	 * 작성자: 송지훈, 임채영
	 */
	@Override
	public int update(Board board) {
		System.out.println("BoardServiceImpl update....");
		int kkk=0;
		kkk =bd.update(board);
		
		return kkk;
	}


	/**
	 * 글 작성
	 * 작성자: 송지훈, 임채영
	 */
	@Override
	public int insert(Board board) {
		int result = 0;
		System.out.println("BoardServiceImpl insert Start..." );
		result = bd.insert(board);
		
		return result;
	}
	
	
	/**
	 * 소비자 - 1대1 문의내역 목록
	 * 작성자: 송지훈
	 */
	@Override
	public List<Board> qnaList(Board board) {
		List<Board> qnaList = null;
		System.out.println("BoardServiceImpl qnaList Start... ");
		qnaList = bd.qnaList(board);
		
		return qnaList;
	}

	
	/**
	 * 소비자 - Q&A 문의내역 목록
	 * 작성자: 송지훈
	 */
	@Override
	public List<Board> sellerQna(Board board) {
		List<Board> sellerQna = null;
		System.out.println("BoardServiceImpl sellerQna start...");
		sellerQna = bd.sellerQna(board);
		
		return sellerQna;
	}

	
	/**
	 * 답글 폼
	 * 작성자: 임채영
	 */
	@Override
	public Board replyForm(int b_num) {
		Board replyForm=null;
		System.out.println("BoardServiceImpl replyForm start.. ..");
		replyForm = bd.replyForm(b_num);
		
		return replyForm;
	}

	
	/**
	 * 답글 처리
	 * 작성자: 임채영
	 */
	@Override
	public int reply(Board board) {
		int result1 = bd.reply(board);
	//	int result2 = bd.replyShape(board);

		System.out.println("BoardServiceImpl reply start . .... .");
	
		return result1;
	}
	
}
