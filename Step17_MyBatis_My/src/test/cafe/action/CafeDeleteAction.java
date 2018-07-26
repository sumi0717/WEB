package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 파라미터로 전달되는 글 번호
		int num=Integer.parseInt(request.getParameter("num"));
		// 2. CafeDao를 이용해서 글 삭제
		boolean isSuccess=CafeDao.getInstance().delete(num);
		// 3. 결과를 reqeust에 담고
		request.setAttribute("isSuccess", isSuccess);
		return new ActionForward("/views/cafe/private/delete.jsp");
	}

}
