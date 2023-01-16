package com.kkini.dto;

import java.sql.Timestamp;

public class MemaDTO
{
	// 주요 속성 구성
	String mm_open_code, u_code;
	Timestamp ready_date;		// date 타입은 자바에서 시분초까지 받아오지 못하므로 timestamp 라는 타입으로 변수 선언
	
	// 뷰 속성 구성 (속성 작명 통일 필요)
	String restName, region, foodctg, ageGroup, mainMenu, deadline, partyMemberCount, 
					 partyMaster, attendScore, mannerScore, biasScore, mainMenuPrice, isClosed; 
	public String getRestName()
	{
		return restName;
	}
	public void setRestName(String restName)
	{
		this.restName = restName;
	}
	public String getRegion()
	{
		return region;
	}
	public void setRegion(String region)
	{
		this.region = region;
	}
	public String getFoodctg()
	{
		return foodctg;
	}
	public void setFoodctg(String foodctg)
	{
		this.foodctg = foodctg;
	}
	public String getAgeGroup()
	{
		return ageGroup;
	}
	public void setAgeGroup(String ageGroup)
	{
		this.ageGroup = ageGroup;
	}
	public String getMainMenu()
	{
		return mainMenu;
	}
	public void setMainMenu(String mainMenu)
	{
		this.mainMenu = mainMenu;
	}
	public String getDeadline()
	{
		return deadline;
	}
	public void setDeadline(String deadline)
	{
		this.deadline = deadline;
	}
	public String getPartyMemberCount()
	{
		return partyMemberCount;
	}
	public void setPartyMemberCount(String partyMemberCount)
	{
		this.partyMemberCount = partyMemberCount;
	}
	public String getPartyMaster()
	{
		return partyMaster;
	}
	public void setPartyMaster(String partyMaster)
	{
		this.partyMaster = partyMaster;
	}
	public String getAttendScore()
	{
		return attendScore;
	}
	public void setAttendScore(String attendScore)
	{
		this.attendScore = attendScore;
	}
	public String getMannerScore()
	{
		return mannerScore;
	}
	public void setMannerScore(String mannerScore)
	{
		this.mannerScore = mannerScore;
	}
	public String getBiasScore()
	{
		return biasScore;
	}
	public void setBiasScore(String biasScore)
	{
		this.biasScore = biasScore;
	}
	public String getMainMenuPrice()
	{
		return mainMenuPrice;
	}
	public void setMainMenuPrice(String mainMenuPrice)
	{
		this.mainMenuPrice = mainMenuPrice;
	}
	public String getIsClosed()
	{
		return isClosed;
	}
	public void setIsClosed(String isClosed)
	{
		this.isClosed = isClosed;
	}
	// getter / setter
	public String getMm_open_code()
	{
		return mm_open_code;
	}
	public void setMm_open_code(String mm_open_code)
	{
		this.mm_open_code = mm_open_code;
	}
	public String getU_code()
	{
		return u_code;
	}
	public void setU_code(String u_code)
	{
		this.u_code = u_code;
	}
	public Timestamp getReady_date()
	{
		return ready_date;
	}
	public void setReady_date(Timestamp ready_date)
	{
		this.ready_date = ready_date;
	}

}
