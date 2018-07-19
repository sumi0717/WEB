package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import test.controller.Action;
import test.controller.ActionForward;

public class logoutAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//Session.invalidate();
		String cPath=request.getContextPath();
		return null;
	}

}
