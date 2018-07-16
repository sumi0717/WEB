package test.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/showmember")
public class ShowMember extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1. 회원 정보를 얻어오는 로직 수행
		MemberDto showMem=new MemberDto(1, "구라쓰", "노량진");
		//String mem=showMem.toString();
		
		request.setAttribute("showmem", showMem);
		RequestDispatcher rd=request.getRequestDispatcher("/views/showmember.jsp");
		rd.forward(request, response);

	}
}
