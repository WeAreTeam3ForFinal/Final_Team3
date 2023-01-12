package com.kkini.mybatis;

import java.util.ArrayList;

import com.kkini.dto.MemaDTO;

public interface IMemaDAO
{
	// 메뉴메이트 모임방 개설
	public int open(MemaDTO m);
	
	//메뉴메이트 모임방 리스트 조회
	public ArrayList<MemaDTO> memaList();
	
}
