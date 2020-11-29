package controller.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Application;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

public class ApplyListController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userId = Integer.parseInt(request.getParameter("userId"));
		
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