package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		String[] list= {
				"어서오세요",
				"반갑습니다~",
				"냠냠!",
				"배고푸다",
				"졸리다"
		};
		//경우의 수 얻기 0~4
		int index=new Random().nextInt(5);
		//인사말
		String greet=list[index];
		
		//응답 인코딩 설정
		response.setCharacterEncoding("uft-8");
		//응답 컨텐츠
		response.setContentType("text/html;charset=utf-8");
		
		//문자열 출력
		PrintWriter pw=response.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>안녕</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>인사 페이지</h3>");
		pw.println("<p>인사말 : <strong>"+greet+"</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
