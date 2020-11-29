package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.service.Manager;

// 재임 : Main.java test 완료
public class ApplyStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int userId = UserSessionUtils.getLoginUserId(session);
		int groupId = Integer.valueOf(request.getParameter("groupId"));
//		System.out.println(groupId);
		Manager manager = Manager.getInstance();
		// 신청 오류시 포워딩할 스터디 그룹 객체
		StudyGroup studyGroup = manager.findGroup(groupId);
		
		String comments = request.getParameter("comments");
		
//		int userId = 1;
//		int groupId = 1011;
//		String comments = "안녕하세요~! 데베프 스터디 신청합니다.";

		int result = 0;	
		try {
			result = manager.applyToGroup(groupId, userId, comments);
//			if(manager.applyToGroup(groupId, userId, comments) == 1) {
//				result = 1;
//				System.out.println("신청 성공");
//			}else {
//				result = 0;
//				System.out.println("신청 실패");
//			}			

			if (result == 1) {
				return "redirect:/studyGroup/myApplyList";
			}
			return "redirect:/studyGroup/view?groupId=" + groupId + "&result=" + result;

		} catch (Exception e) {
			//신청이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/studygroup_list/studygroup_view.jsp
			//alert(exception)
			request.setAttribute("StudyGroup", studyGroup);
			request.setAttribute("exception", e);
			request.setAttribute("comments", comments);
			return "/study/studygroup_view.jsp";
		}
	}
	
}
