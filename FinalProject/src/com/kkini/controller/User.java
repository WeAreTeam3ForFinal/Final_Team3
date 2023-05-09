package com.kkini.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.coyote.Request;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.UserDTO;
import com.kkini.mybatis.IMemaDAO;
import com.kkini.mybatis.IUserDAO;
import com.util.AlertMsg;

@Controller
public class User
{

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/mainPage.kkini", method = RequestMethod.GET)
	public String loadMain(ModelMap model, HttpSession session, HttpServletResponse response)
	{
		String result = "";

		try
		{

			if (session.getAttribute("nickName") != null && session.getAttribute("userCode") != null) // 로그인 세션이 남아있을시
			{

				IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

				String user_code = (String) session.getAttribute("userCode");
				UserDTO dto = dao.getScore(user_code);

				model.addAttribute("attendScore", dto.getAttendScore());
				model.addAttribute("mannerScore", dto.getMannerScore());
				model.addAttribute("biasScore", dto.getBiasScore());

				session.setAttribute("attendScore", dto.getAttendScore());
				session.setAttribute("mannerScore", dto.getMannerScore());
				session.setAttribute("biasScore", dto.getBiasScore());

				// 본인이 참가한 방이 있을경우 참가방 리스트를 뽑아온다.
				if (dao.checkJoinRoomList(user_code) != 0)
				{
					ArrayList<MemaDTO> roomList = dao.getJoinRoomList(user_code);
					model.addAttribute("roomList", roomList);
					session.setAttribute("roomList", roomList);
				}
				else
				{
					ArrayList<MemaDTO> roomList = null;
					model.addAttribute("roomList", roomList);
					session.setAttribute("roomList", roomList);					
				}

				//
				if (dao.checkOpenRoomList(user_code) != 0)
				{
					ArrayList<MemaDTO> openroomList = dao.getOpenRoomList(user_code);
					model.addAttribute("openroomList", openroomList);
					session.setAttribute("openroomList", openroomList);
					System.out.println("생성목록 1이상");
					System.out.println(dao.checkOpenRoomList(user_code));
					System.out.println(user_code);
				}
				else
				{
					System.out.println("생성목록 0");
					ArrayList<MemaDTO> openroomList = null;
					model.addAttribute("openroomList", openroomList);
					session.setAttribute("openroomList", openroomList);
				}
			}

			// 메뉴메이트 검색창 필터 항목 속성값 넣기
			IMemaDAO dao2 = sqlSession.getMapper(IMemaDAO.class);

			model.addAttribute("age", dao2.memaSearchAge());
			model.addAttribute("gender", dao2.memaSearchGender());
			model.addAttribute("food", dao2.memaSearchFood());

			result = "/WEB-INF/view/MainPage.jsp";

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return result;
	}

	// 아이디 중복검사
	@RequestMapping(value = "/idOverlapCk.kkini", method = RequestMethod.POST)
	public String idOverlapCheck(ModelMap model, String id)
	{
		String result = "";

		try
		{
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

			model.addAttribute("result", dao.idOverlapCheck(id));

		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}

		result = "/WEB-INF/view/IdOverlapAjax.jsp";

		return result;
	}

	// 닉네임 중복검사
	@RequestMapping(value = "/nickNameOverlapCk.kkini", method = RequestMethod.POST)
	public String nickNameOverlapCheck(ModelMap model, String nickname)
	{
		String result = "";

		try
		{

			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

			model.addAttribute("result", dao.nickNameOverlapCheck(nickname));

		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}

		result = "/WEB-INF/view/NicknameOverlapAjax.jsp";

		return result;
	}

	@RequestMapping(value = "/userRegiste.kkini", method = RequestMethod.GET)
	public String userRegisteForm(ModelMap model)
	{
		String result = "";

		result = "/WEB-INF/view/Register_form.jsp";

		return result;
	}

	@RequestMapping(value = "/regist_Alignment.kkini", method = RequestMethod.POST)
	public String userChainsertForm(ModelMap model)
	{
		String result = "";

		try
		{

			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

			model.addAttribute("talkList", dao.getTalklist());
			model.addAttribute("chaList", dao.getChalist());
			model.addAttribute("intList", dao.getIntlist());
			model.addAttribute("speedList", dao.getSpeedlist());

			result = "/WEB-INF/view/Register_Alignment_form.jsp";

		} catch (Exception e)
		{
			System.out.println(e.toString());
			// TODO: handle exception
		}
		return result;

	}

	@RequestMapping(value = "/user_register.kkini", method = RequestMethod.POST)
	public String userRegiste(ModelMap model, UserDTO dto, HttpServletResponse response)
	{

		String result = "";
		// try
		// {

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		System.out.println(dto.getUser_addr());
		// 여기서 먼저 유저가 입력한 지역데이터가 테이블에 있는지 확인하고 있다면 210줄로 아니라면 새로이 지역 테이블에 데이터를 생성해주고
		// 210줄로 가야한다. 물론 관심지역도 전부 확인해야함
		dto.setRegion_name(dto.getUser_addr());
		dao.region_InOut(dto);
		System.out.println(dto.getRegion_code());
		dto.setUser_addr(dto.getRegion_code());

		// 유저 세부정보 테이블에 입력
		dao.userRegister(dto);

		System.out.println("sdf");
		dto.setUser_code(dto.getUser_code_live());

		// 회원코드 생성
		String user_code = dto.getUser_code();

		// 회원이 입력한 관심지역 데이터가 테이블이 존재하는지 아닌지

		// 유저 관심지역 테이블에 회원코드와 함께 회원이 입력한 관심지역 개수만큼 입력
		for (String user_region : dto.getUser_intregions())
		{
			System.out.println(user_region+"  "+user_code);
			dto.setRegion_name(user_region);
			dao.region_InOut(dto);
			dao.addintregion(user_region, user_code);
		}

		// 유저 관심사
		for (String user_interest : dto.getUser_interests())
		{
			System.out.println("\n" + user_interest);
			dao.addinterest(user_interest, user_code);
		}

		// 유저 성격 유형
		for (String user_character : dto.getUser_characters())
		{
			System.out.println("\n" + user_character);
			dao.addcharacter(user_character, user_code);
		}

		// AlertMsg.alert(response, "회원가입이 완료되었습니다.");

		result = "redirect:mainPage.kkini";

		// } catch (Exception e)
		// {
		// System.out.println(e.toString());
		// TODO: handle exception
		// }

		return result;
	}

	// 로그인 시도 컨트롤러 세션 부여 필요
	@RequestMapping(value = "/login.kkini", method = RequestMethod.POST)
	public String login(ModelMap model, UserDTO dto, HttpSession session)
	{
		String result = "";

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		dto = dao.loginMember(dto);
		// System.out.println(dto.getUser_code()); //유저코드 받아오기
		// System.out.println(dto.getUser_nickname());// 유저 닉네임 받아오기

		if (dto == null) // 로그인 실패
		{
			result = "redirect:mainPage.kkini";

		} else // 로그인 성공
		{

			session.setAttribute("nickName", dto.getUser_nickname());
			session.setAttribute("userCode", dto.getUser_code());

			result = "redirect:mainPage.kkini";
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
		String result = "";

		session.invalidate();

		result = "redirect:mainPage.kkini";

		return result;

	}

	@RequestMapping(value = "/MyRecord.kkini", method = RequestMethod.GET)
	public String myRecord(ModelMap model, HttpSession session)
	{
		String result = "";

		if (session.getAttribute("userCode") == null)
		{
			result = "redirect: logout.kkini";
			return result;
		}

		result = "/WEB-INF/view/MyRecord.jsp";

		return result;
	}

	@RequestMapping(value = "/myRecordList.kkini", method = RequestMethod.GET)
	public String myRecordList(ModelMap model, HttpSession session, String bar, String detail, String sortBy)
	{
		String result = "";

		List<Map<String, String>> recordList = null;

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		if (detail.equals("none") || detail == null)
		{
			if (sortBy.equals("none")) // 정렬기준이 없을시
			{
				recordList = dao.userRecord((String) session.getAttribute("userCode"));
			}

			else // 정렬기준이 있을시
			{
				if (sortBy.equals("recordDate")) // 정렬기준이 개설일 기준
				{

					recordList = dao.userRecordSortDate((String) session.getAttribute("userCode"));
				} else // 정렬기준이 마감일기준
				{
					recordList = dao.userRecordSortClose((String) session.getAttribute("userCode"));

				}

			}

		} else if (detail.equals("complete"))
		{

			if (sortBy.equals("none")) // 정렬기준이 없을시
			{
				recordList = dao.userRecord_complete((String) session.getAttribute("userCode"));
			}

			else // 정렬기준이 있을시
			{
				if (sortBy.equals("recordDate")) // 정렬기준이 개설일 기준
				{

					recordList = dao.userRecord_completeSortDate((String) session.getAttribute("userCode"));
				} else // 정렬기준이 마감일기준
				{
					recordList = dao.userRecord_completeSortClose((String) session.getAttribute("userCode"));

				}

			}

		} else if (detail.equals("join"))
		{

			if (sortBy.equals("none")) // 정렬기준이 없을시
			{
				recordList = dao.userRecord_join((String) session.getAttribute("userCode"));
			}

			else // 정렬기준이 있을시
			{
				if (sortBy.equals("recordDate")) // 정렬기준이 개설일 기준
				{

					recordList = dao.userRecord_joinSortDate((String) session.getAttribute("userCode"));
				} else // 정렬기준이 마감일기준
				{
					recordList = dao.userRecord_joinSortClose((String) session.getAttribute("userCode"));

				}

			}

		} else if (detail.equals("opened"))
		{

			if (sortBy.equals("none")) // 정렬기준이 없을시
			{
				recordList = dao.userRecord_opened((String) session.getAttribute("userCode"));
			}

			else // 정렬기준이 있을시
			{
				if (sortBy.equals("recordDate")) // 정렬기준이 개설일 기준
				{

					recordList = dao.userRecord_openedSortDate((String) session.getAttribute("userCode"));
				} else // 정렬기준이 마감일기준
				{
					recordList = dao.userRecord_openedSortClose((String) session.getAttribute("userCode"));

				}

			}
		} else if (detail.equals("applying"))
		{
			recordList = dao.userRecord((String) session.getAttribute("userCode"));
			
			
		} else if (detail.equals("feedback"))
		{
			if(sortBy.equals("none"))
			{
			recordList = dao.userRecord_feedback((String) session.getAttribute("userCode"));
			}
			
			else
			{
				if(sortBy.equals("recordDate"))
				{
					recordList = dao.userRecord_feedbackSortDate((String) session.getAttribute("userCode"));
				}
				else
				{
					recordList = dao.userRecord_feedbackSortClose((String) session.getAttribute("userCode"));
				}
			}
			
			
		} else if (detail.equals("dropout"))
		{
			if(sortBy.equals("none"))
			{
				recordList = dao.userRecord_dropout((String) session.getAttribute("userCode"));				
			}
			else
			{
				recordList = dao.userRecord_dropout((String) session.getAttribute("userCode"));				
			}
			
		}

		else
			recordList = null;

		if (recordList.size() > 0)
		{
			model.addAttribute("recordList", recordList);
			// model.addAttribute("bar", bar);
			// model.addAttribute("detail", detail);
			result = "/WEB-INF/view/MyRecordListAjax.jsp";
		} else
		{
			model.addAttribute("str", "이력조회 결과가 없습니다.");
			result = "/WEB-INF/view/MyRecordListAjaxFail.jsp";
		}

		return result;
	}

	// 마이 페이지
	@RequestMapping(value = "/myPage.kkini", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model)
	{
		String result = "/WEB-INF/view/MyPage.jsp";

		String userCode = (String) session.getAttribute("userCode");

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		// 유저 정보
		UserDTO userInfo = dao.getUserInfo(userCode);

		// 유저 관심지역
		ArrayList<String> intregionsList = dao.userIntregions(userCode);
		String intregions = "";

		for (int i = 0; i < intregionsList.size(); i++)
		{
			if (i != intregionsList.size() - 1)
				intregions += intregionsList.get(i) + ", ";
			else
				intregions += intregionsList.get(i);
		}

		// 유저 관심사
		ArrayList<String> userIntList = dao.getUserInt(userCode);
		String userInt = "";

		for (int i = 0; i < userIntList.size(); i++)
		{
			if (i != userIntList.size() - 1)
				userInt += userIntList.get(i) + ", ";
			else
				userInt += userIntList.get(i);
		}

		// 유저 성격
		ArrayList<String> userChaList = dao.getUserCha(userCode);
		String userCha = "";

		for (int i = 0; i < userChaList.size(); i++)
		{
			if (i != userChaList.size() - 1)
				userCha += userChaList.get(i) + ", ";
			else
				userCha += userChaList.get(i);
		}

		// 유저 대화량
		String userTalk = dao.getUserTalk(userCode);
		// 유저 식사속도
		String userSpeed = dao.getUserSpeed(userCode);

		model.addAttribute("userInfo", userInfo);
		model.addAttribute("intregions", intregions);
		model.addAttribute("userInt", userInt);
		model.addAttribute("userCha", userCha);
		model.addAttribute("userTalk", userTalk);
		model.addAttribute("userSpeed", userSpeed);

		return result;
	}

	// 자기소개 수정
	@RequestMapping(value = "/updateIntroduce.kkini", method = RequestMethod.POST)
	public String updateIntroduce(HttpSession session, Model model, String introduce)
	{
		String result = "redirect: myPage.kkini";
		String userCode = (String) session.getAttribute("userCode");
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		dao.updateIntroduce(userCode, introduce);

		return result;
	}
	
	// 성향 수정 폼 
	@RequestMapping(value = "/updateBiasInfoForm.kkini", method = RequestMethod.GET) 
	public String updateBiasForm(String userCha, String userSpeed, String userTalk, String userInt, Model model) 
	{ 
		String result = "/WEB-INF/view/UpdateBiasForm.jsp"; 
		 
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class); 
		 
		model.addAttribute("talkList", dao.getTalklist()); 
		model.addAttribute("chaList", dao.getChalist()); 
		model.addAttribute("intList", dao.getIntlist()); 
		model.addAttribute("speedList", dao.getSpeedlist()); 
		 
		model.addAttribute("userCha", userCha); 
		model.addAttribute("userInt", userInt); 
		model.addAttribute("userSpeed", userSpeed); 
		model.addAttribute("userTalk", userTalk); 
		 
		return result; 
	} 
	 
	// 성향 수정
	@RequestMapping(value = "/updatebias.kkini", method = RequestMethod.POST) 
	public String updateBias(HttpSession session,String[]user_interests, String[]user_characters, String user_eatSpeed, String user_talk) 
	{ 
		String result = "redirect: myPage.kkini"; 
		String userCode = (String)session.getAttribute("userCode"); 
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class); 
		 
		dao.updateSpeedTalk(userCode, user_eatSpeed, user_talk); 
		dao.deleteCha(userCode); 
		dao.deleteInt(userCode); 
		 
		for (String user_character : user_characters) 
			dao.addcharacter(user_character, userCode); 
		 
		for (String user_interest : user_interests) 
			dao.addinterest(user_interest, userCode); 
		 
		return result; 
	} 

