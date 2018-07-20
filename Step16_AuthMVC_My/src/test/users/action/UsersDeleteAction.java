package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UserDao;

public class UsersDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//세션에서 아이디를 읽어와서
		String id=(String)request.getParameter("id");
		//DB에서 삭제하고
		UserDao.getInstance().delete(id);
		//로그아웃 처리도 하고
		request.getSession().invalidate();
		
		//회원 탈퇴 처리된 id를 request에 담기
		request.setAttribute("id", id);
		//리퀘스트는 1회성으로 1번 쓰면 사라지는 데이터이기 때문에
		//회원 탈퇴한 사람 아이디 탈퇴 됐다고 출력하고 없애기 좋음
		
		//view페이지로 forward 이동해서 응답한다
		return new ActionForward("/views/users/private/delete.jsp");
	}

}
