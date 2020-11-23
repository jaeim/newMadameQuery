package controller.group;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;

//현지
public class ListMyStudyController implements Controller {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		
		int memberId = Integer.valueOf(request.getParameter("member_id"));
		try {	
			ArrayList<StudyGroup> groupList = manager.getMyStudyGroupList(memberId);
			request.setAttribute("groupList", groupList);
		}catch(SQLException e) {
			return ""; //실패, 오류관리페이지로 이동
		}
		
		//성공
		return "/mystudy/mystudy_main.jsp";
	}

}
