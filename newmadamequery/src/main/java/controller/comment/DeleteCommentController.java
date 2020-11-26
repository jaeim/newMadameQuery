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
public class DeleteCommentController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
//		int comment_id = 1001;
		try {
			Manager manager = Manager.getInstance();
			// 해당 댓글을 삭제할 권한이 있는지 확인
			// writer는 해당 댓글 작성자의 memberId임
//			int writer = 201;
			int writer = Integer.parseInt(request.getParameter("member_id"));
			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(writer, session)) {
				// 현재 로그인한 사용자가 삭제 권한이 있는 사용자이거나 관리자인 경우 -> 삭제 가능
				manager.removeComment(comment_id);				
				// 리다이렉션
				int postId = Integer.parseInt(request.getParameter("postId"));
//				int postId = 411;
				return "redirect:/post/detail?postId=" + postId;	
			}
//			// 삭제 불가능한 경우
			request.setAttribute("exception", 
					new IllegalStateException("자신이 작성한 댓글만 삭제할 수 있습니다."));        		
			return "/mystudy/detailPost.jsp";
			
		} catch (Exception e) {
			request.setAttribute("exception", e);   
			return "/mystudy/detailPost.jsp";
		}
	}
}
