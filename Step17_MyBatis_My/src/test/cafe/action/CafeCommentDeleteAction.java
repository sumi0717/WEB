package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeCommentDto;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentDeleteAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		   int num=Integer.parseInt(request.getParameter("num")); //댓글의 번호
		      int tNum=Integer.parseInt(request.getParameter("tNum")); //글 번호
		      //2.cafeCommentDao를 이용해서 글 삭제
		      boolean isSuccess=CafeCommentDao.getInstance().delete(num);
		      
		      //3. 결과를 request에 담고
		      request.setAttribute("tNum", tNum);
		      request.setAttribute("isSuccess", isSuccess);
		      
		      //4. view 페이지로 forward 이동해서 응답
		      ActionForward af=
		               new ActionForward("/cafe/detail.do?num="+tNum);
		         af.setRedirect(true);
		         return af;
	
	}

}
