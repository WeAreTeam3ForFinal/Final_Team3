package com.kkini.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kkini.dto.MemaDTO;
import com.kkini.mybatis.IMemaApplyDAO;

@Controller
public class MemaApplyController
{
	@Autowired
	private SqlSession sqlSession;

	// 모집정보 보여주기
	@RequestMapping(value = "/getMemaApplyInfo.kkini", method = RequestMethod.GET)
	public String getMemaApplyInfo(MemaDTO dto, HttpSession session, ModelMap model)
	{
		String result = "";

		try
		{
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);

			String userCode = session.getAttribute("userCode") == null ? "" : (String) session.getAttribute("userCode");
			dto.setUserCode(userCode);
			List<Map<String, String>> d = dao.getMemaApplyInfo(dto);
			model.addAttribute("dto", d);
			
			if (d.get(0).get("OPENKEYWORD") != null) {
			model.addAttribute("tagList", d.get(0).get("OPENKEYWORD").split(","));
			}
			result = "/WEB-INF/view/Mm_Apply.jsp";
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return result;
	}

	// 지원하기
	@RequestMapping(value = "/memaApply.kkini", method = RequestMethod.POST)
	@ResponseBody
	public void memaApply(MemaDTO dto, HttpSession session)
	{
		try
		{
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);

			// session에 담긴 userCode를 dto에 담음
			dto.setUserCode((String) session.getAttribute("userCode"));

			// userCode와 openCode가 담긴 dto를 dao 로 넘김
			dao.memaApply(dto);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}

	// 중복 지원 불가 처리
	@RequestMapping(value = "/getMemaApplyCheck.kkini", method = RequestMethod.POST)
	@ResponseBody
	public String getMemaApplyCheck(MemaDTO dto, HttpSession session)
	{
		String result = "";
		
		try
		{
			IMemaApplyDAO dao = sqlSession.getMapper(IMemaApplyDAO.class);
			
			// session에 담긴 userCode를 dto에 담음
			dto.setUserCode((String) session.getAttribute("userCode"));

			// userCode와 openCode가 담긴 dto를 dao 로 넘김
			List<Map<String, String>> d = dao.getMemaApplyCheck(dto);
	         
			result = d.size() > 0 ? "no" : "yes";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}

		return result;
		
	}

}
