package com.kkini.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kkini.dto.UserDTO;

public interface IUserDAO
{
	
	public List<Map<String,String>>getChalist();
	
	public List<Map<String,String>>getTalklist();
	
	public List<Map<String,String>>getIntlist();
	
	public List<Map<String,String>>getSpeedlist();
	
	public void userRegister(UserDTO dto);
	
	public String regionSearch(String user_addr);
	
	public void addintregion(String user_region,String user_code);
	
	
}
