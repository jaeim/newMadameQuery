package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;

// 재임 : Main.java test 완료
public class DeleteStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int deleteId = Integer.valueOf(request.getParameter("groupId"));
		
		try {
			Manager manager = Manager.getInstance();
			manager.removeStudyGroup(deleteId);
			// 성공시 다시 (팀장)스터디 그룹 목록화면으로 redirect
			return "redirect:/studyGroup/manageStudyList";
			
		} catch (Exception e) { // 예외 발생시 다시 manage_main.jsp로 forwarding
			//alert(exception)
			request.setAttribute("exception", e);
			return "/manage/manage_main.jsp";
		}
		
	}
}
