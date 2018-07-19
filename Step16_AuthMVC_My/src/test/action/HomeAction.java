package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class HomeAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//공지사항을 Dao를 이용해서 읽어온다
		List<String> msgs=new ArrayList<>();
		msgs.add("날씨가 더워용");
		msgs.add("연어 먹어요");
		msgs.add("연어는 맛있어요");
		msgs.add("사케동을 먹을까 회를 먹을까");
		
		//모델을 request에 담는다
		request.setAttribute("msgsKey", msgs);
		
		//view 페이지로 forward 이동, 리퀘스트에 담긴 msgsKey(key값)를 view(home.jsp)페이지에서 출력.
		return new ActionForward("/views/home.jsp");
	}

}
