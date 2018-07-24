package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 *  중간에 요청을 가로채서 특정 동작을 하기 위한 클래스 
 *  
 *  1. javax.servlet.Filter 인터 페이스를 구현한다.
 *  2. Filter 의 동작을 맵핑한다.  
 */

//2. 
			//절대경로로 설정해야함 꼭 !
			//로그인 해야지만 해당경로 이용 가능하도록 설정하는 코드!!
@WebFilter({"/users/private/*", "/file/private/*", "/cafe/private/*"})
public class LoginFilter implements Filter{//1. 

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, 
			FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("doFilter() ...");
		
		//원래 type 으로 casting 
		//ServletRequest는 HttpServletRequest의 부모 타입.
		//서블렛리퀘스트에서 http서블렛을 쓰려면, 캐스팅 해서 사용.
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		
		//context path 
		String cPath=request.getContextPath();
		//현재 요청된 url 정보를 읽어온다.(원래 이동하려던 목적지) 
		String url=request.getRequestURI();
		
		//세션 객체를 얻어와서 
		HttpSession session=request.getSession();
		//id 가 저장되어 있는지 읽어와 본다.
		String id=(String)session.getAttribute("id");
		if(id==null) {//로그인 하지 않았으면
			//로그인 페이지로 이동하라고 리다일렉트 응답을 준다.
			response.sendRedirect(cPath+"/users/loginform.do?url="+url);
		}else {
			// 요청의 흐름 계속 진행 시키기 
			chain.doFilter(req, res);
			//chain.을 하지 않으면, 계속 진행되지 않고, 멈춰있게됨.
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}


