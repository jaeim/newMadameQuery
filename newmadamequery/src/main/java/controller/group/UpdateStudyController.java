package controller.group;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Application;
import model.StudyGroup;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

// 현지
public class UpdateStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Manager manager = Manager.getInstance();
		int groupId = Integer.valueOf((String)request.getParameter("groupId"));
		//form출력
		if(request.getMethod().equals("GET")) {
			StudyGroup group = manager.findGroup(groupId);
			request.setAttribute("studyGroup", group);
			return "/manage/manage_update.jsp";
		}
		
		StudyGroup group = manager.findGroup(groupId);
		String groupName = (String) request.getParameter("groupName");
		if(groupName != null) { group.setGroupName(groupName); }
		String term = (String) request.getParameter("term");
		if(term != null) { group.setTerm(Integer.valueOf(term)); }
		String meetingType = (String)request.getParameter("meetingType");
		if(meetingType == null) { System.out.println("meetingType is null"); }
		if(meetingType != null) { System.out.println(meetingType); 
		group.setMeetingType(meetingType); }
 		String genderType = (String)request.getParameter("genderType");
 		if(genderType != null) { group.setGenderType(genderType); }
 		String gradeType = (String)request.getParameter("gradeType");
 		if(gradeType != null) { group.setGradeType(gradeType); }
 		String leaderId = (String)request.getParameter("leaderId");
 		if(leaderId != null) { group.setLeaderId(Integer.valueOf(leaderId)); }
		
		int result = 0;
		try {
			result = manager.updateStudyGroup(group);
		}catch(Exception e) {
			return ""; // 오류페이지(스터디그룹이 없거나, 업데이트 실패 시)
		}
	
		ArrayList<Application> applyList = manager.getAllApplication(groupId);
		request.setAttribute("applyList", applyList);
		request.setAttribute("studyGroup", group);
		// 업데이트 성공
		return "/manage/manage_view.jsp";
	}

}
