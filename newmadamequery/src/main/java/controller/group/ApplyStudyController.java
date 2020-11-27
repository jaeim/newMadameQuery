package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.Manager;

// 재임 : Main.java test 완료
public class ApplyStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int userId = UserSessionUtils.getLoginUserId(session);
		int groupId = Integer.valueOf(request.getParameter("groupId"));
				
		String comments = request.getParameter("comments");
		
//		int userId = 1;
//		int groupId = 1011;
//		String comments = "안녕하세요~! 데베프 스터디 신청합니다.";
		
		try {
			Manager manager = Manager.getInstance();
			manager.applyToGroup(groupId, userId, comments);
			
//			return "redirect:/studyGroup/list";
			return "redirect:/studyGroup/view?groupId=" + groupId;
		} catch (Exception e) {
			//신청이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/studygroup_list/studygroup_view.jsp
			//alert(exception)
			request.setAttribute("exception", e);
			request.setAttribute("comments", comments);
			return "/study/studygroup_view.jsp";
		}
	}
	
}
