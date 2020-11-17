package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

public class ListStudyGroupController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		
		String email = (String) request.getSession().getAttribute("email");
		String password = (String) request.getSession().getAttribute("password");
		
		if(!manager.isLogin(email, password)) {
			return "redirect:/user/login.jsp ";
		}
		
		
		ArrayList<StudyGroup> groupList = manager.getAllStudyGroup();
		
		request.setAttribute("studyGroupList", groupList);
		
		return "/study/studygroup_list.jsp";
	}

}
