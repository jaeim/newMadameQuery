package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class ApplyAcceptStudyController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String groupId = request.getParameter("studyGroupId"); //가입 신청 누른 스터디 그룹의 id
		
		/*스터디 신청한 사용자의 정보는 userId, name 이정도만 request.getParameter로 ApplyController에 넘기면 될듯? --> 나중에 다시 생각*/
		String userId = request.getParameter("userId"); //현재 로그인한 사용자의 member_id
		//String name = request.getParameter("name");
		
		//manager 클래스 사용  -> manager에서 StudyGroupDAO.manageApplication(int groupId, int userId, boolean approved) -> dao 호출
		//manager.addMember(studyGroupId, User)가 아니라 manager.addMember(studyGroupId, userId)로 호출?
		
		return "redirect:/studyGroup/manageStudy"; //팀장이 관리하고 있는 스터디 그룹 목록을 보여주는 화면으로 redirect
	}
}
