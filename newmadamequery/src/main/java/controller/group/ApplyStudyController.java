package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;

// 재임 : Main.java test 완료
public class ApplyStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int groupId = (int)(request.getAttribute("groupId"));
		int userId = (int)(request.getAttribute("userId"));
		String comments = request.getParameter("comments");
		
		try {
			Manager manager = Manager.getInstance();
			manager.applyToGroup(groupId, userId, comments);
			
			return "redirect:/studyGroup/list";
		} catch (Exception e) {
			//신청이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/studygroup_list/studygroup_view.jsp
			//alert(exception)
			request.setAttribute("exception", e);
			request.setAttribute("comments", comments);
			return "/study/studygroup_list/studygroup_view.jsp";
		}
	}
	
}