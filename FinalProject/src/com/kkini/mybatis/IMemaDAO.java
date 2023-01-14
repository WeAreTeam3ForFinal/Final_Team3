package com.kkini.mybatis;

import java.util.List;
import java.util.Map;

import com.kkini.dto.MemaDTO;

public interface IMemaDAO
{
	

	public List<Map<String,String>>getGenderlist();
	
	public List<Map<String,String>>getAgeGrouplist();
	
	public List<Map<String,String>>getFoodCtglist();
	
	// 메뉴메이트 모임방 개설
	public int open(MemaDTO dto);
	
	
}
