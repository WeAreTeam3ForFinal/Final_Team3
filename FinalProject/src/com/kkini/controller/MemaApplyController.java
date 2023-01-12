package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.mybatis.IMemaApplyDAO;

@Controller
public class MemaApplyController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/memaApply.kkini", method = RequestMethod.GET)
	public String memaApply(Model model)
	{
		
		String result = "";
		
		try
		{
			
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);
			
			model.addAttribute("memaApply", dao.memaApply());
			
			result = "/MemaApply.jsp";
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}
}
