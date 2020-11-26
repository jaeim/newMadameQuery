package controller.comment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Comment;
import model.service.Manager;
// 재임
public class RegisterCommentController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		int groupId = (int)(request.getAttribute("groupId"));
//		int member_id = (int)(request.getAttribute("membe_id"));
//		int postId = (int)(request.getAttribute("postId"));
		
		HttpSession session = request.getSession();
		int member_id = UserSessionUtils.getLoginUserId(session);
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		/* 테스트
		int postId = 411;
		int member_id = 201;
		int groupId = 611;
		*/
		Comment comment = new Comment();
		//comment.setContent("테스트에요.");
		comment.setContent(request.getParameter("content"));
		comment.setGroupId(groupId);
		comment.setMember_id(member_id);
		comment.setPostId(postId);
	
		try {
			Manager manager = Manager.getInstance();
			int comment_id = manager.createComment(comment);
			// @@detailPost.jsp에 댓글리스트 속성 저장..?
//			int numOfComm = manager.numberOfComment(postId);
//			ArrayList<Comment> commList = manager.getAllComment(postId);
//			
//			request.setAttribute("numOfComm", numOfComm);	
//			request.setAttribute("commList", commList);
			
//			return "/mystudy/detailPost.jsp";
			return "redirect:/post/detail?postId=" + postId;
		} catch (Exception e) {
			// 오류 메세지를 포워딩
			request.setAttribute("exception", e);
			request.setAttribute("comment", comment);
			return "/mystudy/detailPost.jsp";
		}	
	}
}
