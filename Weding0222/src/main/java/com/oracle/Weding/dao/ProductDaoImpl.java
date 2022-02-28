package com.oracle.Weding.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.Weding.dto.Alarm;
import com.oracle.Weding.dto.Cat;
import com.oracle.Weding.dto.Dibs;
import com.oracle.Weding.dto.Orders;
import com.oracle.Weding.dto.Pname;
import com.oracle.Weding.dto.Product;

import lombok.extern.java.Log;

@Repository
@Log
public class ProductDaoImpl implements ProductDao {
	
	@Autowired private SqlSession session;
	
	
	/**
	 * 펀딩 예정 목록 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int beforeFundListTotal() {
		int tot = 0;
		try {
			tot = session.selectOne("beforeFundListTotal"); 
			log.info("beforeFundListTotal tot -> " + tot);
		} catch (Exception e) {
			log.info("beforeFundListTotal Exception -> " + e.getMessage());
		}
		
		return tot;
	}
	
	
	/**
	 * 펀딩중, 펀딩종료 목록 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int fundingListTotal(Product product) {
		int tot = 0;
		try {
			tot = session.selectOne("fundingListTotal", product); 
			log.info("fundingListTotal tot -> " + tot);
		} catch (Exception e) {
			log.info("fundingListTotal Exception -> " + e.getMessage());
		}
		
		return tot;
	}
	
	
	/**
	 * 펀딩 내역 개수 조회
	 * 작성자: 장동호
	 */
	@Override
	public int payListTotal(Orders orders) {
		int tot = 0;
		try {
			tot = session.selectOne("payListTotal", orders); 
			log.info("payListTotal tot -> " + tot);
		} catch (Exception e) {
			log.info("payListTotal Exception -> " + e.getMessage());
		}
		
		return tot;
	}


	/**
	 * 상품 목록 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> productList(Product product) {
		List<Product> productMain = null;
		System.out.println("ProductDaoImpl mainProduct Start..."); 
		try { 
			productMain = session.selectList("productList", product); 
		}catch (Exception e) {
			System.out.println("ProductDaoImpl mainProduct Exception -> " + e.getMessage());
		} 
		
		return productMain; 
	}

	
	/**
	 * 펀딩내역 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Orders> payList(Orders orders) {
		log.info("payList()");
		List<Orders> payList = null;
		try { 
			payList = session.selectList("payListAll", orders); 
		}catch (Exception e) {
			log.info("payListDao: " + e.getMessage());
		} 
		
		return payList;
	}

	
	/**
	 * 펀딩취소
	 * 작성자: 장동호
	 */
	@Override
	public int payDelete(Orders orders) {
		int result = 0;
		try {
			result = session.delete("payDelete", orders);
		} catch (Exception e) {
			log.info("payDelete() : " + e.getMessage());
		}
		
		return result;
	}

	
	/**
	 * 메인 - 랜덤상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getRandomProduct() {
		List<Product> randomProduct = null;
		try {
			randomProduct = session.selectList("getRandomProduct");
		} catch (Exception e) {
			log.info("getRandomProduct : " + e.getMessage());
		}
		
		return randomProduct;
	}

	
	/**
	 * 메인 - 인기상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getPopularProduct() {
		List<Product> popularProduct = null;
		try {
			popularProduct = session.selectList("getPopularProduct");
		} catch (Exception e) {
			log.info("getPopularProduct : " + e.getMessage());
		}
		
		return popularProduct;
	}

	
	/**
	 * 메인 - 당일 오픈 상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getOpenProduct() {
		List<Product> openProduct = null;
		try {
			openProduct = session.selectList("getOpenProduct");
		} catch (Exception e) {
			log.info("getOpenProduct : " + e.getMessage());
		}
		
		return openProduct;
	}

	
	/**
	 * 메인 - 리뷰가 있는 상품 조회
	 * 작성자: 장동호
	 */
	@Override
	public List<Product> getReviewProduct() {
		List<Product> reviewProduct = null;
		try {
			reviewProduct = session.selectList("getReviewProduct");
		} catch (Exception e) {
			log.info("getReviewProduct : " + e.getMessage());
		}
		
		return reviewProduct;
	} 

	
	/**
	 * 상품 카테고리 이름 조회
	 * 작성자: 조소현
	 */
	@Override
	public List<Cat> arrayCategory() {
		System.out.println("ProductDaoImpl arrayCategory Start…");
		List<Cat> catList = null;
		try {
			catList = session.selectList("arrayCategoryList");
		}catch(Exception e) {
			System.out.println("ProductDaoImpl arrayCategory Exception -> " + e.getMessage());
		}
		
		return catList;
	}


