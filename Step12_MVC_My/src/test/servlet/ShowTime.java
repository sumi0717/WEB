package test.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showtime")
public class ShowTime extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1. 현재 시간 얻어오기, String now=new Date().toString();
		Date d=new Date();
		String date=d.toString();
		
		//2. request에 담기
		request.setAttribute("time", date);
		
		RequestDispatcher rd=
				request.getRequestDispatcher("/views/showtime.jsp");
		rd.forward(request, response);
	}
}
