package controller.group;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.service.Manager;

public class ListManageStudyController implements Controller {

	//현지
	@SuppressWarnings("static-access")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserSessionUtils utils = new UserSessionUtils();
		if(!utils.hasLogined(session)) {return "redirect:/user/login";} //로그인이 되어 있지 않다면 로그인 페이지로 이동
		
		int userId = Integer.valueOf(utils.getLoginUserId(session));
		
		Manager manager = Manager.getInstance();
		try {
			ArrayList<StudyGroup> groupList = manager.getManageStudyGroupList(userId);
			request.setAttribute("groupList", groupList);
		}catch(SQLException e) {
			return "/"; // 실패, 오류관리페이지로 이동
		}
		
		//성공
		return "/manage/manage_main.jsp";
	}

}
