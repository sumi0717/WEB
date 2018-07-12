package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionScope/showinfo")
public class ShowInfoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 영역(session scope)에 정보 담기 
		// session 객체는 request로부터 얻어냄
		// "myName"이라는 키 값으로 String type 담기
		HttpSession session=request.getSession();
		// .setAttribute("key값", value); | session에 data 담는 방법.
		session.setAttribute("myName", "냠냠");
		
		String cPath=request.getContextPath();
		//리다이렉트 이동하라고 응답하기
		response.sendRedirect(cPath+"/path2/result.jsp");
	}
}
