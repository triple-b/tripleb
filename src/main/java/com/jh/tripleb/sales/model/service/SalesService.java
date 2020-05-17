package com.jh.tripleb.sales.model.service;

import java.util.ArrayList;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesProductDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.salesGoal.model.vo.SalesGoal;
import com.jh.tripleb.trainer.model.vo.Trainer;

public interface SalesService {
	
	/**
	 * 1. 상품 전체 조회용 서비스
	 * @author	장미경	
	 * @return	ArrayList : 조회된 상품 전체 리스트 객체
	 */	
	ArrayList<Product> selectListProduct();
	
	/**
	 * 2. 트레이너 전체 조회용 서비스
	 * @author	장미경	
	 * @return	ArrayList : 조회된 트레이너 전체 리스트 객체
	 */	
	ArrayList<Trainer> selectListTrainer();
	
	
	/**
	 * 3. 매출 리스트(검색)
	 * @author	장미경
	 * @param	s : 검색조건들이 담긴 객체	
	 * @return	ArrayList : 조회된 매출 전체 리스트 객체
	 */
	ArrayList<SalesDto> searchListSalesDto(SalesSearchDto s);
	
	/**
	 * 4. 월별 매출 리스트(통계용)
	 * @author	장미경
	 * @param	months : 조회대상 월
	 * @return	ArrayList : 조회된 매출 전체 리스트 객체
	 */
	ArrayList<SalesDto> selectMoth(String months);
	
	/**
	 * 5. 상품별 매출 리스트(통계용)
	 * @Author	장미경
	 * @return	ArrayList : 조회된 상품별 매출 리스트 객체
	 */
	ArrayList<SalesProductDto> salesListProduct();
	
	/**
	 * 6. 트레이너별 매출 리스트(통계용)
	 * @Author	장미경
	 * @return	ArrayList : 조회된 트레이너별 매출 리스트 객체
	 */
	ArrayList<SalesProductDto> salesListTrainer();
	
	/**
	 * 7. 월별 목표 매출 리스트(통계용)
	 * @Author	장미경
	 * @Param	month : 조회대상 월
	 * @return	ArrayList : 조회된 트레이너별 매출 리스트 객체
	 */
	SalesGoal selectGoal(int month);
	
	
}
