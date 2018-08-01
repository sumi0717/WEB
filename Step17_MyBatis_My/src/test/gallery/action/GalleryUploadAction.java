package test.gallery.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.controller.Action;
import test.controller.ActionForward;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryUploadAction extends Action {

@Override
public ActionForward execute(HttpServletRequest request,
		HttpServletResponse response) {
	// 파일을 저장할 폴더의 절대 경로 얻어오기
	// application 은 ServletContext type 객체 인데 jsp 기본 객체이다.
	// WebContent/upload 폴더를 만들어야 한다.
	ServletContext application = request.getServletContext();
	String realPath = application.getRealPath("/upload");

	// 최대 업로드 사이즈 값 지정
	int sizeLimit = 1024 * 1024 * 50; // 50 Mbyte
	/*
	 * WEB-INF/lib/cos.jar 파일이 있어야 아래의 MultipartRequest, DefaultFileRenamePolicy
	 * 클래스를 import 해서 사용할수 있다.
	 */

	// MultipartRequest 객체를 생성한다.
	// 객체가 성공적으로 생성되면 클라이언트가 업로드한 파일이
	// WebContent/upload 폴더에 저장된다.
	try {
	MultipartRequest mr = new MultipartRequest(request, realPath,
			sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	// 업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
	String caption = mr.getParameter("caption");
	// 원본 파일명
	String orgFileName = mr.getOriginalFileName("image");
	// 파일 시스템에 저장된 파일명
	String saveFileName = mr.getFilesystemName("image");

	String ImagePath = "\\" + "upload" + "\\" + saveFileName;

	// 업로드한 클라이언트의 아이디
	HttpSession session = request.getSession();
	String writer = (String) session.getAttribute("id");

	// 업로드된 파일의 정보를 FileDto 에 담고
	GalleryDto dto = new GalleryDto();
	dto.setWriter(writer);
	dto.setCaption(caption);
	dto.setImagePath("/upload/"+saveFileName); 

	// DB 에 저장한다.
	boolean isSuccess = GalleryDao.getInstance().insert(dto);
	request.setAttribute("isSuccess", isSuccess);
	} catch (IOException ioe) {
		ioe.printStackTrace();
	}

	return new ActionForward("/views/gallery/private/upload.jsp");
}

}
