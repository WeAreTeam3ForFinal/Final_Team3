package com.kkini.controller;

import com.kkini.dto.MemaDTO;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkini.dto.MemaOpenDTO;
import com.kkini.mybatis.IMemaDAO;
import com.kkini.mybatis.IUserDAO;

@Controller
public class MemaController
{
	@Autowired
	private SqlSession sqlSession;

	
	//메메 개설폼페이지 매핑
	@RequestMapping(value = "/memaopenform.kkini", method = RequestMethod.GET) 
	public String memaOpenForm(ModelMap model,MemaOpenDTO dto, HttpSession session) // 기존에서 DTO, SESSION 추가
	{
		String result ="";
		
		try
		{
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			dto.setMmUserCode((String)session.getAttribute("userCode"));
			
			// 개설회원 점수 가져오기
			model.addAttribute("getScore",  dao.getScore(dto));
			
			model.addAttribute("genderResult",  dao.checkGender(dto));
			
			model.addAttribute("MalegenderList", dao.getMaleGenderlist());
			model.addAttribute("FemalegenderList", dao.getFemaleGenderlist());
			//model.addAttribute("genderList", dao.getGenderlist());
			model.addAttribute("ageGroupList", dao.getAgeGrouplist());
			model.addAttribute("foodCtgList", dao.getFoodCtglist());
		
			result="/WEB-INF/view/MmOpenForm.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
		return result;
		
	}
	
	//메뉴메이트 개설하기 매핑
	@RequestMapping(value = "/memaopen.kkini", method = RequestMethod.POST)
	public String memaOpen(MemaOpenDTO dto, HttpSession session)
	{
		String result = null;
		//String restCode;
		
		dto.setMmUserCode((String)session.getAttribute("userCode"));
		
		//System.out.println(dto.getMmUserCode());
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		// 입력받은 식당정보 중복확인 프로시저단에서 진행 MM_OPEN_PRC
		
		dao.open(dto);
		
		result = "redirect:mainPage.kkini";
		
		return result;
	}
	
	// 메뉴메이트 리스트 호출
	@RequestMapping(value = "/memaList.kkini", method = RequestMethod.GET)
	public String memaList(Model model, ServletRequest request, HttpSession session)
	{
		String result = "";
		
		String sortBy = request.getParameter("sortBy");
		
		// 로그인 상태일 경우
		if ( session.getAttribute("nickName") != null && session.getAttribute("userCode") != null )
		{
//			System.out.println(session.getAttribute("nickName"));
//			System.out.println(session.getAttribute("userCode"));
			
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			IMemaDAO dao2 = sqlSession.getMapper(IMemaDAO.class);
			
			// 로그인 회원 닉네임
			String nickName = (String) session.getAttribute("nickName");
			
			// 로그인 회원 유저코드
			String userCode = (String) session.getAttribute("userCode");
			
//			System.out.println(nickName);
//			System.out.println(userCode);
//			System.out.println(dao.userGenderAge(nickName).getUser_age());
//			System.out.println(dao.userGenderAge(nickName).getUser_gender());
			
			// 로그인 회원 성별
			String gender = dao.userGenderAge(nickName).getUser_gender();
			
			// 로그인 회원 나이
			String age = dao.userGenderAge(nickName).getUser_age();
			
			
			// 로그인 회원 관심지역 어레이리스트
			ArrayList<String> intregions = dao.userIntregions(userCode);
			
			ArrayList<MemaDTO> list = new ArrayList<MemaDTO>(); 
			
			if(sortBy == null)
				sortBy = "";
			
			for (String intregion : intregions)
			{
				ArrayList<MemaDTO> tmp = new ArrayList<MemaDTO>(); 
				
				tmp = dao2.memaListLogin(gender, intregion);
				list.addAll(tmp);
			}
			
			if(sortBy.equals("memaDate"))
				model.addAttribute("memaList", dao2.sortMemaListByDate());
			else if(sortBy.equals("memaClose"))
				model.addAttribute("memaList", dao2.sortMemaListByClose());
			else
				model.addAttribute("memaList", list);
		}
		else
		{
			if(sortBy == null)
				sortBy = "";
			
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			if(sortBy.equals("memaDate"))
				model.addAttribute("memaList", dao.sortMemaListByDate());
			else if(sortBy.equals("memaClose"))
				model.addAttribute("memaList", dao.sortMemaListByClose());
			else
				model.addAttribute("memaList", dao.memaList());
		}
		
		result = "/WEB-INF/view/MemaListAjax.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "searchMema.kkini", method = RequestMethod.GET)
	public String memaSearch(Model model, ServletRequest request)
	{
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		
		String result = "";
		
		String keyword = request.getParameter("memaKeyword");
		String age = request.getParameter("mm-age-boundary");
		String gender = request.getParameter("mm-gender-boundary");
		String food = request.getParameter("mm-food-category");
		String dateStart = request.getParameter("datetime-start").replaceAll("\\.", "-");
		String dateEnd = request.getParameter("datetime-end").replaceAll("\\.", "-");
		
		System.out.println(keyword);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(food);
		System.out.println(dateStart);
		System.out.println(dateEnd);
		
		model.addAttribute("memaSearchList", dao.searchMema(keyword, age, gender, food, dateStart, dateEnd));
		
		result = "/WEB-INF/view/MemaListAjax.jsp";
		
		return result;
	}
	
}
