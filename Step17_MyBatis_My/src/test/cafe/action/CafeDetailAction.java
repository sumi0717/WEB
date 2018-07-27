package test.cafe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeCommentDto;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;
/*
 * 글 자세히 보기 요청 처리
 */
public class CafeDetailAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 1 파라미터로 전달되는 글 번호 읽어오기
		int num=Integer.parseInt(request.getParameter("num"));
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//CafeDto 객체를 생성해서
		CafeDto dto=new CafeDto();
		if(keyword != null) { //검색어가 전달된 경우
			if(condition.equals("titlecontent")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			//list.jsp에서 필요한 내용 담기
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		//글 번호도 dto에 담는다
		//글 번호를 dto에 담아서 전달하는 이유는, 키워드를 포함해야 하기 떄문.
		dto.setNum(num);
		int tNum= dto.getNum();
		
		// 2 CafeDao를 이용해서 글 정보를 읽어와서  
		CafeDto resultDto=CafeDao.getInstance().getData(dto);
		// 글 조회수 올리기
		CafeDao.getInstance().addViewCount(num);
		
		// 3 request에 담고
		request.setAttribute("dto", resultDto); 
		// 로그인 여부 확인해서  request에 담기
		String id=(String)request.getSession().getAttribute("id");
		boolean isLogin=false;
		if(id!=null) {
			isLogin=true;
		}
		request.setAttribute("isLogin", isLogin);
		
		//댓글 목록 리턴하기
		//List<CafeCommentDto> Clist = CafeCommentDao.getInstance().getList(tNum);
		//request.setAttribute("Clist", Clist);
		
		//선생님 방법
		List<CafeCommentDto> commentList=
				CafeCommentDao.getInstance().getList(num);
		request.setAttribute("commentList", commentList);
		
		// 4 view 페이지로 forward 이동해서 응답
		return new ActionForward("/views/cafe/detail.jsp");
	}

}
