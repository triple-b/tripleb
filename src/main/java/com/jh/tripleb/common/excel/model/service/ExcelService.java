package com.jh.tripleb.common.excel.model.service;

import java.util.List;
import java.util.Map;

public interface ExcelService {
	
	//List<Object> getAllObjects(String target, int targetNo);
	
	Map<String, Object> getAllObjects(String target, int targetNo) throws Exception;
	
	List<Object> selectListPurchase(String target, int targetNo) throws Exception;

	
	
}
