package com.jh.tripleb.mcAllCheck.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mcAllCheck.model.dao.McAllCheckDao;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllDto;

@Service("macService")
public class McAllCheckServiceImpl implements McAllCheckService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private McAllCheckDao macDao;
	
	@Override
	public ArrayList<mcAllCheck> selectList() {
		
		return macDao.selectList(sqlSession);
	}
	
	@SuppressWarnings("unused")
	@Override
	public int insertMcAllCheck(mcAllCheckDto m) {

		ArrayList<Integer> arrayList = new ArrayList<>();

		//for(int i = 0; i<mStr.length; i++){
		//	mNo[i] = mStr[i];
		//}
		
		String[] mStr = m.getMachineNoList().split(",");
		//int[] mNo = new int[mStr.length];
		for(int i = 0; i<mStr.length; i++){
			arrayList.add(Integer.parseInt(mStr[i]));
		}
		
		for(int i : arrayList)   {
        }
				
		String[] mContent = m.getMachineChkContentList().split(",");

		int result1 = macDao.insertMcAllCheck(sqlSession, m);
		if(result1 > 0) {
							
			ArrayList<mcAllCheck> list = macDao.selectList(sqlSession); // 여러개가 돌아옴

			int macno = list.get(0).getMachinAllChkNo();  

			for(int i=0; i<arrayList.size(); i++) {				
				m.setMachineNo(arrayList.get(i));
				m.setMachineChkContent(mContent[i]);
				m.setMachineAllChkNo(macno);
				macDao.insertMcCheck(sqlSession, m);
			}			
			return result1;

		} else {
			return result1;
		}

	}
	
	@Override
	public ArrayList<mcAllDto> selectMcCheck(int macno) {
		
		return macDao.selectMcCheck(sqlSession, macno);
	}
}
