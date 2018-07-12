package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/buy")
public class BuyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code=request.getParameter("code");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		System.out.println(code+"|"+category+"|"+price);
		
		//간단 응답
		PrintWriter pw=response.getWriter();
		pw.println("/buy request ok~");
		pw.close();
	}
}
