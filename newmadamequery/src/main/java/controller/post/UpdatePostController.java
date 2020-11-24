package controller.post;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Comment;
import model.Post;
import model.service.Manager;

public class UpdatePostController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = new Post();
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
//		post.set_id((int)request.getAttribute("postId"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		post.set_id(postId);
		
		Manager manager = Manager.getInstance();
		try {
			manager.updatePost(post);		
			// @@현아님이 detailpost.jsp (특정 게시글 상세보기) 구현 후 post 객체 전달받아 포워딩 하기 or 리다이렉션??
			Post detailPost = manager.findPost(postId);
			int numOfComm = manager.numberOfComment(postId);
			ArrayList<Comment> commList = manager.getAllComment(postId);
			
			request.setAttribute("post", detailPost);
			request.setAttribute("numOfComm", numOfComm);	
			request.setAttribute("commList", commList);
			
			return "/mystudy/detailPost.jsp";	

		} catch (Exception e) {
			//alert(exception)
			request.setAttribute("exception", e);
			request.setAttribute("post", post);
			return "/myStudy/postUpdateForm.jsp";
		}
	}

}
