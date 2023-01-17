package com.kkini.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kkini.dto.MemaDTO;
import com.kkini.mybatis.IMemaApplyDAO;

@Controller
public class MemaApplyController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 모집정보 보여주기 */
	@RequestMapping(value = "/getMemaApplyInfo.kkini", method = RequestMethod.GET)
	public String getMemaApplyInfo(MemaDTO dto, ModelMap model)
	{
		
		String result = "";
		
		try
		{
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);
			
			List<Map<String,String>> d =  dao.getMemaApplyInfo(dto);
			model.addAttribute("dto", d);
			model.addAttribute("tagList", d.get(0).get("OPENKEYWORD").split(","));
			
			result = "/WEB-INF/view/Mm_Apply.jsp";
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	/* 지원하기 */
	@RequestMapping(value = "/memaApply.kkini", method = RequestMethod.POST)
	@ResponseBody
	public void memaApply(MemaDTO dto)
	{
		try
		{
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);
			
			
			dao.memaApply(dto);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		
	}
	

}
