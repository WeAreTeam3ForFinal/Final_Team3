package com.kkini.mybatis;

import java.util.List;
import java.util.Map;

import com.kkini.dto.MemaDTO;

public interface IMemaApplyDAO
{
	public List<Map<String,String>> getMemaApplyInfo(MemaDTO dto);
	
	public void memaApply(MemaDTO dto);
}
