package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.User;
import model.service.ExistingException;
import model.service.Manager;

public class RegisterUserController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd"); 
	    java.util.Date utilDate = df.parse(request.getParameter("birthday"));
		
		User user = new User(
				Integer.parseInt(request.getParameter("userId")),
				request.getParameter("password"),
				request.getParameter("name"),
				utilDate,
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("university"),
				request.getParameter("department"),
				request.getParameter("grade"),
				Integer.parseInt(request.getParameter("gender")));

		try {
			Manager manager = Manager.getInstance();
			manager.createUser(user);
		    return "redirect:/user/list";	// 성공 시 사용자 리스트 화면으로 redirect
		        
		} catch (ExistingException e) {	// 예외 발생 시 회원가입 form으로 forwarding
	        request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/registerForm.jsp";
		}
	}
	
}
