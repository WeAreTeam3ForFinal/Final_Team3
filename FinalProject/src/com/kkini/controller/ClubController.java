package com.kkini.controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.mybatis.IClubDAO;

@Controller
public class ClubController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/clubList.kkini", method = RequestMethod.GET)
	public String clubList(Model model, HttpServletRequest request)
	{
		
		String result = "";
		
		String sortBy = request.getParameter("sortBy");
		
		if(sortBy == null)
			sortBy = "";
		
		try
		{
			IClubDAO dao = sqlSession.getMapper(IClubDAO.class);
		
			if(sortBy.equals("date"))
				model.addAttribute("clubList", dao.sortClubListByDate());
			else if(sortBy.equals("memUp"))
				model.addAttribute("clubList", dao.sortClubListByMemUp());
			else if(sortBy.equals("memDown"))
				model.addAttribute("clubList", dao.sortClubListByMemDown());
			else
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
