package com.jh.tripleb.sales.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Repository("msDao")
public class SalesDao {
	
	public ArrayList<Product> selectListProduct(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("salesMapper.selectListProduct");
	}
	
	public ArrayList<Trainer> selectListTrainer(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("salesMapper.selectListTrainer");
	}
	
	public ArrayList<SalesDto> selectListSalesDto(SqlSessionTemplate sqlSession, SalesSearchDto s) {		
		return (ArrayList)sqlSession.selectList("salesMapper.selectListSalesDto", s);
	}
	
	public ArrayList<SalesDto> searchListSalesDto(SqlSessionTemplate sqlSession, SalesSearchDto s) {
				
		return (ArrayList)sqlSession.selectList("salesMapper.searchListSalesDto", s);
	}
	
}
