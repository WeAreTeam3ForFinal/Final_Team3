package com.kkini.mybatis;

import java.util.ArrayList;

import com.kkini.dto.RegionDTO;

public interface IRegionDAO
{
	
	public ArrayList<RegionDTO> list(String region_name);
	
	public int check(String region_name);
	
}
