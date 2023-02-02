package com.kkini.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.MemaOpenDTO;

public interface IMemaDAO
{
	
	public List<Map<String,String>>getGenderlist();
	
	public List<Map<String,String>>getAgeGrouplist();
	
	public List<Map<String,String>>getFoodCtglist();
	
	// 메뉴메이트 모임방 개설
	public Integer open(MemaOpenDTO dto);
	
	// 메뉴메이트 리스트 출력
	public ArrayList<MemaDTO> memaList();
	public ArrayList<MemaDTO> memaListLogin(@Param("gender") String gender, @Param("intregion") String intregion);
	public ArrayList<MemaDTO> sortMemaListByDate();
	public ArrayList<MemaDTO> sortMemaListByClose();
	
	// 메뉴메이트 검색 필터 항목
	public ArrayList<MemaDTO> memaSearchAge();
	public ArrayList<MemaDTO> memaSearchGender();
	public ArrayList<MemaDTO> memaSearchFood();
	
	// 메뉴메이트 검색
	public ArrayList<MemaDTO> searchMema(@Param("keyword") String keyword, @Param("age") String age, @Param("gender") String gender, 
										 @Param("food") String food, @Param("dateStart") String dateStart, @Param("dateEnd") String dateEnd);
	
	
	
}
