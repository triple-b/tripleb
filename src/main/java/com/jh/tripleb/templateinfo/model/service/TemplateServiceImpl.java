package com.jh.tripleb.templateinfo.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jh.tripleb.templateinfo.model.dao.TemplateDao;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfoDto;

@Service("mtService")
public class TemplateServiceImpl implements TemplateService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TemplateDao mtDao;
	
	@Override
	public ArrayList<TemplateInfo> selectParentList() {		
		return mtDao.selectParentList(sqlSession);
	}
	
	@Override
	public ArrayList<TemplateInfo> selectListTemplate() {
		return mtDao.selectListTemplate(sqlSession);
	}

	@Override
	public ArrayList<TemplateInfoDto> selectMenuList(String mlist) {
				
		ArrayList<TemplateInfoDto> dtolist = new ArrayList<TemplateInfoDto>();

		String[] arrayMenyList = mlist.split(",");
		for(int i=0; i<arrayMenyList.length; i++) {		

			// 하위메뉴 존재 여부 확인
			TemplateInfo t = mtDao.selectParent(sqlSession, Integer.parseInt(arrayMenyList[i]));		

			// 상위폴더인 경우에만 작업
			if(t.getTemplateParentItemNo() == 0) {

				// 하위폴더가 있는 경우
				if(t.getTemplateItemPrice() == 0) {
					ArrayList<TemplateInfo> tlist = mtDao.selectSubList(sqlSession, t.getTemplateItemNo());
					TemplateInfoDto tdto = new TemplateInfoDto();		
					tdto.setItemType("sub");
					tdto.setItemName(t.getTemplateItemName());
					tdto.setItemLink("");
					tdto.setItemIcon(t.getTemplateIcon());
					String[] childInfo = new String[tlist.size()];	
					for(int n=0; n<tlist.size(); n++) {							
						if (Arrays.asList(arrayMenyList).contains(Integer.toString(tlist.get(n).getTemplateItemNo()))) {
							childInfo[n] = tlist.get(n).getTemplateLinkpage() + "@" + tlist.get(n).getTemplateItemName();
						}						
					}
					
					tdto.setChildInfo(StringUtils.arrayToDelimitedString(childInfo, "^"));
					dtolist.add(tdto);
				}else {					
					TemplateInfoDto tdto = new TemplateInfoDto();
					// 하위폴더가 없는경우 값 저장
					tdto.setItemType("root");
					tdto.setItemName(t.getTemplateItemName());
					tdto.setItemLink(t.getTemplateLinkpage());
					tdto.setItemIcon(t.getTemplateIcon());
					tdto.setChildInfo("");						
					dtolist.add(tdto);
				}
			}
		}
			
		return dtolist;
	}

}
