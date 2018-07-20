package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

/*
 *  회원 추가 폼을 출력해주는 액션
 * 
 */
public class MemberInsertformAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//수행할 비지니스 로직은 없음.. 너무 간단한 객체이기 때문
		
		// /views/member/insertform.jsp 페이지로 forward 이동하도록
		ActionForward af=
				new ActionForward("/views/member/insertform.jsp");
		return af;
	}

}
