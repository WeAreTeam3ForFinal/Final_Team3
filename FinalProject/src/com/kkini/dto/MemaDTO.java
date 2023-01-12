package com.kkini.dto;

import java.sql.Timestamp;

public class MemaDTO
{
	// 주요 속성 구성
	String mm_open_code, u_code;
	Timestamp ready_date;		// date 타입은 자바에서 시분초까지 받아오지 못하므로 timestamp 라는 타입으로 변수 선언
	
	// getter / setter
	public String getMm_open_code()
	{
		return mm_open_code;
	}
	public void setMm_open_code(String mm_open_code)
	{
		this.mm_open_code = mm_open_code;
	}
	public String getU_code()
	{
		return u_code;
	}
	public void setU_code(String u_code)
	{
		this.u_code = u_code;
	}
	public Timestamp getReady_date()
	{
		return ready_date;
	}
	public void setReady_date(Timestamp ready_date)
	{
		this.ready_date = ready_date;
	}

}
