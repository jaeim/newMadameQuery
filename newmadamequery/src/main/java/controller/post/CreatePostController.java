package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.service.Manager;

// 재임: 테스트 ok
public class CreatePostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//groupId,memberId 
//		int groupId = (int)(request.getAttribute("groupId"));
//		int memberId = (int)(request.getAttribute("memberId"));
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		
		HttpSession session = request.getSession();
		int memberId = Integer.parseInt(UserSessionUtils.getLoginUserId(session));
		
		Post post = new Post();
		
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		post.setMember_id(memberId);
		post.setGroup_id(groupId);
		try {
			Manager manager = Manager.getInstance();
			int post_id = manager.createPost(post);
			// @@ 게시글 목록으로 리다이렉션  + groupId도 같이 쿼리로??
			// (리다이렉션이니 ListPostController에서 request.getParameter하여 groupId 못찾으니까?)
			return "redirect:/post/list";
			
		} catch (Exception e) {
			request.setAttribute("exception", e);
			request.setAttribute("post", post);
			// 게시글 등록폼
			return "/mystudy/addStudyboard.jsp";
		}
		
		
	}
}
