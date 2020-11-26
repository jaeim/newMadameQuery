package controller.group;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
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
		//form출력
		if(request.getMethod().equals("GET")) {
			int groupId = Integer.valueOf((String)request.getParameter("groupId"));
			StudyGroup group = manager.findGroup(groupId);
			ArrayList<User> groupMemberList = manager.getAllMemberInGroup(groupId);
			
			request.setAttribute("groupMemberList", groupMemberList);
			request.setAttribute("studyGroup", group);
			return "redirect:/manage/manage_update.jsp";
		}
		
		StudyGroup group = new StudyGroup();
		group.setGroupId(Integer.valueOf((String)request.getAttribute("groupId")));
		group.setGroupName((String)request.getAttribute("name"));
		group.setCreatedDate((Date)request.getAttribute("createdDate"));
		group.setNumberOfUsers(Integer.valueOf((String)request.getAttribute("numberOfUsers")));
		group.setDescription((String)request.getAttribute("description"));
		group.setTerm(Integer.valueOf((String)request.getAttribute("term")));
		group.setMeetingType((String)request.getAttribute("meetingType"));
		group.setGenderType((String)request.getAttribute("genderType"));
		group.setGenderType((String)request.getAttribute("gradeType"));
		group.setSubjectId(Integer.valueOf((String)request.getAttribute("subjectId")));
		group.setLeaderId(Integer.valueOf((String)request.getAttribute("leaderId")));
		
		int result = 0;
		try {
			result = manager.updateStudyGroup(group);
		}catch(Exception e) {
			return ""; // 오류페이지(스터디그룹이 없거나, 업데이트 실패 시)
		}
	
		// 업데이트 성공
		return "redirect:/manage/manage_view.jsp";
	}

}
