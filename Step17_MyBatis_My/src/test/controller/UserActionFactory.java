package test.controller;

import test.action.HomeAction;
import test.member.action.MemberDeleteAction;
import test.member.action.MemberInsertAction;
import test.member.action.MemberInsertformAction;
import test.member.action.MemberListAction;
import test.member.action.MemberUpdateAction;
import test.member.action.MemberUpdateformAction;

public class UserActionFactory {
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory==null){
			factory=new UserActionFactory();
		}
		return factory;
	}
	
	//인자로 전달되는 command 를 수행할 Action type 객체를 리턴해주는 
	//메소드
	public Action action(String command){
		//1. member/list.do가 인자로 전달되는 커맨드를 받게되면 MemberListAction()이 리턴되고
		//2. member/insert.do가 인자로 전달되는 커맨드를 받게되면 MemberInsertAction()이 리턴됨
				
		//Action 추상클래스 type 을 담을 지역변수 만들기 
		Action action=null;
		if(command.equals("/home")) {
			//홈 요청 처리
			action=new HomeAction();
		}else if(command.equals("/member/list")) {
			//회원 목록 요청 처리
			action=new MemberListAction();
		}else if(command.equals("/member/insertform")) {
			//회원 추가 폼 요청 처리
			action=new MemberInsertformAction();
		}else if(command.equals("/member/insert")) {
			//회원 추가 요청 처리
			action=new MemberInsertAction();
		}else if(command.equals("/member/delete")) {
			//회원 삭제 요청처리
			action=new MemberDeleteAction();
		}else if(command.equals("/member/updateform")) {
			//회원 수정 폼 요청 처리
			action=new MemberUpdateformAction();
		}else if(command.equals("/member/update")) {
			//회원 정보 수정 반영 요청 처리
			action=new MemberUpdateAction();
		}
		return action; //action이란 메소드는 action타입을 리턴.
	}
}
