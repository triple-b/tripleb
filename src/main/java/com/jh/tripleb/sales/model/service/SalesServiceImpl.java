package com.jh.tripleb.sales.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.dao.SalesDao;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Service("msService")
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SalesDao msDao;
	
	@Override
	public ArrayList<Product> selectListProduct() {		
		return msDao.selectListProduct(sqlSession);
	}

	@Override
	public ArrayList<Trainer> selectListTrainer() {
		return msDao.selectListTrainer(sqlSession);
	}

	@Override
	public ArrayList<SalesDto> selectListSalesDto(SalesSearchDto s) {
		return msDao.selectListSalesDto(sqlSession, s);
	}

	@Override
	public ArrayList<SalesDto> searchListSalesDto(SalesSearchDto s) {
		return msDao.searchListSalesDto(sqlSession, s);
	}



}
