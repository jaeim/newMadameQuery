package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.User;
import model.service.Manager;
// 재임
public class UpdatePostFormController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postId = (int)(request.getAttribute("postId"));
		try {
			Manager manager = Manager.getInstance();
			Post post = manager.findPost(postId);
			request.setAttribute("post", post);
	
			// 해당 게시글을 수정할 권한이 있는지 확인
			// writer는 해당 post 작성자의 memberId임
			int writer = (int) request.getAttribute("memberId");
			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(Integer.toString(writer), session) ||
					UserSessionUtils.isLoginUser("admin", session)) {
				// 현재 로그인한 사용자가 수정 할 권한이 있는 사용자이거나 관리자인 경우 -> 수정 가능
				
				// 현아님이 postUpdateForm.jsp (게시글 수정 폼) 구현한 후 forwarding
			}
			// else (수정 불가능한 경우) 게시글 상세보기 화면으로 오류 메세지를 전달
			request.setAttribute("exception", 
					new IllegalStateException("자신이 작성한 게시글만 수정할 수 있습니다."));        		
			// 현아님이 detailpost.jsp (특정 게시글 상세보기) 구현한 후 forwarding
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
