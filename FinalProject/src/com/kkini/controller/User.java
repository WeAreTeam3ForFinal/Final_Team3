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

	
	@RequestMapping(value = "/userRegiste.kkini",method = RequestMethod.GET)
	public String userRegisteForm(ModelMap model)
	{
		String result="";
		
		result="/Register_form.jsp";
		
		return result;
	}
	
	
	
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
		     
		     
		     //회원코드 생성
		     String user_code = dto.getUser_code();
		     
		     //유저 관심지역 테이블에 회원코드와 함께 회원이 입력한 관심지역 개수만큼 입력
		     for (String user_region : dto.getUser_intregions())
			{
		    	 //user_region = dao.intregionSearch(user_region);

		    	 dao.addintregion(user_region, user_code);
			}
		     
		     //유저 관심사
		     for(String user_interest : dto.getUser_interests())
		     {
		    	 System.out.println("\n"+user_interest);
		    	 dao.addinterest(user_interest, user_code);
		     }
		     
		     //유저 성격 유형
		     for(String user_character : dto.getUser_characters())
		     {
		    	 System.out.println("\n"+user_character);
		    	 dao.addcharacter(user_character, user_code);
		     }
		     
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		result="/loginForm.jsp";
		return result;
	}
	
	
	//로그인 페이지 요청
	@RequestMapping(value = "/loginForm.kkini" , method = RequestMethod.GET)
	public String loginForm(ModelMap model)
	{
		String result ="";
		
		
		return result;
	}
	
	
	//로그인 시도 컨트롤러 세션 부여 필요
	@RequestMapping(value = "/login.kkini", method = RequestMethod.POST)
	public String userLogin(ModelMap model, UserDTO dto)
	{
		String result="";
		
		
		return result;
		
	}



}
