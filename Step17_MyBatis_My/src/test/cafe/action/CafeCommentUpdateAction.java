package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dto.CafeCommentDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentUpdateAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 수정할 글 정보 얻어오기
		int num=Integer.parseInt(request.getParameter("num"));
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		int textnum=Integer.parseInt(request.getParameter("textnum"));
		// CafeDto에 담기
		CafeCommentDto dto=new CafeCommentDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setContent(content);
		//CafeDao를 이용해서 수정 반영
		boolean isSuccess=CafeCommentDao.getInstance().update(dto);
		//request에 결과 담고
		request.setAttribute("isSuccess", isSuccess);
		//응답
		ActionForward af=
				new ActionForward("/cafe/detail.do?num="+textnum);
		af.setRedirect(true);
		return af;
		
	}

}
