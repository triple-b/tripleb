package com.jh.tripleb.common.excel.model.vo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.jh.tripleb.invoice.model.vo.Invoice;

public class ExcelDownloadInvoice  extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		HashMap<String, String> invoiceList = (HashMap<String, String>) model.get("invoiceList");
		@SuppressWarnings("unchecked")
		HashMap<String, String> companyList = (HashMap<String, String>) model.get("companyList");
		@SuppressWarnings("unchecked")
		List<HashMap<String, String>> itemList = (List<HashMap<String, String>>) model.get("itemList");
		String target = (String) model.get("target");		
				
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String invoiceDate = sdFormat.format(invoiceList.get("INVOICE_DATE"));	
		String dueDate = sdFormat.format(invoiceList.get("INVOICE_DUEDATE"));
		String excelName = "invoice_" + String.valueOf(invoiceList.get("INVOICE_NUMBER")) + ".xlsx"; 
		
		// 로고이미지 셋팅
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String openFilePath = resources + "\\images\\" + companyList.get("COMPANY_LOGO");	
		InputStream inputStream = new FileInputStream(openFilePath);		
		byte[] bytes = IOUtils.toByteArray(inputStream);
		int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
		inputStream.close();
			
		// 워크시트 기본값 셋팅
		Sheet worksheet = null; 
		Row row = null; 
		Cell cell = null;
		int rowCount = 0;
		int cellCount = 0;
		String valueAsString = "0";
		
		// INVOICE
		CellStyle styleOfInvoice = workbook.createCellStyle();	
		styleOfInvoice.setVerticalAlignment(VerticalAlignment.CENTER);
		Font styleOfInvoiceFont = workbook.createFont();
		//styleOfInvoiceFont.setFontName("맑은고딕"); //글씨체
		styleOfInvoiceFont.setFontHeight((short)(20*20)); //사이즈
		styleOfInvoiceFont.setBold(true);
		styleOfInvoice.setFont(styleOfInvoiceFont);
				
		// 회사정보
		CellStyle styleOfCompany = workbook.createCellStyle();	
		styleOfCompany.setAlignment(HorizontalAlignment.RIGHT);	
		styleOfCompany.setVerticalAlignment(VerticalAlignment.CENTER);		
		Font styleOfCompanyFont = workbook.createFont();
		//styleOfCompanyFont.setFontName("맑은고딕");
		styleOfCompanyFont.setFontHeight((short)(10*20)); 
		styleOfCompanyFont.setColor((short)IndexedColors.GREY_40_PERCENT.index);		
		styleOfCompany.setFont(styleOfCompanyFont);
		
		// 총금액타이틀
		CellStyle styleOfTotalTitle = workbook.createCellStyle();	
		styleOfTotalTitle.setAlignment(HorizontalAlignment.RIGHT);	
		styleOfTotalTitle.setVerticalAlignment(VerticalAlignment.BOTTOM);	
		styleOfTotalTitle.setBorderTop(BorderStyle.THIN);	
		Font styleOfTotalTitleFont = workbook.createFont();
		styleOfTotalTitleFont.setFontHeight((short)(14*20)); 
		styleOfTotalTitleFont.setBold(true);
		styleOfTotalTitle.setFont(styleOfTotalTitleFont);
		
		// 총금액정보
		CellStyle styleOfTotalPrice = workbook.createCellStyle();	
		styleOfTotalPrice.setAlignment(HorizontalAlignment.CENTER);	
		styleOfTotalPrice.setVerticalAlignment(VerticalAlignment.BOTTOM);	
		styleOfTotalPrice.setDataFormat((short)HSSFDataFormat.getBuiltinFormat("#,##0"));
		//String index = "#,##0";
		//styleOfTotalPrice.setDataFormat((short) "#,##0");
		styleOfTotalPrice.setBorderTop(BorderStyle.THIN);
		Font styleOfTotalPriceFont = workbook.createFont();
		styleOfTotalPriceFont.setFontHeight((short)(14*20)); 
		styleOfTotalPriceFont.setBold(true);		
		styleOfTotalPrice.setFont(styleOfTotalPriceFont);
		
		// 구매처 정보
		CellStyle styleOfCustomer = workbook.createCellStyle();	
		styleOfCustomer.setVerticalAlignment(VerticalAlignment.CENTER);		
		Font styleOfCustomerFont = workbook.createFont();
		//styleOfCompanyFont.setFontName("맑은고딕");
		styleOfCustomerFont.setFontHeight((short)(10*20)); 
		styleOfCustomerFont.setColor((short)IndexedColors.GREY_40_PERCENT.index);		
		styleOfCustomer.setFont(styleOfCustomerFont);	
		
		// InvoiceDate 정보
		CellStyle styleOfInvoiceDate = workbook.createCellStyle();	
		styleOfInvoiceDate.setAlignment(HorizontalAlignment.RIGHT);	
		styleOfInvoiceDate.setVerticalAlignment(VerticalAlignment.CENTER);		
		Font styleOfInvoiceDateFont = workbook.createFont();
		//styleOfCompanyFont.setFontName("맑은고딕");
		styleOfInvoiceDateFont.setFontHeight((short)(10*20)); 
		styleOfInvoiceDateFont.setColor((short)IndexedColors.GREY_40_PERCENT.index);		
		styleOfInvoiceDate.setFont(styleOfInvoiceDateFont);

		// 구매항목 타이틀
		CellStyle styleOfItemTitle = workbook.createCellStyle();	
		styleOfItemTitle.setAlignment(HorizontalAlignment.CENTER);	
		styleOfItemTitle.setVerticalAlignment(VerticalAlignment.CENTER);	
		styleOfItemTitle.setFillForegroundColor((short)IndexedColors.SKY_BLUE.index);
		styleOfItemTitle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		//styleOfItemTitle.setBorderRight(BorderStyle.THIN);
		//styleOfItemTitle.setBorderLeft(BorderStyle.THIN);
		styleOfItemTitle.setBorderTop(BorderStyle.THIN);
		styleOfItemTitle.setBorderBottom(BorderStyle.THIN);		
		Font styleOfItemTitleFont = workbook.createFont();
		styleOfItemTitleFont.setFontHeight((short)(11*20)); //사이즈
		styleOfItemTitleFont.setBold(true);
		styleOfItemTitle.setFont(styleOfItemTitleFont);
		
		// 구매항목1
		CellStyle styleOfItem1 = workbook.createCellStyle();	
		styleOfItem1.setAlignment(HorizontalAlignment.CENTER);	
		styleOfItem1.setVerticalAlignment(VerticalAlignment.CENTER);
		styleOfItem1.setBorderBottom(BorderStyle.THIN);		
		Font styleOfItem1Font = workbook.createFont();
		styleOfItem1Font.setFontHeight((short)(10*20)); //사이즈
		styleOfItem1.setFont(styleOfItem1Font);
		
		// 구매항목2
		CellStyle styleOfItem2 = workbook.createCellStyle();	
		styleOfItem2.setAlignment(HorizontalAlignment.CENTER);	
		styleOfItem2.setVerticalAlignment(VerticalAlignment.CENTER);
		styleOfItem2.setBorderBottom(BorderStyle.THIN);		
		Font styleOfItem2Font = workbook.createFont();
		styleOfItem2Font.setFontHeight((short)(10*20)); //사이즈
		styleOfItem2.setFont(styleOfItem2Font);
		
		// 구매항목3
		CellStyle styleOfItem3 = workbook.createCellStyle();	
		styleOfItem3.setAlignment(HorizontalAlignment.CENTER);	
		styleOfItem3.setVerticalAlignment(VerticalAlignment.CENTER);	
		styleOfItem3.setBorderBottom(BorderStyle.THIN);		
		Font styleOfItem3Font = workbook.createFont();
		styleOfItem3Font.setFontHeight((short)(10*20)); //사이즈
		styleOfItem3Font.setColor((short)IndexedColors.GREY_40_PERCENT.index);	
		styleOfItem3.setFont(styleOfItem3Font);
		
		// 구매항목4
		CellStyle styleOfItem4 = workbook.createCellStyle();				
		styleOfItem4.setVerticalAlignment(VerticalAlignment.CENTER);	
		styleOfItem4.setBorderBottom(BorderStyle.THIN);		
		Font styleOfItem4Font = workbook.createFont();
		styleOfItem4Font.setFontHeight((short)(10*20)); //사이즈
		styleOfItem4Font.setColor((short)IndexedColors.GREY_40_PERCENT.index);	
		styleOfItem4.setFont(styleOfItem4Font);
		
		// 구매항목5
		CellStyle styleOfItem5 = workbook.createCellStyle();	
		styleOfItem5.setAlignment(HorizontalAlignment.CENTER);	
		styleOfItem5.setVerticalAlignment(VerticalAlignment.CENTER);	
		styleOfItem5.setBorderBottom(BorderStyle.THIN);		
		styleOfItem5.setDataFormat((short)HSSFDataFormat.getBuiltinFormat("#,##0"));
		Font styleOfItem5Font = workbook.createFont();
		styleOfItem5Font.setFontHeight((short)(11*20)); 		
		styleOfItem5.setFont(styleOfItem5Font);		
		
		// 구매항목 마지막 라인에 줄 긋기
		CellStyle styleOfItemLine = workbook.createCellStyle();	
		styleOfItemLine.setBorderTop(BorderStyle.THIN);		
		
		// worksheet 생성
		worksheet = workbook.createSheet("INVOICE"); 
		
		// 눈금선 없애기
		worksheet.setDisplayGridlines(false);
		
		// 컬럼길이 설정
		// 칼럼 길이 설정 
		int columnIndex = 0; 
		while (columnIndex < 6) { 
			if(columnIndex == 0) { 
				worksheet.setColumnWidth(columnIndex, 800); 
			}else if(columnIndex == 1)	{
				worksheet.setColumnWidth(columnIndex, 3000); 
			}else if (columnIndex == 2) { 
				worksheet.setColumnWidth(columnIndex, 5000);
			}else if (columnIndex == 3) { 
				worksheet.setColumnWidth(columnIndex, 5000); 
			}else if (columnIndex == 4) { 
				worksheet.setColumnWidth(columnIndex, 11000); 			
			}else if (columnIndex == 5) { 
				worksheet.setColumnWidth(columnIndex, 6000); 		
			} 			
			columnIndex++; 
		}
		
		// 첫행 개행
		rowCount++;
		
		// 2~4행 셀병합
		row = worksheet.createRow(rowCount++);
		cellCount = 0; //셀 카운트 초기화
		 		
		//셀 병합 : 행시작, 행종료, 열시작, 열종료 (자바배열과 같이 0부터 시작)
		worksheet.addMergedRegion(new CellRangeAddress(1,2,1,3)); // INOVOICE	
		worksheet.addMergedRegion(new CellRangeAddress(1,4,5,5)); // 회사로고
		worksheet.addMergedRegion(new CellRangeAddress(3,3,1,3)); // INOVOICENUMBER	
		worksheet.addMergedRegion(new CellRangeAddress(4,4,1,3)); // 공백
				
		// 2행성성
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfInvoice);
		cell.setCellValue("INVOICE");		
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCompany);
		cell.setCellValue("TRIPLE B");
		cell.setCellValue(companyList.get("COMPANY_NAME"));
		cell = row.createCell(cellCount++);
	
		// 회사로그 삽입
		CreationHelper helper = workbook.getCreationHelper();
		@SuppressWarnings("unchecked")
		Drawing<XSSFPicture> drawing = (Drawing<XSSFPicture>) worksheet.createDrawingPatriarch();
		ClientAnchor anchor = helper.createClientAnchor();      	
      	anchor.setCol1(5);
        anchor.setCol2(5);
        anchor.setRow1(1);
        anchor.setRow2(4);          
        drawing.createPicture(anchor, pictureIdx);
        XSSFPicture pic = (XSSFPicture) drawing.createPicture(anchor, pictureIdx);
        pic.resize();  
		
		// 회사 주소
		row = worksheet.createRow(rowCount++);
		cellCount = 0; //셀 카운트 초기화
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCompany);
		cell.setCellValue(companyList.get("COMPANY_ADDRESS"));
		cell = row.createCell(cellCount++);
		
		// 회사 전화번호	
		row = worksheet.createRow(rowCount++);
		cellCount = 0; //셀 카운트 초기화
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellValue("#" + String.valueOf(invoiceList.get("INVOICE_NUMBER")));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCompany);
		cell.setCellValue(companyList.get("COMPANY_PHONE"));
		cell = row.createCell(cellCount++);
				
		// 회사 이메일	
		row = worksheet.createRow(rowCount++);
		cellCount = 0; //셀 카운트 초기화
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCompany);
		cell.setCellValue(companyList.get("COMPANY_EMAIL"));
		cell = row.createCell(cellCount++);
	
		// 개행
		rowCount++;
		rowCount++;
		
		// Invoice Date
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		worksheet.addMergedRegion(new CellRangeAddress(7,7,1,4)); // t0
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCustomer);
		cell.setCellValue("to :");
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfInvoiceDate);
		cell.setCellValue("Invoice Date : " + invoiceDate);		
			
		// 구매처 이름
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		worksheet.addMergedRegion(new CellRangeAddress(8,8,1,4)); // 회사명		
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCustomer);
		cell.setCellValue(invoiceList.get("INVOCIE_PNAME"));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfInvoiceDate);
		cell.setCellValue("Due Date : " + dueDate);		
		
		// 구매처 주소
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		worksheet.addMergedRegion(new CellRangeAddress(9,9,1,5)); // 구매처 주소	
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCustomer);
		cell.setCellValue(invoiceList.get("INVOCIE_PADDRESS"));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);

		// 구매처 전화번호	
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		worksheet.addMergedRegion(new CellRangeAddress(10,10,1,5)); 	
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCustomer);
		cell.setCellValue(invoiceList.get("INVOCIE_PPHONE"));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		
		// 구매처 이메일
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		worksheet.addMergedRegion(new CellRangeAddress(11,11,1,5));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfCustomer);
		cell.setCellValue(invoiceList.get("INVOCIE_PEMAIL"));
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		
		// 개행
		rowCount++;
		
		// 구매 항목 타이틀
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		short itemTitleHeight = 700;
		row.setHeight(itemTitleHeight);
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemTitle);	
		cell.setCellValue("#");
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemTitle);
		cell.setCellValue("Item");
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemTitle);
		cell.setCellValue("Category");
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemTitle);
		cell.setCellValue("Description");
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemTitle);
		cell.setCellValue("Price");
		
		// 구매항목 리스트 : 구매항목 갯수만큼 새로운 행 생성			
		short itemHeight = 500;
		for(int i=0; i<itemList.size(); i++) {		
			row = worksheet.createRow(rowCount++);
			cellCount = 0; 
			row.setHeight(itemHeight);
			cell = row.createCell(cellCount++);
			cell = row.createCell(cellCount++);
			cell.setCellStyle(styleOfItem1);
			cell.setCellValue(String.valueOf(itemList.get(i).get("TEMPLATE_ITEMNO")));
			cell = row.createCell(cellCount++);
			cell.setCellStyle(styleOfItem2);
			cell.setCellValue(itemList.get(i).get("TEMPLATE_ITEMNAME"));
			cell = row.createCell(cellCount++);
			cell.setCellStyle(styleOfItem3);
			cell.setCellValue(itemList.get(i).get("TEMPLATE_PARENTITEMNAME"));
			cell = row.createCell(cellCount++);
			cell.setCellStyle(styleOfItem4);
			cell.setCellValue(itemList.get(i).get("TEMPLATE_ITEMDESCRIPTION"));
			cell = row.createCell(cellCount++);
			cell.setCellStyle(styleOfItem5);
			valueAsString = String.valueOf(itemList.get(i).get("TEMPLATE_ITEMPRICE"));
			if(valueAsString == "null") {
				cell.setCellValue("0");
			}else {
				cell.setCellValue(new BigDecimal(valueAsString).doubleValue());
			}
		}
		
		// 개행
		rowCount++;
		
		// 라인처리를 위한 한줄 개행	
		/*
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemLine);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemLine);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemLine);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemLine);
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfItemLine);
		*/
		
		// 통합금액
		row = worksheet.createRow(rowCount++);
		cellCount = 0; 
		short priceHeight = 600;
		row.setHeight(priceHeight);
		worksheet.addMergedRegion(new CellRangeAddress(rowCount,rowCount,1,3)); 
		cell = row.createCell(cellCount++);	
		cell = row.createCell(cellCount++);	
		cell = row.createCell(cellCount++);		
		cell = row.createCell(cellCount++);
		cell = row.createCell(cellCount++);		
		cell.setCellStyle(styleOfTotalTitle);
		cell.setCellValue("Grand Total");
		cell = row.createCell(cellCount++);
		cell.setCellStyle(styleOfTotalPrice);
		valueAsString = String.valueOf(invoiceList.get("INVOICE_TOTALPRICE"));
		if(valueAsString == "null") {
			cell.setCellValue("0");
		}else {
			cell.setCellValue(new BigDecimal(valueAsString).doubleValue());
		}
		
		if(target.equals("invoicemail")) {
			// 계약서 생성 후 발송인 경우 서버에 저장 및 메일 발송처리
			String savePath = resources + "\\upload_files\\invoice\\";		
			
			// 실제로 저장될 파일 풀 경로
			File file = new File(savePath + excelName);
			
			// 엑셀 파일을 만듬
			FileOutputStream fileOutput = new FileOutputStream(file);

			workbook.write(fileOutput);
			fileOutput.close();
			
			// 메일발송  
			String emailParam = "?rcv=" + invoiceList.get("INVOCIE_PEMAIL") + "&fname=" + excelName;
			response.sendRedirect(request.getContextPath() + "/sendmail.mtp" + emailParam);
		}else {
			 // 계약서 열람 후 생성인 경우 사용자가 전달 받도록 처리(헤더정보에 파일명 설정)		
			try { 		
				response.setHeader("Content-Disposition", "attachement; filename=\"" + 
						java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\""); 		
			} catch (UnsupportedEncodingException e) { 
				e.printStackTrace();
			}					
		}
	}	

}
