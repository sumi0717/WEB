package test.cafe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dto.CafeCommentDto;

import test.controller.Action;
import test.controller.ActionForward;


public class CafeCommentListAction extends Action{
	
		private static final int PAGE_ROW_COUNT = 5;
		// 하단 디스플레이 페이지 갯수
		private static final int PAGE_DISPLAY_COUNT = 3;

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			
			int ref_group=Integer.parseInt(request.getParameter("ref_group"));
			
			// 1. 파일 목록을 불러와서
			List<CafeCommentDto> Clist = CafeCommentDao.getInstance().getList(ref_group);
			
			// 2. request에 담고
			request.setAttribute("Clist", Clist);
			
			// 3. view 페이지로 forward이동
			ActionForward af = new ActionForward("/cafe/detail.do?num="+ref_group);
			af.setRedirect(false);
			return af;
	}
	
}
