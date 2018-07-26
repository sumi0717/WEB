package test.cafe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;


public class CafeListAction extends Action{

		private static final int PAGE_ROW_COUNT = 5;
		// 하단 디스플레이 페이지 갯수
		private static final int PAGE_DISPLAY_COUNT = 3;

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			/*
			 * request에 검색 keyword가 전달 될 수도 있고 안 될 수도 있다
			 * 
			 * 1. 전달 안되는 경우: home 에서 목록보기를 누른경우
			 * 2. 전달 되는 경우   : list.do에서 검색어를 입력 후 form 전송 한 경우
			 * 3. 잔달 되는 경우   : 이미 검색을 한 상태에서 페이지 링크를 누른 경우
			 * 
			 */
			
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
			
			// 보여줄 페이지의 번호
			int pageNum = 1; // 디폴트, /file/list.do?pageNum=3 이렇게 쓰기 위한 로직
			// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽기
			String strPageNum = request.getParameter("pageNum"); // static final int 입력값을 바탕으로
			if (strPageNum != null) {// 페이지 번호가 파라미터로 넘어온다면
				// 페이지 번호를 설정한다
				pageNum = Integer.parseInt(strPageNum);
			}
			// 보여줄 페이지 데이터의 시작 ResultSet row 번호
			int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT; // 등차수열 an=a+(n-1)d
			// 보여줄 페이지 데이터의 끝 ResultSet row 번호
			int endRowNum = pageNum * PAGE_ROW_COUNT;

			// 전체 row의 갯수를 읽어온다
			int totalRow = CafeDao.getInstance().getCount(dto);
			//전체 페이지의 갯수 구하기
			int totalPageCount=
					(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
			// 시작 페이지 번호
			int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
			// 끝 페이지 번호
			int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
			// 끝 페이지 번호가 잘못된 값이라면!
			if (totalPageCount < endPageNum) {
				endPageNum = totalPageCount; // 보정해준다.
			}
			
			// 많은 로우 중 원하는 로우만 선택할 수 있게 하는 메소드!
			// startRowNum 과 endRowNum을 FileDto 에 담은 다음
			// 위에서 만든 CafeDto에 추가 정보를 담는다
			dto.setStartRowNum(startRowNum);
			dto.setEndRowNum(endRowNum);

			// 1. 파일 목록을 불러와서
			List<CafeDto> list = CafeDao.getInstance().getList(dto);
			
			// 2. request에 담고
			request.setAttribute("list", list);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("startPageNum", startPageNum);
			request.setAttribute("endPageNum", endPageNum);
			request.setAttribute("totalPageCount", totalPageCount);
			request.setAttribute("totalRow", totalRow);
			// 3. view 페이지로 forward이동
			return new ActionForward("/views/cafe/list.jsp");
	}
	
}
