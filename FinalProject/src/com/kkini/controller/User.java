package com.kkini.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.coyote.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.UserDTO;
import com.kkini.mybatis.IUserDAO;



@Controller
public class User
{
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/mainPage.kkini", method = RequestMethod.GET)
	public String loadMain(ModelMap model, HttpSession session)
	{
		String result ="";
		
		try
		{
			
			if(session.getAttribute("nickName") != null && session.getAttribute("userCode") !=null )  //로그인 세션이 남아있을시
			{
				
				IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
				
				String user_code = (String)session.getAttribute("userCode");
				UserDTO dto = dao.getScore(user_code);
				
				model.addAttribute("attendScore", dto.getAttendScore());
				model.addAttribute("mannerScore", dto.getMannerScore());
				model.addAttribute("biasScore", dto.getBiasScore());
				
				
				
				//본인이 참가한 방이 있을경우 참가방 리스트를 뽑아온다.
				if(dao.checkJoinRoomList(user_code)!=0)
				{
				
				ArrayList<MemaDTO> roomList = dao.getJoinRoomList(user_code);
				
				model.addAttribute("roomList", roomList);
				}
				
				//
				if(dao.checkOpenRoomList(user_code)!=0)
				{
					ArrayList<MemaDTO> openroomList = dao.getOpenRoomList(user_code);
					model.addAttribute("openroomList", openroomList);
				}
				
				
				
			}
			
			result="/WEB-INF/view/MainPage.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		
		
		return result;
	}
	
	
	//아이디 중복검사
	@RequestMapping(value = "/idOverlapCk.kkini",method = RequestMethod.POST)
	public String idOverlapCheck(ModelMap model,String id)
	{
		String result="";
		
		try
		{
		  IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		  
		  
		  
		  model.addAttribute("result", dao.idOverlapCheck(id));
		  
		  
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		result="/WEB-INF/view/IdOverlapAjax.jsp";
		
		return result;
	}
	
	
	
	//닉네임 중복검사
	@RequestMapping(value = "/nickNameOverlapCk.kkini", method = RequestMethod.POST)
	public String nickNameOverlapCheck(ModelMap model, String nickname)
	{
		String result="";
		
		try
		{
			
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			
			
			
			model.addAttribute("result", dao.nickNameOverlapCheck(nickname));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		result="/WEB-INF/view/NicknameOverlapAjax.jsp";
		
		return result;
	}
	
	
	
	@RequestMapping(value = "/userRegiste.kkini",method = RequestMethod.GET)
	public String userRegisteForm(ModelMap model)
	{
		String result="";
		
		result="/WEB-INF/view/Register_form.jsp";
		
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
			
			
			result="/WEB-INF/view/Register_Alignment_form.jsp";
			
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
		     
		     
		     result="redirect:mainPage.kkini";
		     
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return result;
	}
	
	
	//로그인 시도 컨트롤러 세션 부여 필요
	@RequestMapping(value = "/login.kkini", method = RequestMethod.POST)
	public String login(ModelMap model, UserDTO dto,HttpSession session)
	{
			String result="";
		
		
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			
			
			dto = dao.loginMember(dto);
			//System.out.println(dto.getUser_code()); //유저코드 받아오기
			//System.out.println(dto.getUser_nickname());// 유저 닉네임 받아오기
			
			if(dto==null) //로그인 실패
			{
				result ="redirect:mainPage.kkini";
				
			}
			else //로그인 성공
			{
				
				session.setAttribute("nickName", dto.getUser_nickname());
				session.setAttribute("userCode", dto.getUser_code());
				
				
				
				result="redirect:mainPage.kkini";
			}
			
			
			
//			
//			if(dto.getUser_nickname()==null || dto.getUser_code()==null) //로그인 성공
//			{
//				result ="/mainPage.kkini";
//				
//			}
//			else //로그인 성공
//			{
//				
//				session.setAttribute("nickName", dto.getUser_nickname());
//				session.setAttribute("userCode", dto.getUser_code());
//				
//				
//				
//				result="redirect: mainPage.kkini";
//			}
//			
			
			
		
		
		
		
		return result;
		
	}
	
	
	@RequestMapping(value = "/logout.kkini", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session)
	{
		String result="";
		
		session.invalidate();
		
		result="/WEB-INF/view/MainPage.jsp";
		
		return result;
		
	}
	
	
	


}
