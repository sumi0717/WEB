package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

//form 전송되는 회원 정보를 DB에 저장하는 서블릿
@WebServlet("/member/insert")
public class MemberInsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 전송 되었을 때 한글 깨지지 않도록
		request.setCharacterEncoding("utf-8");
		//전송된 파라미터 추출
		String name=request.getParameter("name");
		String addr=request.getParameter("addr");
		
		//회원 정보를 DB에 저장하고
		MemberDto dto=new MemberDto();
		dto.setName(name);
		dto.setAddr(addr);
		
		//MemberDao 객체를 이용해서 DB에 저장
		MemberDao dao=MemberDao.getInstance();
		dao.insert(dto);
				
		//응답 인코딩 설정		
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답할수 있는 객체의 참조값 얻어오기
		PrintWriter pw = response.getWriter();
		//html 형식으로 응답하기 
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>회원 정보를 추가 했습니다</p>");
		
		pw.println("<a href='list'>목록보기</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
