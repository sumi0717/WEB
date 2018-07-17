package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dao.MemberDao;
import test.member.dto.MemberDto;


public class MemberDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//get 방식 파라미터로 전달되는 회원번호 추출
		int num=Integer.parseInt(request.getParameter("num"));
		//DB에서 해당 회원 삭제
		/*
		boolean isSuccess=MemberDao.getInstance().delete(num);
		if(isSuccess) {
			request.setAttribute("msg", num+" 번 회원을 삭제함");
		}else {
			request.setAttribute("msg", "삭제 실패!");
		}
		request.setAttribute("url", "/member/list.do");
		
		return new ActionForward("/views/member/alert.jsp"); */
		
		//삭제 후 redirect 이동 시키려면?
		ActionForward af=new ActionForward("/member/list.do");
		af.setRedirect(true); //true를 넣지 않으면 forward고 true를 넣으면 redirect
		
		return af;
		
	}

}
