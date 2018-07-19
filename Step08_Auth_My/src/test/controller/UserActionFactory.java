package test.controller;

import test.users.action.loginAction;
import test.users.action.logoutAction;

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
		if(command.equals("/users/login")) {
			//로그인 요청 처리
			action=new loginAction();
			
		}else if(command.equals("/users/logout")) {
			action=new logoutAction();
		}
		return action; //action이란 메소드는 action타입을 리턴.
	}
}
