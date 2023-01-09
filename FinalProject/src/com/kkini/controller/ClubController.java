package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kkini.mybatis.IClubDAO;

@Controller
public class ClubController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/clubList.kkini", method = RequestMethod.GET)
	public String clubList(Model model)
	{
		
		String result = "";
		
		try
		{
			
			IClubDAO dao = sqlSession.getMapper(IClubDAO.class);
			
			model.addAttribute("clubList", dao.clubList());
			
			result = "/ClubListAjax.jsp";
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}
}
