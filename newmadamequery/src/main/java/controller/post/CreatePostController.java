package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.service.Manager;

// 재임: 테스트 ok
public class CreatePostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//groupId,memberId 
		int groupId = (int)(request.getAttribute("groupId"));
		int memberId = (int)(request.getAttribute("memberId"));
		
		Post post = new Post();
		
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		post.setMember_id(memberId);
		post.setGroup_id(groupId);
		try {
			Manager manager = Manager.getInstance();
			manager.createPost(post);
			// (게시글 목록?)
			return "redirect:/mystudy/mystudy_view";
		} catch (Exception e) {
			request.setAttribute("exception", e);
			request.setAttribute("post", post);
			// (게시글 등록폼)
			return "/mystudy/addStudyboard.jsp";
		}
		
		
	}
}