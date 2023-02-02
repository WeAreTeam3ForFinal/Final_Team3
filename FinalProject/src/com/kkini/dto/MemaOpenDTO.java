package com.kkini.dto;

public class MemaOpenDTO
{
    String mmUserCode,mmGenderCode,mmFoodCtgCode, mmRestLocation, mmRestName,
           mmAgeGroupCode,mmVisitDate, mmMenu, mmOpenKeyWord, attendScore, mannerScore, biasScore ; 
   
    int mmNop,mmMenuPrice;
   
	public String getMmUserCode()
	{
		return mmUserCode;
	}
	public void setMmUserCode(String mmUserCode)
	{
		this.mmUserCode = mmUserCode;
	}
	public String getMmGenderCode()
	{
		return mmGenderCode;
	}
	public void setMmGenderCode(String mmGenderCode)
	{
		this.mmGenderCode = mmGenderCode;
	}
	public String getMmFoodCtgCode()
	{
		return mmFoodCtgCode;
	}
	public void setMmFoodCtgCode(String mmFoodCtgCode)
	{
		this.mmFoodCtgCode = mmFoodCtgCode;
	}
	public String getMmRestName()
	{
		return mmRestName;
	}
	public void setMmRestName(String mmRestName)
	{
		this.mmRestName = mmRestName;
	}
	public String getMmVisitDate()
	{
		return mmVisitDate;
	}
	public void setMmVisitDate(String mmVisitDate)
	{
		this.mmVisitDate = mmVisitDate;
	}
	public String getMmMenu()
	{
		return mmMenu;
	}
	public void setMmMenu(String mmMenu)
	{
		this.mmMenu = mmMenu;
	}

	public int getMmMenuPrice()
	{
		return mmMenuPrice;
	}
	public void setMmMenuPrice(int mmMenuPrice)
	{
		this.mmMenuPrice = mmMenuPrice;
	}
	public String getMmOpenKeyWord()
	{
		return mmOpenKeyWord;
	}
	public void setMmOpenKeyWord(String mmOpenKeyWord)
	{
		this.mmOpenKeyWord = mmOpenKeyWord;
	}
	public int getMmNop()
	{
		return mmNop;
	}
	public void setMmNop(int mmNop)
	{
		this.mmNop = mmNop;
	}
	public String getMmAgeGroupCode()
	{
		return mmAgeGroupCode;
	}
	public void setMmAgeGroupCode(String mmAgeGroupCode)
	{
		this.mmAgeGroupCode = mmAgeGroupCode;
	}
	public String getMmRestLocation()
	{
		return mmRestLocation;
	}
	public void setMmRestLocation(String mmRestLocation)
	{
		this.mmRestLocation = mmRestLocation;
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
	
}
