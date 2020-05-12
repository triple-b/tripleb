package com.jh.tripleb.mcAllCheck.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mcAllCheck.model.dao.McAllCheckDao;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;

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
		
		//System.out.println(m.getMachineNoList());
		//System.out.println(m.getMachineChkContentList());
		
		//hashMap<String, String> hmap = new HashMap<>();
		
		//List<String> list = new ArrayList();
		
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
            System.out.println("값 : " + i );
        }
				
		String[] mContent = m.getMachineChkContentList().split(",");
		
		
				
		int result1 = macDao.insertMcAllCheck(sqlSession, m);
		if(result1 > 0) {
							
			ArrayList<mcAllCheck> list = macDao.selectList(sqlSession); // 여러개가 돌아옴
			//mcAllCheckDto 
			
			System.out.println(list);
		
			System.out.println("m. : " + list.get(0).getMachinAllChkNo());
			
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
	public mcAllCheck selectMcAllCheck(int macno) {
		
		return macDao.selectMcAllCheck(sqlSession, macno);
	}
}
