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
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		System.out.println("들어옴");
		HttpSession session = request.getSession();
		int memberId = UserSessionUtils.getLoginUserId(session);
		
		Post post = new Post();
		
//		int groupId = 1011;
//		int memberId = 201;
//		post.setTitle("※공지사항");
//		post.setContent("수요일 오후 6시 군자역 스타벅스!");
		
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		
		System.out.println(post.getTitle() + ", " + post.getContent());
		
		post.setMember_id(memberId);
		post.setGroup_id(groupId);
		
		System.out.println(post.getMember_id() + "," + post.getGroup_id());
		
		try {
			System.out.println("try 안으로 들어옴.");
			Manager manager = Manager.getInstance();
			int post_id = manager.createPost(post);
			// @@ 게시글 목록으로 리다이렉션  + groupId도 같이 쿼리로??
			// (리다이렉션이니 ListPostController에서 request.getParameter하여 groupId 못찾으니까?)
			System.out.println("create- post 실행 중");
			return "redirect:/post/list?groupId=" + groupId;
			
		} catch (Exception e) {
			request.setAttribute("exception", e);
			request.setAttribute("post", post);
			// 게시글 등록폼
			return "/mystudy/addStudyboard.jsp";
		}
		
		
	}
}
