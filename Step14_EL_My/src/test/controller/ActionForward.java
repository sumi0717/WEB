package test.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/*
 *  비지니스 로직 처리 후 이동할 경로 정보와 
 *  리다이렉트 이동할지 말지,에 대한 여부를 저장할 객체
 *  
 */
@WebServlet
public class ActionForward extends HttpServlet{
		//이동 경로 
		private String path;
		//리다일렉트 이동 여부 
		private boolean isRedirect;
		//생성자
		public ActionForward(String path) {
			this.path = path;
		}
		//생성자2
		public ActionForward(String path, boolean isRedirect) {
			this.path = path;
			this.isRedirect = isRedirect;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public boolean isRedirect() {
			return isRedirect;
		}
		public void setRedirect(boolean isRedirect) {
			this.isRedirect = isRedirect;
		}
		
}
