package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UserDao;
import test.users.dto.UsersDto;

public class LoginAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//폼 전송되는 아이디 비밀번호를 읽어와서
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		//DB의 정보와 일치하는지 확인해서
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		//지금은 정보가 2개밖에 되지 않지만 dto 객체 생성해서 객체에 담아서 일치 여부 확인하면 좀 더 손쉬움! 
		//일일이 id, pwd 등 정보 따로 각 대응해가며 매치하는 것 보다는!!!
		//이게 dto 객체 생성해서 setter 메소드 써서 정보 담아두는 이유!
		

		//로그인 성공 여부
		boolean isLoginSuccess=UserDao.getInstance().isValid(dto);
		
		
		//로그인 성공 후 원래 가야할 곳의 정보
		String url=request.getParameter("url");
		
		if(isLoginSuccess) {
			System.out.println("ok");
			//세션 객체를 이용해서 로그인 처리 하기
			request.getSession().setAttribute("id", id);
			//세션은 request.getSession으로 얻어내야 함!!! session에다 담는게 로그인 처리.
		}else {
			System.out.println("no");
		}
		
		//Model을 request에 담기
		request.setAttribute("isLoginSuccess", isLoginSuccess);
		request.setAttribute("url", url);
		
		return new ActionForward("/views/users/login.jsp");
	}

}
