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
		
		// 파라미터를 다 못찾는상황...
		String meeting_type = (String) request.getAttribute("meetingType");
		String gender_type = (String) request.getAttribute("genderType");
		String grade_type = (String) request.getAttribute("gradeType");
		int term = Integer.valueOf((String)request.getAttribute("term"));
		//int numOfMem = Integer.valueOf((String)request.getAttribute("numOfMem"));
		int numOfMem = -1;
		
		
		Manager manager = Manager.getInstance();
		ArrayList<StudyGroup> groupList = manager.searchStudyGroups(term, numOfMem, meeting_type, gender_type, grade_type);
		
		request.setAttribute("groupList", groupList);
		return "/study/searchResult.jsp";
	}

}
