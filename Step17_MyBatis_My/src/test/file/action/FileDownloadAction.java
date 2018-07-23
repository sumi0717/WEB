package test.file.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileDownloadAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 다운로드 시켜줄 파일의 번호를 읽어와서
		int num = Integer.parseInt(request.getParameter("num"));
		// DB에서 해당파일 정보를 얻어온다음
		FileDto dto = FileDao.getInstance().getData(num);
		// request에 담고
		request.setAttribute("dto", dto);
		// view 페이지로 forward 이동해서 다운로드 시켜주기
		return new ActionForward("/views/file/download.jsp");
	}

}
