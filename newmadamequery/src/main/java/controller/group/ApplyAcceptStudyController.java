package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;

public class ApplyAcceptStudyController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Manager manager = Manager.getInstance();
		
		String groupId = request.getParameter("studyGroupId"); //가입 신청 누른 스터디 그룹의 id
		String userId = request.getParameter("userId"); //현재 로그인한 사용자의 member_id
		
		manager.manageApplicationInGroup(Integer.parseInt(groupId), Integer.parseInt(userId), true);
		
		return "redirect:/studyGroup/manageStudy"; //팀장이 관리하고 있는 스터디 그룹 목록을 보여주는 화면으로 redirect
	}
}
