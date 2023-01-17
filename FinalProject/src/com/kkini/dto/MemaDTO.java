package com.kkini.dto;

import java.sql.Timestamp;

public class MemaDTO
{
	// 주요 속성 구성
	Timestamp readyDate;		// date 타입은 자바에서 시분초까지 받아오지 못하므로 timestamp 라는 타입으로 변수 선언

	// 뷰 속성 구성 (속성 작명 통일 필요)
	String openCode, restName, region, foodctg, ageGroup, gender, visitDate, mainMenu, deadline, partyMemberCount, 
          nop, partyMaster, attendScore, mannerScore, biasScore, menuPrice, isClosed, openKeyword, userCode,roomStatus;
      
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

  	public String getRoomStatus()
	{
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus)
	{
		this.roomStatus = roomStatus;
    
	}
	
	public String getNop()
	{
		return nop;
	}

	public void setNop(String nop)
	{
		this.nop = nop;
	}

	public Timestamp getReadyDate()
	{
		return readyDate;
	}
	
	public void setReadyDate(Timestamp readyDate)
	{
		this.readyDate = readyDate;
	}
	
	public String getUserCode()
	{
		return userCode;
	}
	
	public void setUserCode(String userCode)
	{
		this.userCode = userCode;
	}

	public String getOpenCode()
	{
		return openCode;
	}

	public void setOpenCode(String openCode)
	{
		this.openCode = openCode;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getMenuPrice()
	{
		return menuPrice;
	}

	public void setMenuPrice(String menuPrice)
	{
		this.menuPrice = menuPrice;
	}

	public String getOpenKeyword()
	{
		return openKeyword;
	}

	public void setOpenKeyword(String openKeyword)
	{
		this.openKeyword = openKeyword;
	}

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

	public String getVisitDate()
	{
		return visitDate;
	}

	public void setVisitDate(String visitDate)
	{
		this.visitDate = visitDate;
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

	public String getIsClosed()
	{
		return isClosed;
	}

	public void setIsClosed(String isClosed)
	{
		this.isClosed = isClosed;
	} 
}