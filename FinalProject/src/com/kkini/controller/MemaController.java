package com.kkini.controller;

import javax.servlet.ServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.dto.MemaOpenDTO;
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
			
		}
		return result;
		
	}
	
	//메뉴메이트 개설하기 매핑
	@RequestMapping(value = "/memaopen.kkini", method = RequestMethod.POST)
	public String memaOpen(MemaOpenDTO dto)
	{
		String result = null;
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		dao.open(dto);
		
		result = "redirect:MainPage.jsp";
		
		return result;
	}
	
	// 메뉴메이트 리스트 호출
	@RequestMapping(value = "/memaList.kkini", method = RequestMethod.GET)
	public String memaList(Model model, ServletRequest request)
	{
		System.out.println("확인1");
		String result = "";
		
		String sortBy = request.getParameter("sortBy");
		
		if(sortBy == null)
			sortBy = "";
		
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			System.out.println("확인2");
		
			if(sortBy.equals("memaDate"))
			{
				model.addAttribute("memaList", dao.sortMemaListByDate());
				System.out.println("확인3");
			}
			else if(sortBy.equals("memaClose"))
				model.addAttribute("memaList", dao.sortMemaListByClose());
			else
				model.addAttribute("memaList", dao.memaList());
			
			result = "/MemaListAjax.jsp";
		
		return result;
	}
	
	
	
	
}