	// 회원 정보 수정 전 비밀번호 확인
	@RequestMapping(value = "/checkpw.kkini", method = RequestMethod.GET)
	public String checkPw(String nickName, String user_id, String user_phonenumber, String user_addr, String intregions,
			Model model)
	{
		String result = "WEB-INF/view/CheckPw.jsp";
		model.addAttribute("nickName", nickName);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_phonenumber", user_phonenumber);
		model.addAttribute("user_addr", user_addr);
		model.addAttribute("intregions", intregions);
		return result;
	}

	// 회원 정보 수정 폼 이동
	@RequestMapping(value = "/updateprivateinfoform.kkini", method = RequestMethod.GET)
	public String updatePrivateInfoForm(HttpSession session, Model model, String nickName, String user_phonenumber,
			String user_addr, String intregions, String user_id, String user_pw)
	{
		String result = "/WEB-INF/view/UpdateUserInfoForm.jsp";
		String userCode = (String) session.getAttribute("userCode");
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		if (dao.checkPw(userCode, user_pw) != 1)
			result = "redirect: myPage.kkini";

		String[] intregionsArr = intregions.split(", ");
		String number = user_phonenumber.replaceAll("-", "");
		
		for (String string : intregionsArr)
		{
			System.out.println(string);
		}

		model.addAttribute("nickName", nickName);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_phonenumber", number);
		model.addAttribute("user_addr", user_addr);
		model.addAttribute("intregions", intregionsArr);
		model.addAttribute("user_pw", user_pw);

		return result;
	}