	/**
	 * 주문(결제)
	 * 작성자: 장동호
	 */
	@Override
	public int orders(Orders orders) {
		int result = 0;
		
		try {
			result = session.insert("ordersInformation", orders);
		} catch (Exception e) {
			log.info("orders" + e.getMessage());
		}
		
		return result;
	}

	
	/**
	 * 주문 - 현재달성금액 증가
	 * 작성자: 장동호
	 */
	@Override
	public int sumCurPrice(Orders orders) {
		int result = 0;
		
		try {
			result = session.update("sumCurPrice", orders);
		} catch (Exception e) {
			log.info("sumCurPrice" + e.getMessage());
		}
		
		return result;
	}

	
	/**
	 * 주문 - 현재달성금액 감소
	 * 작성자: 장동호
	 */
	@Override
	public int subCurPrice(Orders orders) {
		int result = 0;
		
		try {
			result = session.update("subCurPrice", orders);
		} catch (Exception e) {
			log.info("subCurPrice" + e.getMessage());
		}
		
		return result;
	}
	
	
	/**
	 * 마이페이지 - 찜목록 조회
	 * 작성자: 김태근
	 */
	@Override
	public List<Product> dibsList(Product product) {
		System.out.println("ProductDaoImpl listProduct Start...");
		List<Product> dibsList = null;
		try {
			dibsList = session.selectList("dibsListAll", product);
			System.out.println("ProductDaoImpl listProduct productList.size() ->" + dibsList.size());
		}catch (Exception e) {
			System.out.println("ProductDaoImpl listProduct Exception -> " + e.getMessage());
		}
		
		return dibsList;
	}
	
	
	/**
	 * 관리자 - 등록된 전체 상품 개수 조회
	 * 작성자: 김태근
	 */
	@Override
	public int total() {
		int tot = 0;
		System.out.println("ProductDaoImpl total Start...");
		try {
			tot = session.selectOne("productTotal");
			System.out.println("ProductDaoImpl total tot -> " + tot);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl total Exception ->" + e.getMessage());
		}
		
		return tot;
	}
	
	
	/**
	 * 관리자 - 등록된 전체 상품 조회
	 * 작성자: 김태근
	 */
	@Override
	public List<Product> allproductListAll(Product product) {
		System.out.println("ProductDaoImpl allproductListAll Start...");
		List<Product> allproductListAll = null;
		try {
			allproductListAll = session.selectList("allProductListAll", product);
			System.out.println("ProductDaoImpl allproductListAll allProductList.size() ->" + allproductListAll.size());
		}catch (Exception e) {
			System.out.println("ProductDaoImpl allproductListAll Exception ->" + e.getMessage());
		}
		
		return allproductListAll;
	}
	
	
	/**
	 * 관리자 - 해당 상품 정보 가져오기
	 * 작성자: 김태근
	 */
	@Override
	public Product allProductUpdateForm(Product product) {
		Product allProductUpdateForm = null;
		try {
			allProductUpdateForm =session.selectOne("allProductUpdateForm", product);
			System.out.println("ProductDaoImpl allProductUpdateForm -> " + allProductUpdateForm);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl allProductUpdateForm Exception ->" + e.getMessage());
		}
		
		return allProductUpdateForm;
	}
	
	
	/**
	 * 관리자 - 상품 수정
	 * 작성자: 김태근
	 */
	@Override
	public int allProductUpdate(Product product) {
		int allProductUpdate = 0;
		try {
			allProductUpdate = session.update("allProductUpdate", product);
			System.out.println("ProductDaoImpl allProductUpdate count -> " + allProductUpdate);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl allProductUpdate Exception -> " + e.getMessage());
		}
		
		return allProductUpdate;
	}
	
	
	/**
	 * 관리자 - 상품 삭제
	 * 작성자: 김태근
	 */
	@Override
	public int delete(String p_num) {
		int rstSel1 = 0;
		int rstSel2 = 0;
		int rstSel3 = 0;
		int rstSel4 = 0;
		int rstDel1 = 0;
		int rstDel2 = 0;
		int rstDel3 = 0;
		int rstDel4 = 0;
		int rstDel5 = 0;
		System.out.println(p_num);
		try {
			// DIBS값이 null이 아니면 삭제
			rstSel1 = session.selectOne("tgSeleteDibs", p_num);
			if (rstSel1 > 0 ) rstDel1 = session.delete("tgDeleteDibs",p_num);
			// board값이 null이 아니면 삭제
			rstSel2 = session.selectOne("tgSeleteboard", p_num);
			if (rstSel2 > 0 ) rstDel2 = session.delete("tgDeleteboard",p_num);
			// alarm값이 null이 아니면 삭제
			rstSel3 = session.selectOne("tgSeleteAlarm", p_num);
			if (rstSel3 > 0 ) rstDel3 = session.delete("tgDeleteAlarm",p_num);
			// orders값이 null이 아니면 삭제
			rstSel4 = session.selectOne("tgSeleteOrders", p_num);
			if (rstSel4 > 0 ) rstDel4 = session.delete("tgDeleteOrders",p_num);
			// 위에 상품에 해당하는 게시글, 찜하기, 주문 삭제가 완료되면 product 삭제
			rstDel5 = session.delete("tgDeleteProduct", p_num);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl delete Exception -> " + e.getMessage());
		}
		
		return rstDel5;
	}
	
	
	/**
	 * 상품 카테고리 이름 조회
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> catList() {
		List<Product> catList = null;
		System.out.println("ProductDaoImpl listCat Start..");
		try {
			catList = session.selectList("productCatList");
		} catch (Exception e) {
			System.out.println("ProductDaoImpl listCat Exception : "+e.getMessage());
		}
		
		return catList;
	}

	
	/**
	 * 판매자 - 상품 등록
	 * 작성자: 안혜정
	 */
	@Override
	public int insert(Product product) {
		System.out.println("ProductDaoImpl insert Start..");
		int result = 0;
		try {
			result = session.insert("addProduct",product);			
		} catch (Exception e) {
			System.out.println("ProductDaoImpl insert Exception : "+e.getMessage());
		}
		
		return result;
	}

	
	/**
	 * 상품 최신순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortNewProduct(Product product) {
		List<Product> sortNewProduct = null;
		System.out.println("ProductDaoImpl sortNewProduct Start..");
		try {
			sortNewProduct = session.selectList("sortNewProduct",product);
		} catch (Exception e) {
			System.out.println("ProductDaoImpl sortNewProduct Exception : "+e.getMessage());
		}
		
		return sortNewProduct;
	}

	
	/**
	 * 상품 인기순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortPopularProduct(Product product) {
		List<Product> sortPopularProduct = null;
		System.out.println("ProductDaoImpl sortPopularProduct Start..");
		try {
			sortPopularProduct = session.selectList("sortPopularProduct",product);
		} catch (Exception e) {
			System.out.println("ProductDaoImpl sortPopularProduct Exception : "+e.getMessage());
		}
		
		return sortPopularProduct;
	}

	
	/**
	 * 상품 달성순 정렬
	 * 작성자: 안혜정
	 */
	@Override
	public List<Product> sortGoalProduct(Product product) {
		List<Product> sortGoalProduct = null;
		System.out.println("ProductDaoImpl sortGoalProduct Start..");
		try {
			sortGoalProduct = session.selectList("sortGoalProduct",product);
		} catch (Exception e) {
			System.out.println("ProductDaoImpl sortGoalProduct Exception : "+e.getMessage());
		}
		
		return sortGoalProduct;
	}
	
	
	/**
	 * 상품상세보기
	 * 작성자: 조소현 
	 */
	@Override
	public Product productDetail(int p_num) {
		System.out.println("ProductDaoImpl productDetail Start...");
		Product product = new Product();
		try {
			product = session.selectOne("productSelOne", p_num);
		}catch(Exception e) {
			System.out.println("EmpDaoImpl detail Exception->"+e.getMessage());
		}
		
		return product;
	}

	
	/**
	 * 상품상세보기 추천상품
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> recommendProduct(int p_condition) {
		System.out.println("ProductDaoImpl recommendProduct Start...");
		List<Product> productList = null;
		try {
			productList = session.selectList("recommendProductList", p_condition);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl recommendProduct Exception -> " + e.getMessage());
		}
		
		return productList;
	}

	
	/**
	 * 상품 검색
	 * 작성자: 조소현
	 */
	@Override
	public List<Product> selectSearchList(Product product) {
		System.out.println("ProductDaoImpl selectSearchList Start...");
		List<Product> productSearchList = null;
		try {
			productSearchList = session.selectList("productSearchList", product);
			System.out.println("ProductDaoImpl selectSearchList productSearchList.size()->"+productSearchList.size());
		}catch(Exception e) {
			System.out.println("ProductDaoImpl selectSearchList Exception -> " + e.getMessage());
		}
		
		return productSearchList;
	}

	
	/**
	 * 상품 찜하기
	 * 작성자: 조소현
	 */
	@Override
	public int pushDibs(Dibs dibs) {
		System.out.println("ProductDaoImpl pushDibs Start...");
		int dibsNum=0;
		try {
			dibsNum=session.insert("pushDibsProduct", dibs);
			System.out.println("ProductDaoImpl pushDibs dibsNum->"+dibsNum);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl pushDibs Exception -> " + e.getMessage());
		}
		
		return dibsNum;
	}

	
	/**
	 * 달성률 받아오기
	 * 작성자: 조소현
	 */
	@Override
	public int attainment(int p_num) {
		System.out.println("ProductDaoImpl attainment Start...");
		int attainment=0;
		try {
			attainment=session.selectOne("productAttainment", p_num);
			System.out.println("ProductDaoImpl attainment result->"+attainment);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl attainment Exception -> " + e.getMessage());
		}
		
		return attainment;
	}

	
	/**
	 * 로그인 후 상품 찜하기 했는지 확인하기
	 * 작성자: 조소현
	 */
	@Override
	public int dibsProduct(Dibs dibs) {
		System.out.println("ProductDaoImpl dibsProduct Start...");
		int count=0;
		try {
			count = session.selectOne("dibsProduct", dibs);
			System.out.println("ProductDaoImpl dibsProduct count->"+count);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl mainProduct Exception -> " + e.getMessage());
		} 
		
		return count;
	}

	
	/**
	 * 찜하기 취소
	 * 작성자: 조소현 
	 */
	@Override
	public int cancleDibs(Dibs dibs) {
		System.out.println("ProductDaoImpl cancleDibs Start...");
		int dibsNum=0;
		try {
			dibsNum=session.insert("cancleDibsProduct", dibs);
			System.out.println("ProductDaoImpl cancleDibs dibsNum->"+dibsNum);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl cancleDibs Exception -> " + e.getMessage());
		}
		
		return dibsNum;
	}

	
	/**
	 * 알림신청하기
	 * 작성자: 조소현 
	 */
	@Override
	public int plzAlarmInsert(Alarm alarm1) {
		System.out.println("ProductDaoImpl plzAlarmInsert Start...");
		int alarmNum = 0;
		try {
			alarmNum=session.insert("plzAlarmInsert", alarm1);
			System.out.println("ProductDaoImpl plzAlarmInsert alarmNum->"+alarmNum);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl plzAlarmInsert Exception -> " + e.getMessage());
		}
		
		return alarmNum;
	}

	
	/**
	 * 로그인 후 상품 알림신청했는지 확인
	 * 작성자: 조소현
	 */
	@Override
	public int alarmProduct(Alarm alarm) {
		System.out.println("ProductDaoImpl alarmProduct Start...");
		int alarmCount=0;
		try {
			alarmCount = session.selectOne("alarmProduct", alarm);
			System.out.println("ProductDaoImpl dibsProduct count->"+alarmCount);
		}catch (Exception e) {
			System.out.println("ProductDaoImpl alarmProduct Exception -> " + e.getMessage());
		} 
		
		return alarmCount;
	}

	
	/**
	 * 알림신청 취소
	 * 작성자: 조소현
	 */
	@Override
	public int plzAlarmDelete(Alarm alarm) {
		System.out.println("ProductDaoImpl plzAlarmDelete Start...");
		int alarmNum = 0;
		try {
			alarmNum=session.delete("plzAlarmDelete", alarm);
			System.out.println("ProductDaoImpl plzAlarmDelete alarmNum->"+alarmNum);
		}catch(Exception e) {
			System.out.println("ProductDaoImpl plzAlarmDelete Exception -> " + e.getMessage());
		}
		
		return alarmNum;
	}

