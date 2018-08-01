package test.gallery.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;
import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

public class GalleryListAction extends Action {

@Override
public ActionForward execute(HttpServletRequest request,
		HttpServletResponse response) {
	// 1. 회원 목록을 얻어온다
	//이미지 목록을 얻어온다.
	List<GalleryDto> list=GalleryDao.getInstance().getList();
	// 2. model을 r equest에 담는다
	request.setAttribute("list", list);
	// 3. view 페이지로 forward 이동되도록 ActionForward 객체 생성
	ActionForward af = new ActionForward("/views/gallery/list.jsp");
	// ActionForward 객체 리턴해주기
	return af;

}

}
