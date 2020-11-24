package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.service.Manager;

public class DeletePostController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postId = (int)(request.getAttribute("postId"));
		try {
			Manager manager = Manager.getInstance();
			// 해당 게시글을 삭제할 권한이 있는지 확인
			// writer는 해당 post 작성자의 memberId임
			int writer = (int) request.getAttribute("member_id");
			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(Integer.toString(writer), session) ||
					UserSessionUtils.isLoginUser("admin", session)) {
				// 현재 로그인한 사용자가 삭제 권한이 있는 사용자이거나 관리자인 경우 -> 삭제 가능
				manager.removePost(postId);
				// @@(해당 스터디 그룹의 게시글 목록으로 redirect?=>groupId를 전달해야하나??)
				return "redirect:/post/list";

			}
			// else (삭제 불가능한 경우) 게시글 상세보기 화면으로 오류 메세지를 전달
			request.setAttribute("exception", 
					new IllegalStateException("자신이 작성한 게시글만 삭제할 수 있습니다."));        		
			return "/mystudy/detailPost.jsp";
			
		} catch (Exception e) {
			// 오류 메세지를 포워딩
			request.setAttribute("exception", e);
			return "/mystudy/detailPost.jsp";
		}
		
	}

}
