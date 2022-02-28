package com.oracle.Weding.dao;

import java.util.List;

import com.oracle.Weding.dto.Alarm;
import com.oracle.Weding.dto.Cat;
import com.oracle.Weding.dto.Dibs;
import com.oracle.Weding.dto.Orders;
import com.oracle.Weding.dto.Pname;
import com.oracle.Weding.dto.Product;

public interface ProductDao {
	List<Product> 	productList(Product product);
	List<Orders> 	payList(Orders orders);
	int 			payDelete(Orders orders);
	List<Product> 	getRandomProduct();
	List<Product> 	getPopularProduct();
	List<Product>	getOpenProduct();
	List<Product> 	getReviewProduct();
	int 			beforeFundListTotal();
	int 			fundingListTotal(Product product);
	int 			payListTotal();
	List<Cat> 		arrayCategory();
	int 			orders(Orders orders);
	int 			sumCurPrice(Orders orders);
	int 			subCurPrice(Orders orders);
	List<Product> 	dibsList(Product product);
	int 			total();
	List<Product> 	allproductListAll(Product product);
	Product 		allProductUpdateForm(Product product);
	int 			delete(String p_num);
	int 			allProductUpdate(Product product);
	List<Product> 	catList();
	int 			insert(Product product);
	List<Product> 	sortNewProduct(Product product);
	List<Product> 	sortPopularProduct(Product product);
	List<Product> 	sortGoalProduct(Product product);
	
	Product 		productDetail(int p_num);
	List<Product> 	recommendProduct(int p_condition);
	List<Product> 	selectSearchList(Product product);
	int 			pushDibs(Dibs dibs);
	int 			attainment(int p_num);
	int 			dibsProduct(Dibs dibs);
	int 			cancleDibs(Dibs dibs);
	int 			plzAlarmInsert(Alarm alarm1);
	int 			alarmProduct(Alarm alarm);
	int 			plzAlarmDelete(Alarm alarm);
	List<Alarm> 	getEmailList(String p_num);
	List<Pname> 	searchPName();
	List<Product> 	soldList(Product product);
}
