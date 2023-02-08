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
			
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			IMemaDAO dao2 = sqlSession.getMapper(IMemaDAO.class);
			
			// 로그인 회원 닉네임
			String nickName = (String) session.getAttribute("nickName");
			
			// 로그인 회원 유저코드
			String userCode = (String) session.getAttribute("userCode");
			
			
			// 로그인 회원 성별
			String gender = dao.userGenderAge(nickName).getUser_gender();
			
			// 로그인 회원 나이
			String age = dao.userGenderAge(nickName).getUser_age();
			
			// 로그인 목록 성별 정렬용 문자열
			String genderOrder = "";
			
			if(gender.equals("여성"))
				genderOrder = "GENDER DESC";
			else
				genderOrder = "GENDER";
				
			System.out.println(genderOrder);
			
			// 로그인 회원 관심지역 어레이리스트
			ArrayList<String> intregions = dao.userIntregions(userCode);
			
			// 최종적으로 사용자에게 보여줄 모임방 리스트 어레이리스트
			ArrayList<MemaDTO> list = new ArrayList<MemaDTO>(); 
			
			if(sortBy == null)
				sortBy = "";
			
			
			int loop = 0;
			boolean flag = false;
			
			for (int k = 0; k < intregions.size()+1; k++)
			{
				// 관심지역이 여러개 이므로 반복문 루프마다 각 관심지역을 담을 변수
				String intregion = "";
				
				// loop 변수가 intregions의 size값이 된다는 것은 회원이 등록한 관심지역수 +1 값이 된다는 뜻.
				// 즉 그 전 까지(관심지역이 있는 한은) intregion 변수에 관심지역을 대입.
				if(loop != intregions.size())
					intregion = intregions.get(loop);
				
				// 임시로 테이블 값을 담을 tmp 어레이리스트 선언
				ArrayList<MemaDTO> tmp = new ArrayList<MemaDTO>(); 
				
				// tmp 변수에 모임방 리스트 대입 (성별, 관심지역, 성별정렬기준)
				tmp = dao2.memaListLogin(gender, intregion, genderOrder);
				
				for (int j = 0; j < tmp.size(); j++)
				{
					// tmp 변수 사이즈 동안 반복하면서 관심지역 및 성별 모두 일치한 모임방 우선 삽입
					if(tmp.get(j).getGenderMatch().equals("1") && tmp.get(j).getRegionMatch().equals("1"))
					{
						list.add(tmp.get(j));
						
						flag = true;
					}
					// 다음으로 성별이 일치한 모임방 우선적으로 삽입
					else if(tmp.get(j).getGenderMatch().equals("1") && tmp.get(j).getRegionMatch().equals("0") && flag == false)
						list.add(tmp.get(j));
					// 다음으로 지역이 일치한 모임방 우선적으로 삽입
					else if(tmp.get(j).getGenderMatch().equals("0") && tmp.get(j).getRegionMatch().equals("1") && flag == false)
						list.add(tmp.get(j));
					// 다음으로 일치사항 없는 (참가 불가능한) 모임방들 삽입
					else if (flag == false)
						list.add(tmp.get(j));
					
				}
				
				loop++;
			}
			
			for (int i = 0; i < list.size()-1; i++)
				for (int j = i+1; j < list.size(); j++)
				{
					String openCode = list.get(i).getOpenCode();
					
					if(list.get(j).getOpenCode().equals(openCode))
						list.remove(j);
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
	
	@RequestMapping(value="/mmjoinRoom.kkini",method = RequestMethod.GET)
	public String joinRoomInfo(Model model,String openCode, HttpSession session)
	{
		
		String result ="/WEB-INF/view/JoinRoom.jsp";
		
		model.addAttribute("openCode", openCode);
		
		return result;
		
	}
	
	
	
	
}
