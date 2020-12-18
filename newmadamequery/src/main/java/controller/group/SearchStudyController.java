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
		// TODO Auto-generated method stub
		try {
			String meeting_type = (String) request.getParameter("meetingType");
			String gender_type = (String) request.getParameter("genderType");
			String grade_type = (String) request.getParameter("gradeType");
			int term = Integer.valueOf((String)request.getParameter("term"));
			int numOfMem = Integer.valueOf((String)request.getParameter("numberOfUsers"));	
			
			Manager manager = Manager.getInstance();
			ArrayList<StudyGroup> groupList = manager.searchStudyGroups(term, numOfMem, meeting_type, gender_type, grade_type);
			
			request.setAttribute("groupList", groupList);

			return "/study/searchResult.jsp";
		} catch (Exception e) {
			request.setAttribute("searchFailed", true);
			request.setAttribute("exception", e);
			return "/study/searchResult.jsp";
		}
		
	}

}
