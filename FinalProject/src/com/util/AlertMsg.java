package com.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertMsg
{
	
	public static void alert(HttpServletResponse response,String errorMessage)
	{
		
		try
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			
			pw.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>");
			pw.println("<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery.min.js\"></script>");
			//pw.println("<script>alert('"+errorMessage+"');</script>");
			pw.println("<script>");
			pw.println("$(document).ready(function(){");
			pw.println("Swal.fire({");
			pw.println("icon: 'success',");
			pw.println("title: '"+errorMessage+"',");
			//pw.println("text: '회원가입 됬다고',");
			pw.println("}); });");
			
			pw.println("</script>");
			
			pw.flush();
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
