package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.User;
import model.service.Manager;

public class GoToHomeController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int memberId = Integer.valueOf(request.getParameter("memberId"));
		
		Manager manager = Manager.getInstance();
		User user = manager.findUser(memberId);
		
		request.setAttribute("user", user);
		return "/user/mainPage.jsp";
	}
}
