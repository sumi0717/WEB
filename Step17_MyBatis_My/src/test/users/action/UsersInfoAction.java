package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UserDao;
import test.users.dto.UsersDto;
/*
 * 	개인 정보를 출력해주는 액션
 * 	
 */
public class UsersInfoAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//세션에서 로그인 된 아이디를 읽어와서
		String id=(String)request.getSession().getAttribute("id");
		//개인 정보를 불러온다
		UsersDto dto=UserDao.getInstance().getData(id);
		//request에 담고
		request.setAttribute("dto", dto);
		//view 페이지로 forward 이동
		return new ActionForward("/views/users/private/info.jsp");
	}

}
