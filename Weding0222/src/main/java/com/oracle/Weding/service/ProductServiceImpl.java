package com.oracle.Weding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.Weding.dao.ProductDao;
import com.oracle.Weding.dto.Alarm;
import com.oracle.Weding.dto.Cat;
import com.oracle.Weding.dto.Dibs;
import com.oracle.Weding.dto.Orders;
import com.oracle.Weding.dto.Pname;
import com.oracle.Weding.dto.Product;

import lombok.extern.java.Log;

@Service
@Log
public class ProductServiceImpl implements ProductService {
	
	@Autowired private ProductDao pd;
	
	
	/**
	 * 펀딩 예정 목록 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int beforeFundListTotal() {
		int totCnt = pd.beforeFundListTotal();
		log.info("beforeFundListTotal totCnt -> " + totCnt);
		
		return totCnt;
	}
	
	
	/**
	 * 펀딩중, 펀딩종료 목록 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int fundingListTotal(Product product) {
		int totCnt = pd.fundingListTotal(product);
		log.info("fundingListTotal totCnt -> " + totCnt);
		
		return totCnt;
	}
	
	
	/**
	 * 펀딩 내역 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int payListTotal(Orders orders) {
		int totCnt = pd.payListTotal(orders);
		log.info("payListTotal totCnt -> " + totCnt);
		
		return totCnt;
	}

	
	/**
	 * 상품 목록 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> productList(Product product) {
		List<Product> productList = pd.productList(product);
		
		return productList;
	}

	
	/**
	 * 펀딩내역 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Orders> payList(Orders orders) {
		List<Orders> payList = pd.payList(orders);
		
		return payList;
	}

	
	/**
	 * 펀딩취소
	 * 작성자: 장동호
	 */
	@Override
	public int payDelete(Orders orders) {
		int result = pd.payDelete(orders);
		
		return result;
	}

	
	/**
	 * 메인 - 랜덤상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getRandomProduct() {
		List<Product> randomProduct = pd.getRandomProduct();
		
		return randomProduct;
	}

	
	/**
	 * 메인 - 인기상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getPopularProduct() {
		List<Product> popularProduct = pd.getPopularProduct();
		
		return popularProduct;
	}

	
	/**
	 * 메인 - 당일 오픈 상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getOpenProduct() {
		List<Product> openProduct = pd.getOpenProduct();
		
		return openProduct;
	}

	
	/**
	 * 메인 - 리뷰가 있는 상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getReviewProduct() {
		List<Product> reviewProduct = pd.getReviewProduct();
		
		return reviewProduct;
	}

	
	/**
	 * 상품 카테고리 이름 조회
	 * 작성자: 조소현
	 */
	@Override
	public List<Cat> arrayCategory() {
		System.out.println("ProductServiceImpl arrayCategory Start…");
		List<Cat> catList = pd.arrayCategory();
		
		return catList;
	}

	
	/**
	 * 주문(결제)
	 * 작성자: 장동호
	 */
	@Override
	public int orders(Orders orders) {
		int result = pd.orders(orders);
		
		return result;
	}

	
	/**
	 * 주문 - 현재달성금액 증가
	 * 작성자: 장동호
	 */
	@Override
	public int sumCurPrice(Orders orders) {
		int result = pd.sumCurPrice(orders);
		
		return result;
	}

	
	/**
	 * 주문 - 현재달성금액 감소
	 * 작성자: 장동호
	 */
	@Override
	public int subCurPrice(Orders orders) {
		int result = pd.subCurPrice(orders);
		
		return result;
	}
	
	
	/**
	 * 마이페이지 - 찜목록 조회
	 * 작성자: 김태근
	 */
	@Override
	public List<Product> dibsList(Product product) {
		List<Product> dibsList = null;
		System.out.println("ProductServiceImpl listProduct Start...");
		dibsList = pd.dibsList(product);
		System.out.println("ProductServiceImpl listProduct productList.size() ->" + dibsList.size());
		
		return dibsList;
	}
	
	
	/**
	 * 관리자 - 등록된 전체 상품 개수 조회
	 * 작성자: 김태근
	 */
	@Override
	public int total() {
		System.out.println("ProductServiceImpl total Start...");
		int totCnt = pd.total();
		System.out.println("ProductServiceImpl total totCnt -> " + totCnt);
		
		return totCnt;
	}
	
	
	/**
	 * 관리자 - 등록된 전체 상품 조회
	 * 작성자: 김태근
	 */
	@Override
	public List<Product> allproductListAll(Product product) {
		List<Product> allproductListAll = null;
		System.out.println("ProductServiceImpl allproductListAll Start...");
		allproductListAll = pd.allproductListAll(product);
		System.out.println("ProductServiceImpl allproductListAll allProductList.size() ->" + allproductListAll.size());
		
		return allproductListAll;
	}
	
	
	/**
	 * 관리자 - 해당 상품 정보 가져오기
	 * 작성자: 김태근
	 */
	@Override
	public Product allProductUpdateForm(Product product) {
		Product allProductUpdateForm = null;
		System.out.println("ProductServiceImpl allProductUpdateForm Start...");
		allProductUpdateForm = pd.allProductUpdateForm(product);
		System.out.println("ProductServiceImpl allProductUpdateForm.size() -> " + allProductUpdateForm);
		
		return allProductUpdateForm;
	}
	
	
	/**
	 * 관리자 - 상품 수정
	 * 작성자: 김태근
	 */
	@Override
	public int allProductUpdate(Product product) {
		int allProductUpdate = 0;
		System.out.println("ProductServiceImpl allProductUpdate Start...");
		allProductUpdate = pd.allProductUpdate(product);
		System.out.println("ProductServiceImpl allProductUpdate count -> " + allProductUpdate);
		
		return allProductUpdate;
	}
	
	
	/**
	 * 관리자 - 상품 삭제
	 * 작성자: 김태근
	 */
	@Override
	public int delete(String p_num) {
		int result = 0;
		System.out.println("ProductServiceImpl delete Start...");
		result = pd.delete(p_num);
		
		return result;
	}
	
	
	/**
	 * 상품 카테고리 이름 조회
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> listCat() {
		System.out.println("ProductServiceImpl listCat Start..");
		List<Product> catList = pd.catList();
		System.out.println("ProductServiceImpl listCat catList.size() : "+catList.size());
		
		return catList;
	}

	
	/**
	 * 판매자 - 상품 등록
	 * 작성자: 안혜정
	 */
	@Override
	public int insert(Product product) {
		System.out.println("ProductServiceImpl insert Start..");
		int result = pd.insert(product);
		System.out.println("ProductServiceImpl insert result : " + result);
		
		return result;
	}
	
	
	/**
	 * 상품 최신순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortNewProduct(Product product) {
		List<Product> sortNewProduct = null;
		System.out.println("ProductServiceImpl sortNewProduct Start..");
		sortNewProduct = pd.sortNewProduct(product);
		
		return sortNewProduct;
	}
	
	
	/**
	 * 상품 인기순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortPopularProduct(Product product) {
		List<Product> sortPopularProduct = null;
		System.out.println("ProductServiceImpl sortPopularProduct Start..");
		sortPopularProduct = pd.sortPopularProduct(product);
		
		return sortPopularProduct;
	}
	
	
	/**
	 * 상품 달성순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortGoalProduct(Product product) {
		List<Product> sortGoalProduct = null;
		System.out.println("ProductServiceImpl sortGoalProduct Start..");
		sortGoalProduct = pd.sortGoalProduct(product);
		
		return sortGoalProduct;
	}
	
	
	/**
	 * 상품상세보기
	 * 작성자: 조소현 
	 */
	@Override
	public Product productDetail(int p_num) {
		System.out.println("ProductServiceImpl productDetail Start...");
		Product product = pd.productDetail(p_num);
		
		return product;
	}
	
	
	/**
	 * 상품상세보기 추천상품
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> recommendProduct(int p_condition){ 
		System.out.println("ProductServiceImpl recommendProduct Start...");
		List<Product> productList = pd.recommendProduct(p_condition);
		
		return productList;
	}
	

	/**
	 * 상품 검색
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> getSearchList(Product product) {
		System.out.println("ProductServiceImpl getSearchList Start...");
//			System.out.println("ProductServiceImpl getSearchList product.getKeyword()->"+product.getKeyword());
		List<Product> searchList = pd.selectSearchList(product);
		
		return searchList;
	}

	
	/**
	 * 상품 찜하기
	 * 작성자: 조소현
	 */
	@Override
	public int pushDibs(Dibs dibs) {
		System.out.println("ProductServiceImpl pushDibs Start...");
		int dibsNum = 0;
		dibsNum = pd.pushDibs(dibs);
		
		return dibsNum;
	}

	
	/**
	 * 달성률 받아오기
	 * 작성자: 조소현
	 */
	@Override
	public int attainment(int p_num) {
		System.out.println("ProductServiceImpl attainment Start...");
		int attainment = pd.attainment(p_num);
		
		return attainment;
	}
	
	
	/**
	 * 로그인 후 상품 찜하기 했는지 확인
	 * 작성자: 조소현 
	 */
	@Override
	public int dibsProduct(Dibs dibs) {
		System.out.println("ProductServiceImpl dibsProduct Start...");
		int count = pd.dibsProduct(dibs);
		
		return count;
	}
	
	
	/**
	 * 찜하기 취소
	 * 작성자: 조소현
	 */
	@Override
	public int cancleDibs(Dibs dibs) {
		System.out.println("ProductServiceImpl cancleDibs Start...");
		int dibsNum = 0;
		dibsNum = pd.cancleDibs(dibs);
		
		return dibsNum;
	}

	
	/**
	 * 알림신청하기
	 * 작성자: 조소현 
	 */
	@Override
	public int plzAlarmInsert(Alarm alarm1) {
		System.out.println("ProductServiceImpl plzAlarmInsert Start...");
		int alarmNum = 0;
		alarmNum = pd.plzAlarmInsert(alarm1);
		
		return alarmNum;
	}

	
	/**
	 * 로그인 후 상품 알림신청했는지 확인
	 * 작성자: 조소현
	 */
	@Override
	public int alarmProduct(Alarm alarm) {
		System.out.println("ProductServiceImpl alarmProduct Start...");
		int alarmCount = pd.alarmProduct(alarm);
		
		return alarmCount;
	}

	
	/**
	 * 알림신청 취소
	 * 작성자: 조소현 
	 */
	@Override
	public int plzAlarmDelete(Alarm alarm) {
		System.out.println("ProductServiceImpl plzAlarmDelete Start...");
		int alarmNum = 0;
		alarmNum = pd.plzAlarmDelete(alarm);
		
		return alarmNum;
	}

	
	/**
	 * 알림신청한 이메일 가져오기
	 * 작성자: 조소현
	 */
	@Override
	public List<Alarm> getEmailList(String p_num) {
		System.out.println("ProductServiceImpl getEmailList Start...");
		List<Alarm> emailList = pd.getEmailList(p_num);
		
		return emailList;
	}

	
	/**
	 * 상품이름 다 가져오기
	 * 작성자: 조소현
	 */
	@Override
	public List<Pname> searchPName() {
		System.out.println("ProductServiceImpl searchPName Start...");
		
		return pd.searchPName();
	}
	

	/**
	 * 판매자 상품 목록
	 * 작성자: 송지훈
	 */
	@Override
	public List<Product> soldList(Product product) {
		List<Product> productSoldList = null;
		System.out.println("ProductServiceImpl soldList Start...");
		productSoldList = pd.soldList(product);
		
		return productSoldList;
	}


	/**
	 *  소비자의 상품 구매 내역 확인 (주문했던 상품은 주문 불가)
	 *  작성자: 장동호
	 */
	@Override
	public int orderCheck(Product orderProduct) {
		int orderCheck = pd.orderCheck(orderProduct);
		return orderCheck;
	}


	/**
	 * soldListTotal
	 */
	@Override
	public int soldListTotal(Product product) { 
		int totCnt = pd.soldListTotal(product); 
		log.info("soldListTotal totCnt -> " + totCnt); 
		 
		return totCnt; 
	} 
	
	
	/**
     * 관리자페이지 - 전체 상품관리 상품이름 검색
     * 작성자: 조소현
     */
	@Override
	public List<Product> searchProductName(String keyword) {
		System.out.println("ProductServiceImpl searchProductName Start");
		List<Product> allproductListAll = pd.searchProductName(keyword);
		return allproductListAll;
	}
	
}
