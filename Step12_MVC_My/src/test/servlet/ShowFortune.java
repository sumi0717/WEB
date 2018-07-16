package test.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// /showfortune 요청을 처리할 서블릿
@WebServlet("/showfortune")
public class ShowFortune extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1. 오늘의 운세를 얻어오는 비지니스 로직 수행
		String fortuneToday="밖에 나가삼";
						
		//2. request 영역에 데이터(Model)을 담는다, 
		//java의 Model type은 int, float, String, xxxDto, List<xxx>
		// 이런 데이터 타입을 request.setAttribute()해서 담음
		// 리퀘스트 영역에 담으면 응답하기 전까지 데이터를 담고 있게 됨.
		request.setAttribute("fortuneToday", fortuneToday);
		
		//3. view 페이지로 (jsp 페이지로) forward 이동
		// redirect 이동하면 리퀘스트에 담은 값은 사라지게 됨.
		// redirect 자체도 응답이기 때문!!!
		RequestDispatcher rd=
				request.getRequestDispatcher("/views/showfortune.jsp");
							//views 폴더의 showfortune에서 fortuneToday(String type)를 응답하게 됨
							//어떤 키값으로 어떤 타입을 담았는지 기억 해야함!
		rd.forward(request, response);
	}
}
