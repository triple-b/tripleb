package com.jh.tripleb.common.excel.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;

public interface ExcelService {
	
	//List<Object> getAllObjects(String target, int targetNo);
	
	Map<String, Object> getAllObjects(String target, int targetNo) throws Exception;
	
	List<Object> selectListPurchase(String target, int targetNo) throws Exception;

	List<Object> selectListSalesExcel(SalesSearchDto s) throws Exception;
	
}
