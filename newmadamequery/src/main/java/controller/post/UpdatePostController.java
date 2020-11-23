package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.service.Manager;

public class UpdatePostController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = new Post();
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		post.set_id((int)request.getAttribute("postId"));
		
		Manager manager = Manager.getInstance();
		try {
			manager.updatePost(post);
			
			return "";
			// 현아님이 detailpost.jsp (특정 게시글 상세보기) 구현 후 redirect?? 하기 
		} catch (Exception e) {
			//alert(exception)
			request.setAttribute("exception", e);
			request.setAttribute("post", post);
			return "";
			// 현아님이 postupdateForm.jsp (게시글 수정 폼) 구현 후 forwading 하기
		}
	}

}
