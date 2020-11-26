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
		//java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd"); 
	    //java.util.Date utilDate = df.parse(request.getParameter("birthday"));
		
		System.out.println(2222);
		User user = new User(
				request.getParameter("email"),
				request.getParameter("password"),
				request.getParameter("name"),
				request.getParameter("phone"),
				request.getParameter("university"),
				request.getParameter("department"),
				request.getParameter("grade"),
				Integer.parseInt(request.getParameter("gender")));

		try {
			System.out.println(3333);
			Manager manager = Manager.getInstance();
			manager.createUser(user);
		    return "/user/login.jsp";
		        
		} catch (ExistingException e) {
			System.out.println(4444);
	        request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/user_write.jsp";
		}
	}
	
}
