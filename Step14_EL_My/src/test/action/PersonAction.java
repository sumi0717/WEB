package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class PersonAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String person="인간입니다..";
		request.setAttribute("person", person);
		return new ActionForward("/views/person.jsp");
	}

}
