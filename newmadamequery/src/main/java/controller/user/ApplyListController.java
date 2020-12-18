package controller.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.Application;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

public class ApplyListController implements Controller {
	@SuppressWarnings("static-access")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		UserSessionUtils utils = new UserSessionUtils();
		if(!utils.hasLogined(session)) {return "redirect:/user/login";} //로그인이 되어 있지 않다면 로그인 페이지로 이동
		
		int userId = Integer.valueOf(utils.getLoginUserId(session));
		
		try {
			Manager manager = Manager.getInstance();
			ArrayList<Application> applyList = manager.getApplyList(userId);
			request.setAttribute("applyList", applyList);

			return "/user/myApplication.jsp";
		} catch (NotFoundException e) {
			request.setAttribute("Failed", true);
			request.setAttribute("exception", e);

			return "/myStudy/mystudy_main.jsp";
		}

	}

}