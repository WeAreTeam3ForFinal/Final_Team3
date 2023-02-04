package com.kkini.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.MemaOpenDTO;

public interface IMemaDAO
{
	//모집희망 성별 리스트  
	public List<Map<String,String>>getGenderlist();
	//모집희망 연령 리스트
	public List<Map<String,String>>getAgeGrouplist();
	//음식 종류 리스트
	public List<Map<String,String>>getFoodCtglist();
	
	/* 식당정보 중복 확인  프로시저단에서 진행 MM_OPEN_PRC
	 
	  // 동일 식당명 존재 유무 확인 
	  public int countRest(MemaOpenDTO dto);
	  
	  //존재하는 식당정보의 식당코드 가져오기 
	  public String getRestCode(MemaOpenDTO dto);
	 
	  //식당테이블 식당정보 추가 
	  public int addRest(MemaOpenDTO dto);
	 */

	 
	// 개설회원 점수 가져오기 
	public MemaOpenDTO getScore(MemaOpenDTO dto);
	
	// 회원 성별에 따른 모집 희망 성별 리스트 분기
	public Integer checkGender(MemaOpenDTO dto);
	
	// 여자 회원일 시
	public List<Map<String,String>>getFemaleGenderlist();
	
	// 남자 회원일 시
	public List<Map<String,String>>getMaleGenderlist();
	
	// 메뉴메이트 모임방 개설
	public Integer open(MemaOpenDTO dto);
	
	// 메뉴메이트 리스트 출력
	public ArrayList<MemaDTO> memaList();
	public ArrayList<MemaDTO> memaListLogin(@Param("gender") String gender, @Param("intregion") String intregion, @Param("genderOrder") String genderOrder);
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
