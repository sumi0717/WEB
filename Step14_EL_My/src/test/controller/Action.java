package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action {
	//추상 메소드
	public abstract ActionForward 
		execute(HttpServletRequest request, HttpServletResponse response);

}
/*
 * 
 * Action 추상클래스를 (이 클래스에는 execute라는 메소드가 있음)
상속받아서 MemberListAction 서블릿
execute라는 메소드(요청처리
이 메소드 호출은 ActionServlet에서 함

요청의 종류당 test.member.action에 클래스 추가

MemberListAction으로 생성된 객체는 Action 타입 객체.

 */
