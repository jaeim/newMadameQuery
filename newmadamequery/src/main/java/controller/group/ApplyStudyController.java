package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;

// 재임 : Main.java test 완료
public class ApplyStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		try {
			Manager manager = Manager.getInstance();
			manager.applyToGroup(groupId, userId);
			
			return "redirect:/studyGroup/list";
		} catch (Exception e) {
			//신청이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/studygroup_list/studygroup_view.jsp
			request.setAttribute("exception", e);
			request.setAttribute("comments", request.getAttribute("comments"));
			return "/study/studygroup_list/studygroup_view.jsp";
		}
	}
	
}
