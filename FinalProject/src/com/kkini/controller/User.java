package com.kkini.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.dto.UserDTO;
import com.kkini.mybatis.IUserDAO;



@Controller
public class User
{
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping(value = "/regist_Alignment.kkini", method = RequestMethod.POST)
	public String userChainsertForm(ModelMap model)
	{
		String result ="";
		
		try
		{
			
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			
			
			model.addAttribute("talkList", dao.getTalklist());
			model.addAttribute("chaList", dao.getChalist());
			model.addAttribute("intList", dao.getIntlist());
			model.addAttribute("speedList", dao.getSpeedlist());
			
			
			result="/Register_Alignment_form.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		return result;
		
	}
	
	
	@RequestMapping(value = "/user_register.kkini", method = RequestMethod.POST)
	public String userRegiste(ModelMap model, UserDTO dto)
	{
		String result ="";
		
		try
		{
			
			
		    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			
		   dto.setUser_addr(dao.regionSearch(dto.getUser_addr()));
		    
		   	 //유저 세부정보 테이블에 입력
		     dao.userRegister(dto);
		     
		     
		     //유저 세부정보 테이블에 입력된 회원코드 가져오기
		     dto.setUser_code(dto.getUser_code_live());
		     
		     
		     //유저 관심지역 테이블에 회원코드와 함께 회원이 입력한 관심지역 개수만큼 입력
		     
		     
		     //유저 관심사
		     
		     //유저 성격 유형
		     
		     
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		
		return result;
	}



}
