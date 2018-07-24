package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;
/*
 *  폼 전송되는 글 저장하는 액션
 */
public class CafeInsertAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//작성자
		String writer=(String)request.getSession().getAttribute("id");
		//제목
		String title=request.getParameter("title");
		//내용
		String content=request.getParameter("content");
		
		//CafeDto에 담기
		CafeDto dto=new CafeDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		//DB에 저장
		boolean isSuccess=CafeDao.getInstance().insert(dto);
		
		//request에 성공 여부 담기
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/cafe/private/insert.jsp");
	}

}
