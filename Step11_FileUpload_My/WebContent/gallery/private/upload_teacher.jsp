<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //파일을 저장할 폴더의 절대 경로 얻어오기
   //application 은 ServletContext type 객체 인데 jsp 기본 객체이다.
   //WebContent/upload 폴더를 만들어야 한다. 
   String realPath=application.getRealPath("/upload");

   //최대 업로드 사이즈 값 지정
   int sizeLimit=1024*1024*50; //50 Mbyte
   /*
      WEB-INF/lib/cos.jar 파일이 있어야 아래의 MultipartRequest,
      DefaultFileRenamePolicy 클래스를 import 해서 사용할수 있다.
   */
   
   // MultipartRequest 객체를 생성한다.
   // 객체가 성공적으로 생성되면 클라이언트가 업로드한 파일이
   // WebContent/upload 폴더에 저장된다. 
   MultipartRequest mr=new MultipartRequest(request,
         realPath,
         sizeLimit,
         "utf-8",
         new DefaultFileRenamePolicy());
   //업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
   String caption=mr.getParameter("caption");
   
   //갤러리에 파일명 저장하는 테이블은 없기 때문에 원본 파일명은 필요 없음.
   //String orgFileName=mr.getOriginalFileName("image");
   
   //파일 시스템에 저장된 파일명 
   String saveFileName=mr.getFilesystemName("image");
   
   //업로드한 클라이언트의 아이디
   String writer=(String)session.getAttribute("id");
   
   
   //캡션이랑, 파일 시스템에 저장된 파일명만 얻어오면 됨.
	
   //업로드된 파일의 정보를 FileDto 에 담고 
   GalleryDto dto=new GalleryDto();
   dto.setWriter(writer);
   dto.setCaption(caption);
   
   //이미지 경로는 웹 컨텐츠에 업로드 폴더에 저장된 파일이므로, 
   //이미지 경로는 이렇게 설정한다  
   // <img src="/Context Path/upload/kim1.jpg"/> 이런식으로 설정되는 셈
   dto.setImagePath("/upload/"+saveFileName); 
  
   //DB 에 저장한다.
   boolean isSuccess=GalleryDao.getInstance().insert(dto);
   
   //응답, 
   //Html로 뿌려줄 것인지, alert할것인지 redirect 할것인지 알아서
   String cPath=request.getContextPath();
   
   response.sendRedirect(cPath+"/gallery/list.jsp");
   
%>
