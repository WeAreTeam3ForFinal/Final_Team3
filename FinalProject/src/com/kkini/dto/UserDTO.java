package com.kkini.dto;

public class UserDTO
{
	
	String user_id, user_pw, user_nickname, user_birth, user_gender, user_addr, user_phonenumber;
	String[] user_intregion, user_interest, user_character;
	String user_eatSpeed, user_talk, user_introduce;
	
	
	String user_code;
	String user_code_live;
	
	
	
	public String getUser_code_live()
	{
		return user_code_live;
	}
	public void setUser_code_live(String user_code_live)
	{
		this.user_code_live = user_code_live;
	}
	public String getUser_code()
	{
		return user_code;
	}
	public void setUser_code(String user_code)
	{
		this.user_code = user_code;
	}
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	public String getUser_pw()
	{
		return user_pw;
	}
	public void setUser_pw(String user_pw)
	{
		this.user_pw = user_pw;
	}
	public String getUser_nickname()
	{
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}
	public String getUser_birth()
	{
		return user_birth;
	}
	public void setUser_birth(String user_birth)
	{
		this.user_birth = user_birth;
	}
	public String getUser_gender()
	{
		return user_gender;
	}
	public void setUser_gender(String user_gender)
	{
		this.user_gender = user_gender;
	}
	public String getUser_addr()
	{
		return user_addr;
	}
	public void setUser_addr(String user_addr)
	{
		this.user_addr = user_addr;
	}
	public String getUser_phonenumber()
	{
		return user_phonenumber;
	}
	public void setUser_phonenumber(String user_phonenumber)
	{
		this.user_phonenumber = user_phonenumber;
	}
	public String[] getUser_intregion()
	{
		return user_intregion;
	}
	public void setUser_intregion(String[] user_intregion)
	{
		this.user_intregion = user_intregion;
	}
	public String[] getUser_interest()
	{
		return user_interest;
	}
	public void setUser_interest(String[] user_interest)
	{
		this.user_interest = user_interest;
	}
	public String[] getUser_character()
	{
		return user_character;
	}
	public void setUser_character(String[] user_character)
	{
		this.user_character = user_character;
	}
	public String getUser_eatSpeed()
	{
		return user_eatSpeed;
	}
	public void setUser_eatSpeed(String user_eatSpeed)
	{
		this.user_eatSpeed = user_eatSpeed;
	}
	public String getUser_talk()
	{
		return user_talk;
	}
	public void setUser_talk(String user_talk)
	{
		this.user_talk = user_talk;
	}
	public String getUser_introduce()
	{
		return user_introduce;
	}
	public void setUser_introduce(String user_introduce)
	{
		this.user_introduce = user_introduce;
	}
	
	
	
	
	
	
	/*
	 String user_id = request.getParameter("UserId");
String user_email = request.getParameter("email");
String emailDirect = request.getParameter("emailDirect");
String user_nickname = request.getParameter("UserNickName");
String user_pw = request.getParameter("UserPw");
String user_birth = request.getParameter("Birth");
String user_gender = request.getParameter("Gender");
String user_addr = request.getParameter("User_addr");
String user_phonenumber = request.getParameter("Phone_number");
String[] user_intregion = request.getParameterValues("User_IntRegion");

	 */

}