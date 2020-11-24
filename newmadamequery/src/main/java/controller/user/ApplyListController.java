package controller.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

public class ApplyListController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			Manager manager = Manager.getInstance();
			ArrayList<User> applyList = manager.getApplyList();
			request.setAttribute("applyList", applyList);

			return "redirect:/studyGroup/myStudy";
		} catch (NotFoundException e) {
			request.setAttribute("Failed", true);
			request.setAttribute("exception", e);

			return "/mystudy/mystudy_main.jsp";
		}

	}

}