package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;
import model.service.NotFoundException;

public class ApplyAcceptStudyController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int groupId = Integer.parseInt(request.getParameter("groupId")); //가입 신청 누른 스터디 그룹의 id
		int userId = Integer.parseInt(request.getParameter("memberId")); //현재 로그인한 사용자의 member_id
		String isAccepted = request.getParameter("isAccepted");
		try {
			Manager manager = Manager.getInstance();
			if(isAccepted.equals("true")) {
				manager.manageApplicationInGroup(groupId, userId, true);
			}else if(isAccepted.equals("false")) {
				manager.manageApplicationInGroup(groupId, userId, false);
			}
			 
			return "redirect:/studyGroup/manageStudy?groupId=" + groupId; //수락한 스터디그룹 상세페이지로 redirect	
		} catch (NotFoundException e) {
			request.setAttribute("Failed", true);
			request.setAttribute("exception", e);
			
			
			return "/manage/manage_view.jsp";
		}
	}
}
