package com.oracle.Weding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.Weding.dto.Alarm;
import com.oracle.Weding.dto.Cat;
import com.oracle.Weding.dto.Dibs;
import com.oracle.Weding.dto.Member;
import com.oracle.Weding.dto.Orders;
import com.oracle.Weding.dto.Pname;
import com.oracle.Weding.dto.Product;
import com.oracle.Weding.service.MemberService;
import com.oracle.Weding.service.Paging;
import com.oracle.Weding.service.ProductService;

import lombok.extern.java.Log;

@Controller
@Log
public class ProductController {
	
	@Autowired private ProductService ps;
	@Autowired private MemberService ms;
	
	
	/**
	 * 메인페이지 이동
	 * 작성자: 장동호
	 * 
	 * 메인페이지 이동 & 랜덤, 인기, 당일 오픈, 리뷰가 있는 상품 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "main")
    public String main(Model model,HttpSession session) {
	    if(session.getAttribute("member")!=null) {
	    	Member m1 = (Member) session.getAttribute("member");
	     
	        Member member = ms.readMember(m1.getId());
	        session.setAttribute("member", member);
	    }
	  
		List<Product> randomProduct = ps.getRandomProduct();
		List<Product> popularProduct = ps.getPopularProduct();
		List<Product> openProduct = ps.getOpenProduct();
		List<Product> reviewProduct = ps.getReviewProduct();
		model.addAttribute("randomProduct" ,randomProduct);
		model.addAttribute("popularProduct" ,popularProduct);
		model.addAttribute("openProduct" ,openProduct);
		model.addAttribute("reviewProduct" ,reviewProduct);
	  
		return "main";
	}
	
	
	/**
	 * 펀딩예정 상품 목록
	 * 작성자: 장동호
	 * 
	 * 펀딩예정인 상품들을 조회
	 * 
	 * @param product
	 * @param currentPage
	 * @param main_cat
	 * @param mini_cat
	 * @param p_condition
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/beforeFundList")
	public String beforeFundList(Product product,
                         @RequestParam(value = "main_cat", defaultValue = "200") String main_cat, // default : main_cat = 200 
                         @RequestParam(value = "mini_cat", defaultValue = "999") String mini_cat, // default : main_cat = 999 
                         @RequestParam(value = "p_condition", defaultValue = "1") String p_condition, // default : p_condition = 1
                         Model model) {
		int total = ps.beforeFundListTotal();
	    List<Product> productList = null;
	    product.setMain_cat(main_cat);
	    product.setMini_cat(mini_cat);
	    product.setP_condition(p_condition);
	    productList = ps.productList(product);
	    model.addAttribute("productList", productList);
	    model.addAttribute("total", total);
	  
	    return "/product/beforeFundList";
   }
	
	
	/**
	 * 펀딩중 상품 목록
	 * 작성자: 장동호, 조소현
	 * 
	 * 펀딩중인 상품들을 카테고리별로 조회
	 * 
	 * @param product
	 * @param currentPage
	 * @param main_cat
	 * @param mini_cat
	 * @param p_condition
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/fundingList")
	public String fundingList(Product product,
							  @RequestParam(value = "currentPage", defaultValue = "1" ) String currentPage,
			 				  @RequestParam(value = "main_cat", defaultValue = "200") String main_cat, 
			 				  @RequestParam(value = "mini_cat", defaultValue = "101") String mini_cat, 
			 				  @RequestParam(value = "p_condition", defaultValue = "2") String p_condition, 
			 				  Model model) {
		System.out.println("ProductController fundingList Start…");
		//펀딩 중 상품목록에서 카테고리 이름 정렬 가져오기
		List<Cat> catList = ps.arrayCategory();
		model.addAttribute("catList", catList);
		product.setMain_cat(main_cat);
		product.setMini_cat(mini_cat);
		product.setP_condition(p_condition);
		int total = ps.fundingListTotal(product);
		Paging pg = new Paging(total, currentPage);
		product.setStart(pg.getStart());
		product.setEnd(pg.getEnd());
		List<Product> productList = null;
		productList = ps.productList(product);
		log.info(productList == null? "productlist is null":"productlist is not null");
		model.addAttribute("productList", productList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/product/fundingList";
	}
	
	
	/**
	 * 펀딩종료 목록
	 * 작성자: 장동호, 조소현
	 * 
	 * 펀딩종료된 상품들을 카테고리별로 조회
	 * 
	 * @param product
	 * @param currentPage
	 * @param main_cat
	 * @param mini_cat
	 * @param p_condition
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/fundingEndList")
	public String fundingEndList(Product product,
							     @RequestParam(value = "currentPage", defaultValue = "1" ) String currentPage,
			 				     @RequestParam(value = "main_cat", defaultValue = "200") String main_cat,
				 				 @RequestParam(value = "mini_cat", defaultValue = "101") String mini_cat,
				 				 @RequestParam(value = "p_condition", defaultValue = "3") String p_condition, 
				 				 Model model) {
		//펀딩 중 상품목록에서 카테고리 이름 정렬 가져오기
		List<Cat> catList = ps.arrayCategory();
		model.addAttribute("catList", catList);
		product.setMain_cat(main_cat);
		product.setMini_cat(mini_cat);
		product.setP_condition(p_condition);
		int total = ps.fundingListTotal(product);
		Paging pg = new Paging(total, currentPage);
		product.setStart(pg.getStart());
		product.setEnd(pg.getEnd());
		List<Product> productList = null;
		productList = ps.productList(product);
		log.info(productList == null? "productlist is null":"productlist is not null");
		model.addAttribute("productList", productList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/product/fundingEndList";
	}
	
	
	/**
	 * 펀딩내역 조회
	 * 작성자: 장동호
	 * 
	 * @param orders
	 * @param product
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "payList")
	public String payList(HttpSession session,
						  Orders orders,
						  Product product,
						  @RequestParam(value = "currentPage", defaultValue = "1" ) String currentPage, 
						  Model model) {
		Member member = (Member) session.getAttribute("member");
		orders.setId(member.getId());
		
		int total = ps.payListTotal(orders);
		Paging pg = new Paging(total, currentPage);
		orders.setStart(pg.getStart());
		orders.setEnd(pg.getEnd());
		List<Orders> payList = ps.payList(orders);		
		model.addAttribute("payList", payList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/mypage/payList";
	}
	
	
	/**
	 * 펀딩내역 취소
	 * 작성자: 장동호
	 * 
	 * @param orders
	 * @return
	 */
	@PostMapping(value = "payDelete")
	public String payDelete(Orders orders) {
		log.info("payDelete orders.getId() : " + orders.getId());
		log.info("payDelete orders.getP_num() : " + orders.getP_num());
		log.info("payDelete orders.getO_num() : " + orders.getO_num());
		int result = ps.payDelete(orders);
		log.info("payDelete result: " + result);
		if(result > 0) {
			ps.subCurPrice(orders);
		}
		
		return "redirect:payList";
	}

	
	/**
     * 주문 정보 입력 폼 이동
     * 작성자: 장동호
     */
    @RequestMapping(value = "orderForm")
    public String orderForm(Orders orders, Product product, Model model) {
    	Product orderProduct = ps.allProductUpdateForm(product);
    	orders.setO_sum(orders.getO_qty() * orders.getP_price());
    	model.addAttribute("orderProduct", orderProduct);
    	model.addAttribute("orders", orders);
    	
    	return "/product/orderForm";
    }
    
	
	/**
	 * 결제 처리
	 * 작성자: 장동호
	 * 
	 * @param orders
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "orders")
	@ResponseBody
	public int orders(Orders orders, Model model) {
		int result = ps.orders(orders);
		if(result > 0) {
			ps.sumCurPrice(orders);
		}
		
		return result;
	}
	
    
    /**
     * 결제 결과 처리
     * 작성자: 장동호
     * 
     * 결제 성공/실패 여부 확인 & 주문한 상품의 정보 확인
     *  
     * @param orders
     * @param model
     * @return
     */
    @RequestMapping(value = "orderSuccess")
    public String orderSuccess(Orders orders, Model model) {
    	model.addAttribute("orders", orders);
    	
    	return "/product/orderSuccess";
    }
    
    
    /**
     * 마이페이지 - 찜목록
     * 작성자: 김태근
     * 
     * @param product
     * @param model
     * @return
     */
 	@RequestMapping(value = "dibsList")
 	public String dibsList(Product product, Model model, HttpSession session) {
 		// product + 찜목록 가져옴
 		
 		Member member = (Member) session.getAttribute("member");
 		product.setConsumer_id(member.getId());
 		
 		System.out.println("ProductController dibsList Start...");
 		List<Product> dibsList = ps.dibsList(product);
 		System.out.println("ProductController dibsList listProduct.size() ->" + dibsList.size());
 		model.addAttribute("dibsList", dibsList);
 		
 		return "mypage/dibsList";
 	}
    
 	
    /**
     * 관리자페이지 - 전체 상품관리List 조회
     * 작성자: 김태근
     * 
     * @param product
     * @param currentPage
     * @param model
     * @return
     */
 	@GetMapping(value = "allProductList")
 	public String allProductList(Product product, String currentPage, Model model) {
 		System.out.println("ProductController allProductList Start...");
 		int total = ps.total();
 		System.out.println("ProductController total => " + total);
 		System.out.println("currentPage => " + currentPage);
 		Paging pg = new Paging(total, currentPage);
 		product.setStart(pg.getStart());
 		product.setEnd(pg.getEnd());
 		List<Product> allproductListAll = ps.allproductListAll(product);
 		System.out.println("ProductController allProductList productAll.size() ->" + allproductListAll.size());
 		model.addAttribute("allproductListAll", allproductListAll);
 		model.addAttribute("pg", pg);
 		model.addAttribute("total", total);
 		
 		return "admin/allProductList";
 	}
 	
 	
 	/**
 	 * 관리자페이지 - 전체상품 UpdateForm
 	 * 작성자: 김태근
 	 * 
 	 * @param product
 	 * @param model
 	 * @return
 	 */
 	@GetMapping(value = "allProductUpdateForm")
 	public String allProductUpdateForm(Product product, Model model) {
 		System.out.println("ProductController allProductUpdateForm Start...");
 		Product allProductUpdateForm = ps.allProductUpdateForm(product);
 		System.out.println("ProductController allProductUpdateForm -> " + allProductUpdateForm);
 		model.addAttribute("allProductUpdateForm", allProductUpdateForm);
 		return "admin/allProductUpdateForm";
 	}

 	
 	/**
 	 * 관리자페이지 - 전체상품중 해당상품Update
 	 * 작성자: 김태근
 	 * 
 	 * @param product
 	 * @param model
 	 * @return
 	 * @throws Exception 
 	 * @throws IOException 
 	 */
	@PostMapping(value ="allProductUpdate")
	public String allProductUpdate(Product product, Model model, HttpServletRequest request, MultipartFile file1, MultipartFile file2) throws IOException, Exception {
		System.out.println("ProductController allProductUpdate Start...");
		
		//상품사진업로드
		System.out.println("file1->"+file1);
		System.out.println("file2->"+file2);
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start");
		log.info("originalName: " + file1.getOriginalFilename());
		log.info("size: " + file1.getSize());
		log.info("contentType: " + file1.getContentType());
		log.info("uploadPath: " + uploadPath);
	    
	    String p_image11 = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
	    String p_image22 = uploadFile(file2.getOriginalFilename(), file2.getBytes(), uploadPath);
		
	    System.out.println("업로드한 p_image11->"+p_image11);
	    System.out.println("업로드한 p_image22->"+p_image22);
		
	    //DB에 상품 insert 
	    product.setP_image1(p_image11);
	    product.setP_image2(p_image22);
		
		int allProductUpdate = ps.allProductUpdate(product);
		System.out.println("ProductController allProductUpdate count -> " + allProductUpdate);
		model.addAttribute("allProductUpdate", allProductUpdate);
		
		return "redirect:allProductList";
	}
	
	
	/**
	 * 관리자페이지 - 전체상품중 해당상품List에서 Ajax로 Delete
	 * 작성자: 김태근
	 * @param product
	 * @return
	 */
	@RequestMapping("/allProductDelete")
	@ResponseBody
	public String allProductDelete(Product product) {
		System.out.println("ProductController allProductDelete Start...");
		System.out.println("ProductController allProductDelete product.getP_num() ->" + product.getP_num());
		int allProductStatus = ps.delete(product.getP_num());
		String allProductStatusStr = Integer.toString(allProductStatus);
		
		return allProductStatusStr;
	}
	
