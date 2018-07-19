package test.privatee.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UserDao;
import test.users.dto.UsersDto;

public class infoAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//1. 세션에 저장된 아이디를 읽어와서
		//String id=(String)session.getAttribute("id");
		//2. DB 에서 해당 아이디의 개인정보를 읽어와서 
		//UsersDto dto=UserDao.getInstance().getData(id);
		//3. 응답한다. 
		
		return null;
	}
	
}
