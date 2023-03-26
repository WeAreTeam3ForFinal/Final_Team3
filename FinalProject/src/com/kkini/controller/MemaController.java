package com.kkini.controller;

import com.kkini.dto.MemaDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

import com.kkini.dto.MemaOpenDTO;
import com.kkini.dto.UserDTO;
import com.kkini.mybatis.IMemaDAO;
import com.kkini.mybatis.IUserDAO;
import com.util.AlertMsg;

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
		System.out.println(dto.getMmVisitDate());
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
			
			for (int k = 0; k < intregions.size()+1; k++)
			{
				// 삽입 우선순위에 쓰일 플래그 변수
				boolean flag = false;
				
				// 관심지역이 여러개 이므로 반복문 루프마다 각 관심지역을 담을 변수
				String intregion = "";
				
				// loop 변수가 intregions의 size값이 된다는 것은 회원이 등록한 관심지역수 +1 값이 된다는 뜻.
				// 즉 그 전 까지(관심지역이 있는 한은) intregion 변수에 관심지역을 대입.
				if(loop != intregions.size())
					intregion = intregions.get(loop);
				
				if (intregion.equals(""))
					break;
				
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
				System.out.println("====== "+(loop+1) +"회차 리스트 ====== ");
				for (MemaDTO memaDTO : list)
				{
					System.out.print(memaDTO.getRestName() + ", ");
				}
				System.out.println("\n====================================");
				loop++;
			}
			
			for (int i = 0; i < list.size()-1; i++)
			{
				System.out.println("list 사이즈 = " + list.size());
				System.out.println("제거대상 = " + list.get(i).getRestName());
				for (int j = i+1; j < list.size(); j++)
				{
					String openCode = list.get(i).getOpenCode();
					
					if(list.get(j).getOpenCode().equals(openCode))
						list.remove(j);
					
					if(list.get(list.size()-1).getOpenCode().equals(openCode) && list.size() != 1)
						list.remove(list.size()-1);
				}
				
				for (MemaDTO memaDTO : list)
				{
					System.out.println(memaDTO.getRestName());
				}
				System.out.println();
				System.out.println();
			}
			
			System.out.println("=========최종리스트=======");
			for (MemaDTO memaDTO : list)
			{
				System.out.println(memaDTO.getRestName());
			}
			
			if(sortBy.equals("memaDate"))
				model.addAttribute("memaList", dao2.sortMemaListByDate());
			else if(sortBy.equals("memaClose"))
				model.addAttribute("memaList", dao2.sortMemaListByClose());
			else
				model.addAttribute("memaList", list);
		}
		//비회원
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
		
		String result ="";
		
		try
		{
			
			if(session.getAttribute("userCode") != null)
			{
			
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			Map<String, String>roomInfo = new HashMap<String, String>();
			
			roomInfo = dao.mmjoinRoomInfo(openCode);
			
			result = "/WEB-INF/view/JoinRoom.jsp";
			
			}
			else// 로그인 세션이 만료되었을경우
			{
				result="redirect: mainPage.kkini";
			}
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		
		model.addAttribute("openCode", openCode);
		
//		System.out.println(openCode);
		
		// 내가 필요한 데이터
		// 1. 참가자 닉네임들
		// 2. 참가자 회원코드
		// 3. 참가자 지원코드
		// 4. 참가자
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		Map<String, String>roomInfo = new HashMap<String, String>();
		
		roomInfo = dao.mmjoinRoomInfo(openCode);
		
		ArrayList<MemaDTO> attendees = dao.mmAttendees(openCode);
		ArrayList<UserDTO> scores = new ArrayList<UserDTO>();
		
		model.addAttribute("attendees", attendees);
		
		
		for (MemaDTO memaDTO : attendees)
		{
			
			System.out.println("=================================");
			System.out.printf("회원코드 : %s%n닉네임 : %s%n지원코드 : %s%n레디일시 : %s%n등급 : %s%n", memaDTO.getUserCode(), memaDTO.getAttendee(), 
																				memaDTO.getApplyCode(), memaDTO.getReadyDate(), memaDTO.getGrade());
			System.out.println("=================================");
			
			scores.add(dao2.getScore(memaDTO.getUserCode()));
		}
		
		for (int i = 0; i < scores.size(); i++)
			scores.get(i).setUser_nickname(attendees.get(i).getAttendee());
		
		int nop = Integer.parseInt(attendees.get(0).getNop());
		
		model.addAttribute("roomInfo", roomInfo);
		model.addAttribute("nop", nop);
		String nickName = (String)session.getAttribute("nickName");
		int isReady = dao.mmReadyCheck(openCode, nickName);
		model.addAttribute("nickName", nickName);
		model.addAttribute("isReady", isReady);
		model.addAttribute("scores", scores);
		
		
		return result;
		
	}

	
	// 메메 강퇴하기
	@RequestMapping(value = "/kickout.kkini", method = RequestMethod.POST)
	public String kickOut(Model model, String userCode, String openCode)
	{
		String result = "";
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		System.out.println(userCode);
		
		dao.mmKickout(openCode, userCode);
		
		result = "redirect:mmjoinRoom.kkini?openCode="+openCode;
		
		return result;
	}
	
	
	@RequestMapping(value ="/mmRoomUpdateForm.kkini", method = RequestMethod.GET )
	public String UpdatemmForm(Model model, String openCode,MemaOpenDTO dto, HttpSession session)
	{
		String result = "";
		
		try
		{
			
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			
			Map<String, String>roomInfo = new HashMap<String, String>();
			
			roomInfo = dao.mmjoinRoomInfo(openCode);
			
			//System.out.println(roomInfo.values());
			
			model.addAttribute("roomInfo", roomInfo);
			
			dto.setMmUserCode((String)session.getAttribute("userCode"));
			
			// 개설회원 점수 가져오기
			model.addAttribute("getScore",  dao.getScore(dto));
			
			int gender = dao.checkGender(dto);
			
			System.out.println(gender);
			
			if(gender == 1 || gender == 3)
			{
				//System.out.println(dao.getMaleGenderlist());
				model.addAttribute("genderList", dao.getMaleGenderlist());
			}
			else
			{
				model.addAttribute("genderList", dao.getFemaleGenderlist());
				
			}
			model.addAttribute("ageGroupList", dao.getAgeGrouplist());
			model.addAttribute("foodCtgList", dao.getFoodCtglist());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		result = "/WEB-INF/view/mmRoomInfoUpdateForm.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value = "/memaUpdate.kkini", method = RequestMethod.POST)
	public String UpdatemmOpen(Model model, MemaOpenDTO dto,String openCode,HttpSession session, HttpServletResponse response)
	{
		String result = "";
		
		try
		{
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			dto.setOpenCode(openCode);
			System.out.println(dto.getMmNop());
			
			if(session.getAttribute("userCode") == null) //세션 만료시 
			{
				//AlertMsg.alert(response, "세션이 만료되었습니다. 다시 로그인해주세요");
				result="redirect: mainPage.kkini";
				
			}
			
			else if (dto.getMmNop()<dao.nopCurrentMM(openCode)) //현재인원보다 낮은 인원수로 수정하려고 할시
			{
				System.out.println("수정할인원 : "+dto.getMmNop() +"현재인원 : "+dao.nopCurrentMM(openCode));
			 //AlertMsg.alert(response, "현재인원보다 낮게 수정할 수는 없습니다.");	
			 result="redirect: mmRoomUpdateForm.kkini?openCode="+openCode;
			}
			
			else
			{
				
			
			
			//1. 식당 확인
			int count = dao.existRestCount(dto);
			
			//2. 식당 코드 가져오기 
			if(count == 1)
			{
				dto.setRestCode(dao.getRestCode(dto));
			}
			
			//3. 없는 식당이면 코드 생성 및 insert 후 식당코드 반환
			else
			{
				//맵형태로 데이터 주고받아 보기
//				HashMap<String, String> rest = new HashMap<String, String>();
//				rest.put("restCode", "");
//				rest.put("mmUserCode", dto.getMmUserCode());
//				rest.put("mmRestName", dto.getMmRestName());
//				rest.put("mmRestLocation", dto.getMmRestLocation());
//				//System.out.println(rest);
				dao.addRest(dto);
				//System.out.println(dto.getRestCode());
			}
			
			//4.가져온 식당코드를 통해 수정
			dao.updateOpenMM(dto);
			
			//5.수정완료시 전원 레디상태 해제
			dao.updatemmReady(dto.getOpenCode());
			
			result = "redirect:mmjoinRoom.kkini?openCode="+openCode;
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		
		return result;
	}
	
	@RequestMapping(value = "/mmOut.kkini", method = RequestMethod.POST)
	public String mmOut(String userCode, String openCode, Model model)
	{
		String result = "redirect: mainPage.kkini";
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		dao.mmOut(openCode, userCode);
		
		return result;
	}
	
	@RequestMapping(value = "//mmSetReady.kkini", method = RequestMethod.POST)
	public String mmSetReady(String userCode, String openCode, String set)
	{
		String result = "redirect:mmjoinRoom.kkini?openCode="+openCode;
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		
		if (set.equals("ready"))
			dao.mmReady(openCode, userCode);
		else
			dao.mmUnReady(openCode, userCode);
		
		return result;
	}
	
	
	@RequestMapping(value = "/deleteMM.kkini", method = RequestMethod.POST)
	public String MMDelete(Model model,String openCode,String checkType)
	{
		String result="";
		
		try
		{
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			
			Map<String, String> dataMap = new HashMap<String, String>();
			
			dataMap.put("openCode", openCode);
			dataMap.put("checkType", checkType);
			
			
			dao.deleteMM(dataMap);
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		result="redirect:mainPage.kkini";
		
		return result;
	}
	
	@RequestMapping(value="/mmRecordRoom.kkini",method = RequestMethod.GET)
	public String recordRoomInfo(Model model,String openCode, HttpSession session)
	{
		
		String result ="";
		
		
		
		try
		{
			
			if(session.getAttribute("userCode") != null)
			{
			
			IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
			
			Map<String, String>roomInfo = new HashMap<String, String>();
			
			roomInfo = dao.mmjoinRoomInfo(openCode);
			
			result = "/WEB-INF/view/RecordRoom.jsp";
			
			}
			else// 로그인 세션이 만료되었을경우
			{
				result="redirect: mainPage.kkini";
			}
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		
		
		model.addAttribute("openCode", openCode);
		
//		System.out.println(openCode);
		
		// 내가 필요한 데이터
		// 1. 참가자 닉네임들
		// 2. 참가자 회원코드
		// 3. 참가자 지원코드
		// 4. 참가자
		
		IMemaDAO dao = sqlSession.getMapper(IMemaDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		Map<String, String>roomInfo = new HashMap<String, String>();
		
		roomInfo = dao.mmjoinRoomInfo(openCode);
		
		ArrayList<MemaDTO> attendees = dao.mmAttendees(openCode);
		ArrayList<UserDTO> scores = new ArrayList<UserDTO>();
		
		model.addAttribute("attendees", attendees);
		
		
		for (MemaDTO memaDTO : attendees)
		{
			
	
			
			scores.add(dao2.getScore(memaDTO.getUserCode()));
		}
		
		for (int i = 0; i < scores.size(); i++)
			scores.get(i).setUser_nickname(attendees.get(i).getAttendee());
		
		int nop = Integer.parseInt(attendees.get(0).getNop());
		
		model.addAttribute("roomInfo", roomInfo);
		model.addAttribute("nop", nop);
		String nickName = (String)session.getAttribute("nickName");
		int isReady = dao.mmReadyCheck(openCode, nickName);
		model.addAttribute("nickName", nickName);
		model.addAttribute("isReady", isReady);
		model.addAttribute("scores", scores);
		
		
		return result;
		
	}
	
	
}
