package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.dto.MemaDTO;
import com.kkini.mybatis.IMemaDAO;

@Controller
public class MemaController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	

	//메메 개설폼페이지 매핑
	@RequestMapping(value = "/memaopenform.kkini", method = RequestMethod.GET)
	public String memaOpenForm(ModelMap model)
	{
		String result ="";
		
		try
		{
			
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			
			model.addAttribute("genderList", dao.getGenderlist());
			model.addAttribute("ageGroupList", dao.getAgeGrouplist());
			model.addAttribute("foodCtgList", dao.getFoodCtglist());
		
			result="/MmOpenForm.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		return result;
		
	}
	
	//메뉴메이트 개설하기 매핑
	@RequestMapping(value = "/memaopen.kkini", method = RequestMethod.POST)
	public String memaOpen(MemaDTO dto)
	{
		String result = null;
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		dao.open(dto);
		
		result = "redirect:mainpage.kkini";
		
		return result;
	}
	
	
}
