package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.mybatis.IRegionDAO;

@Controller
public class Region
{
	
	
	@Autowired
	private SqlSession sqlSession;

@RequestMapping(value = "/addrList.kkini",method = RequestMethod.POST)
public String addrList(ModelMap model, String region_name)
{
	String result="";
	
	try
	{
		IRegionDAO dao = sqlSession.getMapper(IRegionDAO.class);
		
		model.addAttribute("regionList", dao.list(region_name));
		
		result = "/WEB-INF/view/AddrListAjax.jsp";
		
	} catch (Exception e)
	{
		
		System.out.println(e.toString());
		// TODO: handle exception
	}
	
	
	
	return result;
}



@RequestMapping(value = "/regionList.kkini",method = RequestMethod.POST)
public String regionList(ModelMap model, String region_name)
{
	String result="";
	
	try
	{
		IRegionDAO dao = sqlSession.getMapper(IRegionDAO.class);
		
		model.addAttribute("regionList", dao.list(region_name));
		result = "/WEB-INF/view/RegionListAjax.jsp";
		
	} catch (Exception e)
	{
		
		System.out.println(e.toString());
		// TODO: handle exception
	}
	
	
	
	return result;
}


@RequestMapping(value = "/regionCheck.kkini",method = RequestMethod.POST)
public String regionCheck(ModelMap model,String region_name)
{
	String result="";
	String check="";
	try
	{
		IRegionDAO dao = sqlSession.getMapper(IRegionDAO.class);
		
		
		if(dao.check(region_name)!=1)
		{
			check="유효하지 않은 지역입니다.";
		}
		
		model.addAttribute("check", check);
		
		result="/WEB-INF/view/RegionCheckAjax.jsp";
		
	} catch (Exception e)
	{
		System.out.println(e.toString());
		// TODO: handle exception
	}
	
	return result;
	
}
	




}
