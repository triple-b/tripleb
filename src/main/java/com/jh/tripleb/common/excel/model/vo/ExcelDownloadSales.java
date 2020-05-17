package com.jh.tripleb.common.excel.model.vo;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.jh.tripleb.sales.model.vo.SalesDto;

public class ExcelDownloadSales extends AbstractXlsxView {


	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String sCurTime = null; 
		sCurTime = new SimpleDateFormat("yyyyMMdd").format(new Date()); 
		String excelName = "sales_" + sCurTime + ".xlsx"; 
		Sheet worksheet = null; 
		Row row = null; 
			
		@SuppressWarnings("unchecked")
		List<HashMap<String, String>> itemList = (List<HashMap<String, String>>) model.get("itemList");
				
		// 새로운 sheet를 생성한다. 
		worksheet = workbook.createSheet("SalesList"); 
		
		// 가장 첫번째 줄에 제목을 만든다. 
		row = worksheet.createRow(0); 
		
		// 칼럼 길이 설정 
		int columnIndex = 0; 
		while (columnIndex < 7) { 
			if(columnIndex == 0) { 
				worksheet.setColumnWidth(columnIndex, 4000); 
			}else if (columnIndex == 1) { 
				worksheet.setColumnWidth(columnIndex, 3000);
			}else if (columnIndex == 2) { 
				worksheet.setColumnWidth(columnIndex, 4000); 
			}else if (columnIndex == 3) { 
				worksheet.setColumnWidth(columnIndex, 3000); 			
			}else if (columnIndex == 4) { 
				worksheet.setColumnWidth(columnIndex, 3000); 
			}else if (columnIndex == 5) { 
				worksheet.setColumnWidth(columnIndex, 4000); 
			}else if (columnIndex == 6) { 
				worksheet.setColumnWidth(columnIndex, 4000); 
			} 
			
			columnIndex++; 
		}
		
		// 헤더 설정 
		row = worksheet.createRow(0); 
		row.createCell(0).setCellValue("구매일"); 
		row.createCell(1).setCellValue("타입"); 
		row.createCell(2).setCellValue("상품명"); 
		row.createCell(3).setCellValue("트레이너"); 
		row.createCell(4).setCellValue("구매자"); 
		row.createCell(5).setCellValue("판매금액"); 
		row.createCell(6).setCellValue("결제수단"); 
		int rowIndex = 1; 

		for(int i=0; i<itemList.size(); i++) {		
					
			String payDate = String.valueOf(itemList.get(i).get("PAY_DATE"));	
			payDate = payDate.substring(0, 10);
			String payType = "카드";
			if(itemList.get(i).get("PAY_TYPE").equals("Cash")) {
				payType = "현금";
			}						
			row = worksheet.createRow(rowIndex); 
			row.createCell(0).setCellValue(payDate);
			row.createCell(1).setCellValue(itemList.get(i).get("PRODUCT_CATEGORY"));
			row.createCell(2).setCellValue(itemList.get(i).get("PRODUCT_NAME"));
			row.createCell(3).setCellValue(itemList.get(i).get("TRAINER_NAME"));
			row.createCell(4).setCellValue(itemList.get(i).get("MEMBER_NAME"));
			row.createCell(5).setCellValue(String.valueOf(itemList.get(i).get("PAY_PRICE")));
			row.createCell(6).setCellValue(payType);
			rowIndex++; 
		}	
				
		try { 		
			response.setHeader("Content-Disposition", "attachement; filename=\"" + 
					java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\""); 		
		} catch (UnsupportedEncodingException e) { 
			e.printStackTrace();
		}	
		
	}
}
