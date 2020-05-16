package com.jh.tripleb.sales.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
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
	 * 3. 매출 전체 리스트(기본검색)
	 * @author	장미경	
	 * @return	ArrayList : 조회된 매출 전체 리스트 객체
	 */	
	ArrayList<SalesDto> selectListSalesDto(SalesSearchDto s);
	
	/**
	 * 4. 매출 검색 리스트
	 * @author	장미경
	 * @param	s : 검색조건들이 담긴 객체	
	 * @return	ArrayList : 조회된 매출 전체 리스트 객체
	 */
	ArrayList<SalesDto> searchListSalesDto(SalesSearchDto s);
	
}
