package controller.post;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Comment;
import model.Post;
import model.service.Manager;
import model.service.NotFoundException;

public class DetailPostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		try {
			Manager manager = Manager.getInstance();
			
			Post detailPost = manager.findPost(postId);
			int numOfComm = manager.numberOfComment(postId);
			ArrayList<Comment> commList = manager.getAllComment(postId);
			
			request.setAttribute("post", detailPost);
			request.setAttribute("numOfComm", numOfComm);	
			request.setAttribute("commList", commList);
			
			return "/mystudy/detailPost.jsp";	
		} catch (NotFoundException e) {
			request.setAttribute("Failed", true);
			request.setAttribute("exception", e);
			
			return "/mystudy/mystudy_view.jsp"; //게시물 없으면 게시글 목록 페이지로 이동
		}
	}
}
