package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dto.CafeCommentDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentUpdateformAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 파라미터로 전달되는 수정할 글 번호 읽어오기
		int num = Integer.parseInt(request.getParameter("num"));
		int textnum = Integer.parseInt(request.getParameter("textnum"));
		CafeCommentDto dto = new CafeCommentDto();
		dto.setNum(num);
		// 2. 수정할 글 정보 얻어오기
		CafeCommentDto resultDto = CafeCommentDao.getInstance().getData(dto);
		// 3. request에 담고
		request.setAttribute("dto", resultDto);

		return null;
	}

}