	@RequestMapping(value = "/updateprivateinfo.kkini", method = RequestMethod.POST)
	public String updatePrivateInfo(HttpSession session, Model model, String nickName, String user_phonenumber,
			String user_addr, String[] user_intregions, String user_id, String user_pw)
	{
		String result = "redirect: myPage.kkini";
		String userCode = (String) session.getAttribute("userCode");
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		// 거주지를 위한 지역 유무 검증 프로세스 수행
		String region = user_addr;

		if (dao.countRegion(region) < 1)
			dao.createRegion(region);

		// 반복문을 통해서 관심지역 유무 검증 프로세스 수행
		for (int i = 0; i < user_intregions.length; i++)
		{
			region = user_intregions[i];

			if (dao.countRegion(region) < 1)
				dao.createRegion(region);
		}

		// 거주지 업데이트
		dao.updateAddr(userCode, user_addr);

		// 관심지역 업데이트
		dao.deleteIntregions(userCode);
		for (int i = 1; i < user_intregions.length; i++)
		{
			if (!user_intregions[i].equals(" "))
				dao.addintregion(user_intregions[i], userCode);
		}
		// 닉네임, 전화번호, 비밀번호 업데이트
		dao.updatePrivateInfo(userCode, nickName, user_phonenumber, user_pw);

		return result;
	}

	@RequestMapping(value = "/feedBack.kkini", method = RequestMethod.POST)
	public String feedBackSend(Model model, HttpSession session, ServletRequest request)
	{
		String result = "";

		if (session.getAttribute("userCode") == null)
		{
			result = "redirect: mainPage.kkini";
			return result;
		}

		// 회원이 체크한 출석자, 불참자 받아오기
		String[] absents = request.getParameterValues("absent");
		String[] attends = request.getParameterValues("attend");

		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		String openCode = request.getParameter("openCode");
		String applyCodeG = request.getParameter("applyCodeU");
		// System.out.println(openCode);

		// 나온사람이 없을수도 안나온사람이 없을수도 있음

		if (absents != null)
		{
			for (String applyCodeT : absents)
			{
				dao.send_feedBack(applyCodeG, applyCodeT, openCode);
				dao.send_Absent(applyCodeG, applyCodeT);
			}
		} else
		{
		}

		if (attends != null)
		{
			for (String applyCodeT : attends)
			{
				dao.send_feedBack(applyCodeG, applyCodeT, openCode);

			}
		} else
		{

		}
		result = "redirect:MyRecord.kkini";

		return result;
	}

}
