package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * [ 서블릿 클래스 만드는 방법 ]
 * 
 * 1. HttpServlet 클래스를 상속받는다
 * 2. service() 메소드를 오버라이딩한다.
 * 3. web.xml 문서에 서블릿을 정의하고 맵핑한다.
 * 
 */
// 1. HttpServlet 클래스를 상속 받는다
public class ShowTimeServlet extends HttpServlet{
	
	// 2. service() 메소드 오버라이딩
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		
		
		//클라이언트에게 응답할 수 있는 객체의 참조값 얻어오기
		//PrintWriter 객체를 통해서 문자열 출력하기
		PrintWriter pw=response.getWriter();
		//html 형식으로 응답하기
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>시간 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		//날짜 객체 생성
		Date d=new Date();
		pw.println("<p>현재 시간 : "+d.toString()+" </p>");
							// dynamic, 동적인 프로그래밍
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
