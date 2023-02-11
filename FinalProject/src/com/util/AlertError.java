package com.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertError
{
	
	public static void alert(HttpServletResponse response,String errorMessage)
	{
		
		try
		{
			PrintWriter pw = response.getWriter();
			
			pw.println("<script>alert('"+errorMessage+"');</script>");
			pw.flush();
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
