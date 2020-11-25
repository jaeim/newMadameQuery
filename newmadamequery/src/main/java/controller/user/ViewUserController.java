package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;

// 현지
public class ViewUserController implements Controller{

	@SuppressWarnings("static-access")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		UserSessionUtils utils = new UserSessionUtils();
		if(!utils.hasLogined(session)) {return "redirect:/user/login";}
		
		int userId = Integer.valueOf(utils.getLoginUserId(session));
		
		Manager manager = Manager.getInstance();
		User user;
		try {
			user = manager.findUser(userId);
		}catch(NotFoundException e) {
			return ""; //오류페이지
		}
		
		request.setAttribute("user", user);
		return "/user/myPage.jsp";
	}
}
