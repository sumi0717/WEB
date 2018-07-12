package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;

public class MemberDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//�뙆�씪誘명꽣濡� �쟾�떖�릺�뒗 �궘�젣�븷 �쉶�썝�쓽 踰덊샇瑜� �젙�닔濡� �뼸�뼱�궦�떎
		int num=Integer.parseInt(request.getParameter("num"));
		//DB�뿉�꽌 �빐�떦 �쉶�썝�쓽 �젙蹂대�� �궘�젣�븯怨�
		MemberDao dao=MemberDao.getInstance();
		dao.delete(num);
		
		
		//�쓳�떟�븳�떎
		//�쓳�떟 �씤肄붾뵫 �꽕�젙		
		response.setContentType("text/html;charset=utf-8");
		//�겢�씪�씠�뼵�듃�뿉寃� �쓳�떟�븷�닔 �엳�뒗 媛앹껜�쓽 李몄“媛� �뼸�뼱�삤湲�
		PrintWriter pw = response.getWriter();
		//html �삎�떇�쑝濡� �쓳�떟�븯湲� 
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>�쉶�썝 �젙蹂대�� �궘�젣�뻽�뒿�땲�떎</p>");
		pw.println("<a href='list'>�쉶�썝 紐⑸줉 蹂닿린</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
