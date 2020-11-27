package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Application;
import model.StudyGroup;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

public class ViewManageStudyController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		
		int groupId = Integer.valueOf(request.getParameter("groupId"));
		StudyGroup group;
		ArrayList<Application> applyList;
		//ArrayList<User> groupMemberList;
		try {
			group = manager.findGroup(groupId);
			applyList = manager.getAllApplication(groupId);
			//groupMemberList = manager.getAllMemberInGroup(groupId);
		}catch(NotFoundException e) {
			return ""; //오류페이지로 이동
		}
		
		request.setAttribute("studyGroup", group);
		request.setAttribute("applyList", applyList);
		//request.setAttribute("groupMemberList", groupMemberList);
		
		return "/manage/manage_view.jsp";
	}
}
