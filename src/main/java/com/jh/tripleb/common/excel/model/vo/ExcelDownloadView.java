package com.jh.tripleb.common.excel.model.vo;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;


//org.apache.poi.xssf.usermodel.XSSFWorkbook

public class ExcelDownloadView extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String sCurTime = null; 
		sCurTime = new SimpleDateFormat("yyyyMMdd").format(new Date()); 
		String excelName = sCurTime + "_test.xlsx"; 
		Sheet worksheet = null; 
		Row row = null; 
		CellStyle style = workbook.createCellStyle(); 	// 셀 스타일을 위한 변수 
		
		//style.setAlignment(CellStyle.); 	// 글 위치를 중앙으로 설정 
		//HorizontalAlignment align = "center";
		//style.setAlignment();
		
		String target = model.get("target").toString();
		System.out.println(target);
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> listExcel  = (HashMap<String, String>) model.get("excelList");
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		
		// 새로운 sheet를 생성한다. 
		worksheet = workbook.createSheet("계약서 목록"); 
		
		// 가장 첫번째 줄에 제목을 만든다. 
		row = worksheet.createRow(0); 
		
		// 칼럼 길이 설정 
		int columnIndex = 0; 
		while (columnIndex < 7) { 
			if(columnIndex == 0) { 
				worksheet.setColumnWidth(columnIndex, 3000); 
			}else if (columnIndex == 1) { 
				worksheet.setColumnWidth(columnIndex, 4000);
			}else if (columnIndex == 2) { 
				worksheet.setColumnWidth(columnIndex, 6000); 
			}else if (columnIndex == 3) { 
				worksheet.setColumnWidth(columnIndex, 4000); 
			
			}else if (columnIndex == 4) { 
				worksheet.setColumnWidth(columnIndex, 7000); 
			}else if (columnIndex == 5) { 
				worksheet.setColumnWidth(columnIndex, 3000); 
			}else if (columnIndex == 6) { 
				worksheet.setColumnWidth(columnIndex, 3000); 
			} 
			
			columnIndex++; 
		}

		
		// 헤더 설정 
		row = worksheet.createRow(0); 
		row.createCell(0).setCellValue("계약서번호"); 
		row.createCell(1).setCellValue("계약서발급번호"); 
		row.createCell(2).setCellValue("서비스 항목"); 
		row.createCell(3).setCellValue("구매처"); 
		row.createCell(4).setCellValue("구매일"); 
		row.createCell(5).setCellValue("수해일"); 
		row.createCell(6).setCellValue("가격"); 
		int rowIndex = 1; 
		
		// 각 해당하는 셀에 값과 스타일을 넣음 
		String invoiceDate = sdFormat.format(listExcel.get("INVOICE_DATE"));
			
		row = worksheet.createRow(rowIndex); 
		row.createCell(0).setCellValue(String.valueOf(listExcel.get("INVOICE_TOTALPRICE")));
		row.createCell(1).setCellValue(invoiceDate);
		row.createCell(2).setCellValue(listExcel.get("INVOCIE_PEMAIL"));
		row.createCell(3).setCellValue(listExcel.get("INVOCIE_ITEMLIST"));
		row.createCell(4).setCellValue(listExcel.get("INVOCIE_PADDRESS"));
		row.createCell(5).setCellValue(listExcel.get("INVOCIE_PURL"));
		row.createCell(6).setCellValue(String.valueOf(listExcel.get("INVOICE_NUMBER")));
		
		rowIndex++; 
	
		
		// 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열) 
		//worksheet.addMergedRegion( new CellRangeAddress(excelList.size() + 1, excelList.size() + 1, 0, 6)); 
		
		// 병합 테스트를 위한 설정 
		//row = worksheet.createRow(excelList.size() + 1); 
		//row.createCell(0).setCellValue("셀 병합 테스트"); 
		//row.getCell(0).setCellStyle(style); 

		
		try { 
			response.setHeader("Content-Disposition", "attachement; filename=\"" + 
					java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\""); 		
		} catch (UnsupportedEncodingException e) { 
			e.printStackTrace();
		}		
	}


}
