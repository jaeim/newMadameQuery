package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

//현지
public class ListStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		
//		String email = (String) request.getSession().getAttribute("email");
//		String password = (String) request.getSession().getAttribute("password");
//		
//		if(!manager.isLogin(email, password)) {
//			return "redirect:/user/login.jsp ";
//		}
//		
		Object object = request.getAttribute("errorResult");
		
		if(object != null) {
			request.setAttribute("errorResult", object.toString());
		}
		ArrayList<StudyGroup> groupList = manager.getAllStudyGroup();
		
		request.setAttribute("groupList", groupList);
		
		return "/study/studygroup_list.jsp";
	}

}