	/**
	 * 관리자페이지 - 전체상품중 해당상품 Detail에서 Delete
	 * 작성자: 김태근
	 * 
	 * @param p_num
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "allProductDetailDelete")
	public String allProductDetailDelete(String p_num, Model model) {
		System.out.println("ProductController allProductDetailDelete Start...");
		int allProductStatus = ps.delete(p_num);
		
		return "redirect:allProductList";
	}
	
	
	/**
	    * 판매자페이지 - 상품 등록 폼으로 이동
	    * 작성자: 안혜정
	    * 
	    * @param model
	    * @return
	    */
	   @GetMapping(value = "addProductForm")
	   public String addProductForm(Model model) {
	      List<Product> catList = ps.listCat();
	      System.out.println("ProductController catList size() : "+catList.size());
	      
	      // 등록 최소 날짜
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date date = new Date();
	      Calendar c = Calendar.getInstance();
	      c.setTime(date);
	      c.add(Calendar.DATE, 1);
	      date = c.getTime();
	      String now = sdf.format(date);
	      
	      c.add(Calendar.DATE, 60);
	      String endDate = sdf.format(c.getTime());
	      
	      model.addAttribute("now", now);
	      model.addAttribute("endDate",endDate);
	      model.addAttribute("catList",catList);
	      
	      return "product/addProductForm";
	   }
	
	
	/**
	 * 판매자페이지 - 상품 등록
	 * 작성자: 안혜정
	 * 
	 * @param product
	 * @param model
	 * @return
	 */
	@PostMapping(value = "addProduct")
	public String addProduct(Product product, HttpServletRequest request, HttpSession session,
							MultipartFile file1, MultipartFile file2, Model model) 
							throws Exception {
		System.out.println("ProductController addProduct Start..");
//		System.out.println("prodduct.getP_image1()->"+product.getP_image1());
//		System.out.println("p_image1->"+p_image1);
//		System.out.println("p_image2->"+p_image2);
		System.out.println("file1->"+file1);
		System.out.println("file2->"+file2);
		
		//상품사진업로드
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start");
		log.info("originalName: " + file1.getOriginalFilename());
		log.info("size: " + file1.getSize());
		log.info("contentType: " + file1.getContentType());
		log.info("uploadPath: " + uploadPath);
	    
	    String p_image11 = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
	    String p_image22 = uploadFile(file2.getOriginalFilename(), file2.getBytes(), uploadPath);
		
	    System.out.println("업로드한 p_image11->"+p_image11);
	    System.out.println("업로드한 p_image22->"+p_image22);
		
	    //DB에 상품 insert 
	    product.setP_image1(p_image11);
	    product.setP_image2(p_image22);
	    
		Member m1 = (Member) session.getAttribute("member");
		product.setId(m1.getId());
		System.out.println("product.getId()->"+product.getId());

		int result = ps.insert(product);
		
		if(result>0) return "redirect:beforeFundList";
		else {
			model.addAttribute("msg","상품이 등록되지 않았습니다.");
			return "addProductForm"; //리턴안됨 수정예정
		}
	}
	
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
	 * 상품 정렬
	 * 작성자: 안혜정
	 * 
	 * @param product
	 * @param model
	 * @return
	 */
	@RequestMapping(value="sortProduct")
	public String sortProduct(Product product, Model model) {
		System.out.println("ProductController sortProduct Start..");
		//펀딩 중 상품목록에서 카테고리 이름 정렬 가져오기
		List<Cat> catList = ps.arrayCategory();
		model.addAttribute("catList", catList);
		String sort = product.getSort();
		
		//최신순 정렬
		if(sort.equals("newSort")) {
			log.info("newSort");
			List<Product> sortNewProduct = ps.sortNewProduct(product);
			model.addAttribute("productList",sortNewProduct);
		}
		
		//인기순 정렬
		if(sort.equals("popularSort")) {
			log.info("popularSort");
			List<Product> sortPopularProduct = ps.sortPopularProduct(product);
			model.addAttribute("productList",sortPopularProduct);
		}
		
		//달성순 정렬
		if(sort.equals("goalSort")) {
			log.info("goalSort");
			List<Product> sortGoalProduct = ps.sortGoalProduct(product);
			model.addAttribute("productList",sortGoalProduct);
		}
		
		return "product/fundingList";
	}
	
	
	/**
	 * 펀딩예정/중/종료상품 상세보기
	 * 작성자: 조소현
	 *  
	 * @param p_num
	 * @param p_condition
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="fundingDetail")
	public String fundingDetail(int p_num, int p_condition, HttpSession session, Model model) {
		System.out.println("ProductController fundingDetail Start...");
		System.out.println("p_num->"+p_num);
		System.out.println("p_condition->"+p_condition);
		// 상품상세보기
		Product product = ps.productDetail(p_num);
		//달성률 받아오기 
		int attainment = ps.attainment(p_num);
		//관련상품 받아오기 
		List<Product> productList = ps.recommendProduct(p_condition);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String now = sdf.format(date);
		model.addAttribute("now", now);
		
		if(session.getAttribute("member")==null) {
			product = ps.productDetail(p_num);
			attainment = ps.attainment(p_num);
			productList = ps.recommendProduct(p_condition);
			
		} else {
		//세션 객체 안에 있는 ID정보 저장
		Member m1 = (Member) session.getAttribute("member");
		Member member= new Member();
		member.setId(m1.getId());
		
		//로그인한 아이디 확인
		String loginId = m1.getId();
		model.addAttribute("loginId", loginId);
		
		// 소비자의 상품 구매 내역 확인 (주문했던 상품은 주문 불가)
		Product orderProduct = new Product();
		orderProduct.setP_num(String.valueOf(p_num));
		orderProduct.setConsumer_id(loginId);
		int orderCheck = ps.orderCheck(orderProduct);
		log.info("orderCheck: " + orderCheck);
		model.addAttribute("orderCheck", orderCheck);
		
		//로그인 후 상품 찜하기 했는지 확인하기
		Dibs dibs = new Dibs();
		dibs.setId(member.getId());
		dibs.setP_num(String.valueOf(p_num));
		int count= ps.dibsProduct(dibs);
		model.addAttribute("count", count);
		//로그인 후 상품 알림신청했는지 확인하기
		Alarm alarm = new Alarm();
		alarm.setP_num(String.valueOf(p_num));
		alarm.setId(member.getId());
		int alarmCount = ps.alarmProduct(alarm);
		model.addAttribute("alarmCount", alarmCount);
		}
		model.addAttribute("product", product);
		model.addAttribute("attainment", attainment);
		model.addAttribute("productList", productList);
		if(p_condition==1) {
			return "product/beforeFundDetail";
		}else {
			return "product/fundingDetail";
		}
	}
	
	
	/**
	 * 상품검색
	 * 작성자: 조소현
	 *  
	 * @param keyword
	 * @param model
	 * @return
	 */
	@GetMapping(value="getSearchProduct")
	private String getSearchProduct(Product product, Model model){
		System.out.println("ProductController getSearchProduct Start...");
		System.out.println("ProductController getSearchProduct keyword->"+product.getKeyword());
		//펀딩 중 상품목록에서 카테고리 이름 정렬 가져오기
		List<Cat> catList = ps.arrayCategory();
		model.addAttribute("catList", catList);		
		
		//펀딩중/종료 구분하기 
		System.out.println(product.getP_condition());
		List<Product> productList = ps.getSearchList(product);
		model.addAttribute("productList", productList);
		return "product/fundingList";
	}
	
	
	/**
	 * 찜하기
	 * 작성자: 조소현
	 *  
	 * @param p_num
	 * @param session
	 * @return
	 */
	@RequestMapping("/getDibsProduct")
	@ResponseBody
	public String getDibsProduct(String p_num, HttpSession session) {
		System.out.println("ProductController getDibsProduct Start...");
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		Member member= new Member();
		member.setId(m1.getId());
		
		Dibs dibs = new Dibs();
		dibs.setP_num(p_num);
		dibs.setId(member.getId());
		
		int dibsNum = ps.pushDibs(dibs);
		String dibsNumStr = Integer.toString(dibsNum);
		return dibsNumStr;
	}
	
	
	/**
	 * 찜하기 취소
	 * 작성자: 조소현
	 *  
	 * @param p_num
	 * @param session
	 * @return
	 */
	@RequestMapping("/cancleDibsProduct")
	@ResponseBody
	public String cancleDibsProduct(String p_num, HttpSession session) {
		System.out.println("ProductController getDibsProduct Start...");
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		Member member= new Member();
		member.setId(m1.getId());
		
		Dibs dibs = new Dibs();
		dibs.setP_num(p_num);
		dibs.setId(member.getId());
		
		int dibsNum = ps.cancleDibs(dibs);
		String dibsNumStr = Integer.toString(dibsNum);
		return dibsNumStr;
	}
	
	
	/**
	 * 알림신청하기
	 * 작성자: 조소현
	 * 
	 * @param alarm
	 * @param session
	 * @return
	 */
	@RequestMapping("/plzAlarm")
	@ResponseBody
	public String plzAlarm(Alarm alarm, HttpSession session) {
		System.out.println("ProductController getDibsProduct Start...");
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		Member member= new Member();
		member.setId(m1.getId());
		
		Alarm alarm1 = new Alarm();
		alarm1.setP_num(alarm.getP_num());
		alarm1.setA_date(alarm.getA_date());
		alarm1.setId(member.getId());
		
		int alarmNum = ps.plzAlarmInsert(alarm1);
		String alarmNumStr = Integer.toString(alarmNum);
		return alarmNumStr;
	}
	
	
	/**
	 * 알림신청 취소
	 * 작성자: 조소현
	 * 
	 * @param p_num
	 * @param session
	 * @return
	 */
	@RequestMapping("/canclePlzAlarm")
	@ResponseBody
	public String canclePlzAlarm(String p_num, HttpSession session) {
		System.out.println("ProductController canclePlzAlarm Start...");
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		Member member= new Member();
		member.setId(m1.getId());
		
		Alarm alarm = new Alarm();
		alarm.setP_num(p_num);
		alarm.setId(member.getId());
		
		int alarmNum = ps.plzAlarmDelete(alarm);
		String alarmNumStr = Integer.toString(alarmNum);
		return alarmNumStr;
	}
	
	
	/**
	 * 상품이름 다 가져오기
	 * 작성자: 조소현
	 * 
	 * @return
	 */
	@RequestMapping("/optionWord")
	@ResponseBody
	public List<Pname> optionWord(){
		System.out.println("ProductController optionWord Start...");
		List<Pname> pNameTotal = ps.searchPName();
		return pNameTotal;
	}
	
	
	/**
	 * 판매자용 판매 상품관리 목록
	 * 작성자: 송지훈
	 * 
	 * @param product
	 * @param currentPage
	 * @param model
	 * @return
	 */
	
