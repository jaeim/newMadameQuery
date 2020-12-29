package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

//현지
public class SearchStudyController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String meeting_type = null;
		String gender_type = null;
		String grade_type = null;
		int term = 0;
		int numOfMem = 0;
		
		try {
			meeting_type = (String) request.getParameter("meetingType");
			gender_type = (String) request.getParameter("genderType");
			grade_type = (String) request.getParameter("gradeType");
			term = Integer.valueOf((String)request.getParameter("term"));
			numOfMem = Integer.valueOf((String)request.getParameter("numberOfUsers"));	
			
			Manager manager = Manager.getInstance();
			ArrayList<StudyGroup> groupList = manager.searchStudyGroups(term, numOfMem, meeting_type, gender_type, grade_type);
			
			request.setAttribute("groupList", groupList);
			request.setAttribute("meetingType", meeting_type);
			request.setAttribute("genderType", gender_type);
			request.setAttribute("gradeType", grade_type);
			request.setAttribute("term", term);
			request.setAttribute("num", numOfMem);

			return "/study/searchStudygroup.jsp";
		} catch (Exception e) {
			request.setAttribute("meetingType", meeting_type);
			request.setAttribute("genderType", gender_type);
			request.setAttribute("gradeType", grade_type);
			request.setAttribute("term", term);
			request.setAttribute("num", numOfMem);
			
			request.setAttribute("searchFailed", true);
			request.setAttribute("exception", e);
			return "/study/searchStudygroup.jsp";
		}
		
	}

}