	/**
	 * 알림신청한 이메일 받아오기
	 * 작성자: 조소현
	 */
	@Override
	public List<Alarm> getEmailList(String p_num) {
		System.out.println("ProductDaoImpl getEmailList Start...");
		List<Alarm> emailList = null;
		try {
			emailList = session.selectList("getEmailList", p_num);
			System.out.println("ProductDaoImpl getEmailList emailList.size()->"+emailList.size());
		}catch(Exception e) {
			System.out.println("ProductDaoImpl getEmailList Exception -> " + e.getMessage());
		}
		return emailList;
	}
	
	
	/**
	 * 상품이름 다 가져오기
	 * 작성자: 조소현
	 */
	@Override
	public List<Pname> searchPName() {
		System.out.println("ProductDaoImpl searchPName Start...");
		List<Pname> pNameTotal = null;
		try {
			pNameTotal = session.selectList("pNameTotal");
		}catch(Exception e) {
			System.out.println("ProductDaoImpl getEmailList Exception -> " + e.getMessage());
		}
		
		return pNameTotal;
	}
	
	
	/**
	 * 판매자 상품 목록
	 * 작성자: 송지훈
	 */
	@Override
	public List<Product> soldList(Product product) {
		List<Product> productSoldList = null;
		System.out.println("ProductDaoImpl soldList Start..... ");
		try {
			productSoldList = session.selectList("soldListAll",product);
		} catch (Exception e) {
			System.out.println("ProductDaoImpl soldList Exception "+e.getMessage());
		}
		
		return productSoldList;
	}


