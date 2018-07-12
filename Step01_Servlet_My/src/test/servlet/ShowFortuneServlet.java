package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *  오늘의 운세를 출력할 서블릿
 */
public class ShowFortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//오늘의 운세 목록
		String[] list= {
				"어쩌구저쩌구 동쪽으로 가면 귀인을 만나게 돼요 ",
				"냠냠냠",
				"쩝쩝쩝",
				"낄낄낄",
				"서쪽으로 가거라"
		};
		//0~4 사이의 랜덤한 정수 얻어내기
		int index=new Random().nextInt(5);
		//오늘의 운세
		String fortune=list[index];
		
		
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
		pw.println("<title>오늘의 운세</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>오늘의 운세 페이지</h3>");
		pw.println("<p>운세 : <strong>"+fortune+"</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
