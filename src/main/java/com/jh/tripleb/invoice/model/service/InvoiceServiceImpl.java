package com.jh.tripleb.invoice.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.invoice.model.dao.InvoiceDao;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;

@Service("iService")
public class InvoiceServiceImpl implements InvoiceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private InvoiceDao iDao;

	@Override
	public ArrayList<Invoice> selectListInvoice() {	
		return iDao.selectListInvoice(sqlSession);
	}

	@Override
	public Invoice selectInvocie(int ino) {
		return iDao.selectInvocie(sqlSession, ino);
	}

	@Override
	public InvoiceCompanyDto selectCompanyInfo(int cno) {	
		return iDao.selectCompanyInfo(sqlSession, cno);
	}

	@Override
	public ArrayList<InvoicePurchaseDto> selectListPurchase(int ino) {
		return iDao.selectListPurchase(sqlSession, ino);
	}

	@Override
	public int insertInvocie(Invoice i) {	
		
		// 구매항목 리스트 및 전체금액, 구매항목번호 리턴
		String[] itemList  = i.getInvoiceItemList().split(",");
		int totalPrice = 0;
					
		ArrayList<Integer> tlist =  new ArrayList<>();
		ArrayList<String> tname =  new ArrayList<>();
				
		// 선택된 항목 정보 가져와서 배열에 저장(구매정보 생성시 사용)
		for(int n=0; n<itemList.length; n++) {
			int tno = Integer.parseInt(itemList[n]);
			TemplateInfo t = iDao.selectTemplateInfo(sqlSession, tno);
			// 최상위인 경우 가격이 있으면 저장
			if(t.getTemplateParentItemNo() == 0) {
				if(t.getTemplateItemPrice() != 0) {
					tlist.add(t.getTemplateItemNo());	
					totalPrice += t.getTemplateItemPrice();
				}
				tname.add(t.getTemplateItemName());
			}else {
				tlist.add(t.getTemplateItemNo());
				totalPrice += t.getTemplateItemPrice();
			}			
		}
		
		
		//  계약서 번호 생성 : 2020050052				
		Date today = new Date();
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat fmt2 = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat fmt3 = new SimpleDateFormat("yyyy");
		String infoDate = fmt1.format(today);
		
		int cnt = iDao.selectInvoiceCount(sqlSession, fmt3.format(today)); 
		int nxtcnt = cnt + 1;
		
		String str1 = "0000" + Integer.toString(nxtcnt);	
		String str2 = str1.substring(str1.length()-4, str1.length());		
		String invoiceNumber = fmt2.format(today) + str2;
				
		i.setInvoiceNumber(invoiceNumber);
		i.setInvoiceItemList(tname.toString());
		i.setInvoiceTotalPrice(totalPrice);

		
		// 계약서 작성
		int result1 = iDao.insertInvocie(sqlSession, i);				
		
		if(result1 > 0) {
			
			// 생성된 계약서 번호 조회
			ArrayList<Invoice> nlist = iDao.selectListInvoice(sqlSession);
			int ino = nlist.get(0).getInvoiceNo();	
		
			// 구매정보 데이타 생성시 계약번호와 구매항목 정보 저장
			HashMap<String, Integer> paramNo = new HashMap<String, Integer>();
			paramNo.put("ino", ino);

			for(int n=0; n<tlist.size(); n++) {		
				paramNo.put("tno", tlist.get(n));			
				int result2 = iDao.insertPurchase(sqlSession, paramNo);
				if(result2 < 1) {
					return result2;
				}
			}		
			
			// 계약서 번호를 넘겨 줘서 엑셀다운로드 처리 함
			return ino;

		}else {
			return result1;
		}		
		
	}
	

}
