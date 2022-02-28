package com.oracle.Weding.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.Weding.dto.Board;
import com.oracle.Weding.service.BoardService;
import com.oracle.Weding.service.Paging;

import lombok.extern.java.Log;

@Controller
@Log
public class BoardController {
	
	@Autowired private BoardService bs;
	
	
	/**
	 * 게시판 목록
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param board
	 * @param currentPage
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "boardList")
	public String noticeList(Board board, String currentPage, Model model, HttpServletRequest request) {
		System.out.println("BoardController boardlist Start...");
		int total = bs.total(board);
		System.out.println("BoardController total ->" + total);
		System.out.println("BoardController board  getMain_cat ->" + board.getMain_cat());
		System.out.println("BoardController board  getMini_cat ->" + board.getMini_cat());
		System.out.println("BoardController request   ->" + request);
		System.out.println("BoardController currentPage -> " + currentPage);
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		List<Board> listBoard = bs.listBoard(board);

		model.addAttribute("listBoard", listBoard);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/board/boardList";
	}

	
	/**
	 * boardDetail 자세히보기
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param b_num
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping(value = "boardDetail")
	public String detail(int b_num, Model model, HttpServletRequest request) {
		System.out.println("BoardController boardDetail start..");
		Board board = bs.detail(b_num);
		model.addAttribute("board", board);

		return "/board/boardDetail";
	}

	
	/**
	 * 수정 폼으로 이동
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param b_num
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping(value = "updateForm")
	public String updateForm(int b_num, Model model, HttpServletRequest request) {
		System.out.println("BoardController boardUpdateForm Start...");
		Board board = bs.detail(b_num);
		model.addAttribute("board", board);

		return "/board/boardUpdateForm";
	}
	
	
	/**
	 * 수정 등록
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param board
	 * @param model
	 * @param request
	 * @return
	 */
	@PostMapping(value = "update")
	public String update(Board board, Model model, HttpServletRequest request) {
		int uptCnt = bs.update(board);
		System.out.println("bs.update(board) Count-->" + uptCnt);
		model.addAttribute("uptCnt", uptCnt);
		
		return "redirect:boardList?main_cat="+board.getMain_cat() +
				"&mini_cat="+board.getMini_cat()+"&currentPage=1";
	}

	
	/**
	 * 글작성
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param board
	 * @param model
	 * @return
	 */
	@GetMapping(value = "writeForm")
	public String writeForm(Board board, Model model) {
		System.out.println("writeForm Start....");
		
		model.addAttribute("board", board);
		
		return "/board/boardWriteForm";
	}

	
	/**
	 * 글작성 등록
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param board
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, Model model, HttpSession session) {
		System.out.println("BoardController Start write...");
		
		int result = bs.insert(board);
		
		if (result > 0)
			return "redirect:boardList?main_cat="+board.getMain_cat() +
				   "&mini_cat="+board.getMini_cat()+"&currentPage=1"; // forward 지우고 redirect.
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:/board/boardWriteForm";
		}
	}

	
	/**
	 * 게시글 삭제
	 * 작성자: 송지훈, 임채영
	 * 
	 * @param board
	 * @param b_num
	 * @param model
	 * @return
	 */
	@PostMapping(value = "delete")
	public String delete(Board board, int b_num, Model model) {
		System.out.println("BoardController delete Start ");
		int result = bs.delete(b_num);
		
		return "redirect:boardList?main_cat="+board.getMain_cat() +
				"&mini_cat="+board.getMini_cat()+"&currentPage=1"; // forward 지우고 redirect.		

	}
	
	
	/**
	 * 소비자 - 1대1 문의내역
	 * 작성자: 송지훈
	 * 
	 * @param board
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "qnaList")
	public String qnaList(Board board, String currentPage, Model model) {
		System.out.println("BoardController qnaList Start... ");
		board.setMain_cat("300");
		board.setMini_cat("300");
		int total = bs.total(board);
		System.out.println("BoardController total->" + total);
		System.out.println("currentPage->" + currentPage);

		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		List<Board> qnaList = bs.qnaList(board);
		System.out.println("BoardController qnaList.size()->" + qnaList.size());
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/mypage/qnaList"; 
	}

	
	/**
	 * 소비자 - Q&A 문의내역
	 * 작성자: 송지훈
	 * 
	 * @param board
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "sellerQna")
	public String sellerQna(Board board, String currentPage, Model model) {
		System.out.println("BoardController sellerQna Start...");
		int total = bs.total(board);
		System.out.println("BoardController sellerQna total->" + total);
		System.out.println("currentPage->" + currentPage);

		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		List<Board> sellerQna = bs.sellerQna(board);
		System.out.println("BoardController sellerQna.size()->" + sellerQna.size());
		model.addAttribute("sellerQna", sellerQna);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);

		return "/mypage/sellerQna";
	}
	
	
	/**
	 * 답글 폼으로 이동
	 * 작성자: 임채영
	 * 
	 * @param b_num
	 * @param model
	 * @return
	 */
	@RequestMapping("/replyForm") 
	public String replyForm(int b_num, Model model) { 
		System.out.println("boardController replyForm start.. .. ");
		Board board = bs.replyForm(b_num);
		model.addAttribute("board", board);
		
		return "/board/replyForm";
	}
	
	
	/**
	 * 답글 작성 처리
	 * 작성자: 임채영
	 * 
	 * @param board
	 * @return
	 */
	@RequestMapping("/reply")
	public String reply(Board board) {
		System.out.println("BoardController reply start .. .. . .");
		int result = bs.reply(board); 
		System.out.println("BoardController reply result->"+result);
		
	    return "redirect:boardList?main_cat="+board.getMain_cat() +
	  			"&mini_cat="+board.getMini_cat()+"&currentPage=1";
				
	}
	
	
	/**
	 * 관리자 - Q&A 리스트
	 * 작성자: 장동호
	 *
	 * @param board
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "qnaBoardList")
	public String qnaBoardList(Board board, String currentPage, Model model) {
		int total = bs.qnaBoardListTotal();
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		List<Board> qnaBoardList = bs.qnaBoardList(board);
		log.info(qnaBoardList == null? "qnaBoardList is null":"qnaBoardList is not null");
		model.addAttribute("qnaBoardList", qnaBoardList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/admin/qna";
	}
	
	
	/**
	 * 리뷰 게시판 목록 조회
	 * 작성자: 장동호
	 * 
	 * @param model
	 * @param board
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value = "reviewBoardList")
	@ResponseBody
	public List<Board> reviewBoardList(Model model, Board board, String currentPage) {
		log.info("reviewBoardList()");
		int total = bs.reviewBoardListTotal();
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		List<Board> reviewBoardList = bs.reviewBoardList(board);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return reviewBoardList;
	}
	
	
	/**
	 * 리뷰 작성 처리
	 * 작성자: 장동호
	 * 
	 * @param board
	 * @return
	 */
	@RequestMapping(value = "reviewBoardWrite")
	@ResponseBody
	public int reviewBoardWrite(Board board) {
		log.info("reviewBoardWrite()");
		int result = bs.reviewBoardWrite(board);
		
		return result;
	}
	
}
