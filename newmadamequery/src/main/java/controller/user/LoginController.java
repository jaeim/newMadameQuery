package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.User;
import model.service.Manager;
import model.service.NotFoundException;
import model.service.PasswordMismatchException;

// 현지
public class LoginController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			Manager manager = Manager.getInstance();
			manager.login(email, password);
			
			User user = manager.findUser(email);
			HttpSession session = request.getSession();
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, user.getMember_id());
            
            return "redirect:/user/list";			
		} catch (Exception e) {
			if(e instanceof NotFoundException) {request.setAttribute("notFound", true);}
			if(e instanceof PasswordMismatchException) {request.setAttribute("passwordMismatch", true);}
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/loginForm.jsp";			
		} 
    }
}
