package controller.group;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

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
			
			request.setAttribute("studyGroup", group);
			return "redirect:/manage/manage_main/manage_update.jsp";
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
		
		int result = manager.updateStudyGroup(group);
		if(result == 1) {
			return "redirect:/manage/manage_main/manage_view.jsp";
		}
		
		// return 오류페이지
		return null;
	}

}
