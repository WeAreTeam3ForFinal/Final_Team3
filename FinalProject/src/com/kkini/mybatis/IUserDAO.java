package com.kkini.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	
	
}
