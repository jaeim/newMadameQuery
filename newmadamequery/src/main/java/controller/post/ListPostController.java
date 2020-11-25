package controller.post;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.service.Manager;
import model.service.NotFoundException;

public class ListPostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		
		try {
			Manager manager = Manager.getInstance();
			ArrayList<Post> postList = manager.getAllPost(groupId);
			
			request.setAttribute("postList", postList);
			
			return "/myStudy/mystudy_view.jsp";
		} catch (NotFoundException e) {
	        request.setAttribute("Failed", true);
			request.setAttribute("exception", e);
			
			return "/myStudy/addStudyboard.jsp"; //보여줄 스터디그룹 목록 없으면 스터디그룹 추가 페이지로 이동
		}
		
	}
}
