package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.dto.MemaDTO;
import com.kkini.mybatis.IMemaDAO;

@Controller
public class MemaController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//메뉴메이트 개설폼 매핑
	@RequestMapping(value = "/memaopenform.kkini", method = RequestMethod.GET)
	public String memaOpenForm()
	{
		String result = null;
		
		result = "/WEB-INF/MemaOpenForm.jsp";
		
		return result;
		
	}
	
	//메뉴메이트 개설하기 매핑
	@RequestMapping(value = "/memaopen.kkini", method = RequestMethod.POST)
	public String memaOpen(MemaDTO mema)
	{
		String result = null;
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		dao.open(mema);
		
		result = "redirect:mainpage.kkini";
		
		return result;
	}
	
	
}
