package com.kkini.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.UserDTO;

public interface IUserDAO
{
	
	public List<Map<String,String>>getChalist();
	
	public List<Map<String,String>>getTalklist();
	
	public List<Map<String,String>>getIntlist();
	
	public List<Map<String,String>>getSpeedlist();
	
	public void userRegister(UserDTO dto);
	
	public String regionSearch(String user_addr);
	
	public void addintregion(@Param("user_region")String user_region,@Param("user_code") String user_code);
	
	public void addinterest(@Param("user_interest") String user_interest, @Param("user_code") String user_code);
	
	public void addcharacter(@Param("user_character") String user_character, @Param("user_code") String user_code);
	
	public String intregionSearch(String user_region);
	
	public UserDTO loginMember(UserDTO dto); //로그인 성공시 회원 닉네임, 회원코드를 받아오는 함수
	
	public int idOverlapCheck(String id); //아이디 중복검사
	
	public int nickNameOverlapCheck(String nickname); //닉네임 중복 검사
	
	public UserDTO getScore(String user_code); // 메인 페이지 요청시 회원의 값 가져오기
	
	public int checkJoinRoomList(String user_code);  //참가중인 방이 있는지 확인하기 이거 안하면 리스트에 null떠서 에러남
	
	public int checkOpenRoomList(String user_code);   //본인이 개설한 방이 있는지 확인 이거 안하면 리스트에 null떠서 메인페이지 안들어가짐
	
	public ArrayList<MemaDTO> getJoinRoomList(String user_code);  //메인 페이지 요청시 본인이 참가중인 방 가져오기
	
	public ArrayList<MemaDTO> getOpenRoomList(String user_code); //메인 페이지 요청시 본인이 개설한 방 가져오기
	
	
}
