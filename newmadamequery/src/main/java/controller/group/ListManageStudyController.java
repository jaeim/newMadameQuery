package controller.group;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

public class ListManageStudyController implements Controller {

	//현지
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		int memberId = Integer.valueOf(request.getParameter("memberId"));
		
		try {
			ArrayList<StudyGroup> groupList = manager.getManageStudyGroupList(memberId);
			request.setAttribute("groupList", groupList);
		}catch(SQLException e) {
			return ""; // 실패, 오류관리페이지로 이동
		}
		
		//성공
		return "/manage/manage_main.jsp";
	}

}