	/**
	 *  소비자의 상품 구매 내역 확인 (주문했던 상품은 주문 불가)
	 *  작성자: 장동호 
	 */
	@Override
	public int orderCheck(Product orderProduct) {
		int orderCheck = 0;
		try {
			orderCheck = session.selectOne("orderCheck", orderProduct);
		} catch(Exception e) {
			log.info("orderCheck Exception: " + e.getMessage());
		}
		
		return orderCheck;
	}


	/**
	 * soldListTotal
	 */
	@Override
	public int soldListTotal(Product product) {
		int tot = 0; 
		try { 
			tot = session.selectOne("soldTotal", product);  
			log.info("soldListTotal tot -> " + tot); 
		} catch (Exception e) { 
			log.info("soldListTotal Exception -> " + e.getMessage()); 
		} 
		 
		return tot;
	}
	
	
	/**
     * 관리자페이지 - 전체 상품관리 상품이름 검색
     * 작성자: 조소현
     */
	@Override
	public List<Product> searchProductName(String keyword) {
		System.out.println("ProductDaoImpl searchProductName Start");
		List<Product> allproductListAll = null;
		try {
			allproductListAll = session.selectList("searchProductName", keyword);
			System.out.println("검색된 상품개수는 "+allproductListAll.size());
		}catch(Exception e) {
			System.out.println("ProductDaoImpl allproductListAll Exception "+e.getMessage());
		}
		return allproductListAll;
	}
	
}
