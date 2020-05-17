package com.jh.tripleb.sales.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesProductDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.salesGoal.model.vo.SalesGoal;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Repository("msDao")
public class SalesDao {
	
	public ArrayList<Product> selectListProduct(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("salesMapper.selectListProduct");
	}
	
	public ArrayList<Trainer> selectListTrainer(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("salesMapper.selectListTrainer");
	}
	
	public ArrayList<SalesDto> searchListSalesDto(SqlSessionTemplate sqlSession, SalesSearchDto s) {
				
		return (ArrayList)sqlSession.selectList("salesMapper.searchListSalesDto", s);
	}
	
	public ArrayList<SalesDto> selectListSalesDto(SqlSessionTemplate sqlSession, String currentYear) {		
		return (ArrayList)sqlSession.selectList("salesMapper.selectListSalesDto", currentYear);
	}
	
	public ArrayList<SalesDto> selectListMonth(SqlSessionTemplate sqlSession, String months) {
		return (ArrayList)sqlSession.selectList("salesMapper.selectListMonth", months);		
	}
	
	public ArrayList<SalesProductDto> salesListProduct(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("salesMapper.salesListProduct");		
	}
	
	public ArrayList<SalesProductDto> salesListTrainer(SqlSessionTemplate sqlSession) {	
		return (ArrayList)sqlSession.selectList("salesMapper.salesListTrainer");		
	}
	
	public SalesGoal selectGoal(SqlSessionTemplate sqlSession, int month) {
		return (SalesGoal)sqlSession.selectOne("salesMapper.selectGoal", month);		
	}
	
}
