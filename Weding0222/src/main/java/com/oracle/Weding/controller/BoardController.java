package com.oracle.Weding.controller;

import java.io.File;
import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.Weding.dto.Board;
import com.oracle.Weding.dto.Member;
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
	public String detail(int b_num, Model model, HttpServletRequest request, HttpSession session 	) {
		
		if(session.getAttribute("member")==null) {
		System.out.println("BoardController boardDetail start..");
		Board board = bs.detail(b_num);
		model.addAttribute("board", board);
		} else {
			System.out.println("BoardController boardDetail start..");
			Board board = bs.detail(b_num);
			model.addAttribute("board", board);
			
			Member m1 = (Member) session.getAttribute("member");
			String selId = m1.getId();
			String p_num = board.getP_num();
			Board board11  = new Board();
			board11.setId(selId);
			board11.setP_num(p_num);
			
			System.out.println("selId" + selId);
			
			System.out.println(p_num+"&"+selId);
			int idResult = bs.cntAnswer(board11);
			System.out.println("BoardController boardDetail "+idResult);
			model.addAttribute("idResult", idResult);
		}
		
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
	public String update(Board board, Model model, HttpServletRequest request,HttpSession session, MultipartFile file1) {
		System.out.println("file1->"+file1);
        String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start");
		log.info("originalName: " + file1.getOriginalFilename());
		log.info("size: " + file1.getSize());
		log.info("contentType: " + file1.getContentType());
		log.info("uploadPath: " + uploadPath);
	    
	    String b_image1 = null;
		try {
			b_image1 = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
		} catch (AccessDeniedException e) {
			b_image1 = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
	   
	    System.out.println("업로드한 p_image11->"+b_image1);
	    
	  //DB에 상품 insert 
	    board.setB_image(b_image1);
	    
		int uptCnt = bs.update(board);
		System.out.println("bs.update(board) Count-->" + uptCnt);
		model.addAttribute("uptCnt", uptCnt);
		
					//	return "redirect:boardList?main_cat="+board.getMain_cat() +
					//			"&mini_cat="+board.getMini_cat()+ "&currentPage=1";
						
		int result = bs.update(board);
		System.out.println("BoardController update result->"+result);
		
		String boardListUrl = "redirect:boardList?main_cat="+board.getMain_cat() + "&mini_cat="+board.getMini_cat() +"&currentPage=1";
				
			if(board.getP_num().isEmpty()) {//
				return boardListUrl; 
			} else {
				return boardListUrl + "&p_num="+board.getP_num();
		}
		
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
	   public String write(Board board, Model model, HttpSession session,HttpServletRequest request
	                  ,MultipartFile file1) {
	      System.out.println("BoardController Start write...");
	      System.out.println("BoardController Start board.getP_num()->"+board.getP_num());
	      System.out.println("BoardController Start board.getB_title()->"+board.getB_title());
	            
	      Member m1 = (Member) session.getAttribute("member"); //로그인 후 글쓴이 넣기.
	        board.setId(m1.getId());
	        
	           System.out.println("file1->"+file1);
	            String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
	          System.out.println("uploadForm POST Start");
	          log.info("originalName: " + file1.getOriginalFilename());
	          log.info("size: " + file1.getSize());
	          log.info("contentType: " + file1.getContentType());
	          log.info("uploadPath: " + uploadPath);
	           
	           String b_image1 = null;
	         try {
	            b_image1 = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
	         } catch (AccessDeniedException e) {
	            b_image1 = null;
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	          
	           System.out.println("업로드한 p_image11->"+b_image1);
	           
	         //DB에 상품 insert 
	           board.setB_image(b_image1);
	      
	           log.info("board.getB_category(): " + board.getB_category());
	           int result = bs.insert(board);
	          String boardListUrl = "redirect:boardList?main_cat="+board.getMain_cat() +
	                "&mini_cat="+board.getMini_cat()+ "&currentPage=1"; //
	          if (result > 0) {
	             if(board.getP_num().isEmpty()) {//
	                return boardListUrl; 
	             } else {
	                return boardListUrl + "&p_num="+board.getP_num();
	             } 
	          } else {
	             model.addAttribute("msg", "입력 실패 확인해 보세요");
	             return "forward:/board/boardWriteForm";
	          }
       }
	
	
	// 파일 업로드
	private String uploadFile(String originalName, byte[] fileData , String uploadPath) 
			  throws Exception {
		UUID uid = UUID.randomUUID();
	   // requestPath = requestPath + "/resources/image";
	    System.out.println("uploadPath->"+uploadPath);
	    // Directory 생성 
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}

	    String savedName = originalName;
	    log.info("savedName: " + savedName);
	    File target = new File(uploadPath, savedName);
	    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
	    
	    return savedName;
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
		System.out.println("BoardController delete result->"+result);
		
		String boardListUrl = "redirect:boardList?main_cat="+board.getMain_cat()
							 + "&mini_cat="+board.getMini_cat() +"&currentPage=1";
		if(board.getP_num().isEmpty()) {//
			return boardListUrl; 
		} else {
			return boardListUrl + "&p_num="+board.getP_num();
		}
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
	public String qnaList(Board board, String currentPage, HttpSession session, Model model) {
		// 현재 접속한 세션 얻기
		Member member = (Member)session.getAttribute("member");
		board.setId(member.getId());
		
		// 소비자 판매자 구분 (100, 200)
		board.setMember_mini_cat(member.getMini_cat());	
		
		// 접속한 세션에 대한 게시글 수 얻어오기
		int total = bs.qnaListTotal(board);
		log.info("qnaListTotal: " + total);

		// 페이징 처리
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		
		// 게시글 얻어오기
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
	public String sellerQna(Board board, String currentPage, HttpSession session, Model model) {
		// 현재 접속한 세션 얻기
		Member member = (Member)session.getAttribute("member");
		board.setId(member.getId());
		
		// 접속한 세션에 대한 게시글 수 얻어오기
		int total = bs.sellerQnaTotal(board);
		
		// 페이징 처리
		Paging pg = new Paging(total, currentPage);
		board.setStart(pg.getStart());
		board.setEnd(pg.getEnd());
		
		// 게시글 얻어오기
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
	public String replyForm(int b_num, String id, Model model, String p_num) { 
		System.out.println("boardController replyForm start.. .. ");
		Board board = bs.replyForm(b_num);
		model.addAttribute("board", board);
		model.addAttribute("id", id); 
		model.addAttribute("p_num", board.getP_num());
		
		System.out.println("boardP_num" + board.getP_num());
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
	public String reply(Board board, HttpServletRequest request, Model model) {
		System.out.println("BoardController reply start .. .. . .");
		System.out.println("BoardController Start board.getP_num()->"+board.getP_num());
		System.out.println("BoardController Start board.getB_title()->"+board.getB_title());
		
		int result = bs.reply(board); 
		System.out.println("BoardController reply result->"+result);
		
		String boardListUrl = "redirect:boardList?main_cat="+board.getMain_cat() + "&mini_cat="+board.getMini_cat();
				
		if(board.getP_num().isEmpty()) {//
			return boardListUrl; 
		} else {
			return boardListUrl + "&p_num="+board.getP_num();
		}
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
	public List<Board> reviewBoardList(Board board) {
		log.info("reviewBoardList()");
//		int total = bs.reviewBoardListTotal(board);
//		Paging pg = new Paging(total, currentPage);
//		board.setStart(pg.getStart());
//		board.setEnd(pg.getEnd());
		List<Board> reviewBoardList = bs.reviewBoardList(board);
//		model.addAttribute("pg", pg);
//		model.addAttribute("total", total);
		
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
	
	
	/**
	 * 답변 여부
	 * 작성자: 장동호 
	 */
	@RequestMapping(value = "replyCount")
	@ResponseBody
	public int replyCount(Board board) {
		log.info("replyCount()");
		int result = bs.replyCount(board);
		
		return result;
	}
	
	/**
	 * 게시글 검색
	 * 작성자: 조소현 
	 */
	@GetMapping(value="getSearchBoard")
	private String getSearchBoard(Board board, Model model){
		System.out.println("BoardController getSearchBoard Start…");
		System.out.println("board main_cat =>"+board.getMain_cat());
		System.out.println("board mini_cat =>"+board.getMini_cat());
		System.out.println("board keyword =>"+board.getKeyword());
		List<Board> listBoard = bs.getSearchBoard(board);
		model.addAttribute("listBoard", listBoard);
		return "board/boardList";
	}
	
}
