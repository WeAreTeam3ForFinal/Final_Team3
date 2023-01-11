package com.kkini.mybatis;

import java.util.ArrayList;

import com.kkini.dto.ClubDTO;

public interface IClubDAO
{
	public ArrayList<ClubDTO> clubList();
	public ArrayList<ClubDTO> sortClubListByDate();
	public ArrayList<ClubDTO> sortClubListByMemUp();
	public ArrayList<ClubDTO> sortClubListByMemDown();
	
}