	@GetMapping(value = "soldList")
	public String soldList(Product product, String currentPage, Model model, HttpSession session) {
		System.out.println("ProductController soldList Start... ");
		
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member"); 
		product.setId(m1.getId()); 
		
		int total  = ps.soldListTotal(product); 
		
		System.out.println("ProductController total ->"+total);
		System.out.println("currentPage - >"+currentPage);
		
		Paging pg = new Paging(total,currentPage);
		product.setStart(pg.getStart());
		product.setEnd(pg.getEnd());
		List<Product> soldList = ps.soldList(product);
		System.out.println("ProductController soldList.size()-> "+soldList.size());
		model.addAttribute("soldList",soldList);
		model.addAttribute("pg",pg);
		model.addAttribute("total",total);
		return "/mypage/soldList";
	}
	
	
	/**
     * 관리자페이지 - 전체 상품관리 상품이름 검색
     * 작성자: 조소현
     */
 	@GetMapping(value="searchProductName")
 	public String searchProductName(@RequestParam String keyword, String currentPage, Model model) {
 		System.out.println("ProductController searchProductName Start");
 		List<Product> allproductListAll = ps.searchProductName(keyword);
 		model.addAttribute("allproductListAll", allproductListAll);
 		return "admin/allProductList";
 	}
	
}
