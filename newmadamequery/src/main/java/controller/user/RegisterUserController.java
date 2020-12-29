package controller.user;

import java.util.Calendar;
import java.util.Date;

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
		request.setCharacterEncoding("UTF-8");

		String dob_string = request.getParameter("dob");
		String [] date = dob_string.split("/");
		
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, Integer.valueOf(date[0]));
		c.set(Calendar.MONTH, Integer.valueOf(date[1]) - 1);
		c.set(Calendar.DATE, Integer.valueOf(date[2]));
		Date dob = c.getTime();
		
		User user = new User(
				request.getParameter("email"),
				request.getParameter("password"),
				request.getParameter("name"),
				dob,
				request.getParameter("phone"),
				request.getParameter("university"),
				request.getParameter("department"),
				request.getParameter("grade"),
				Integer.parseInt(request.getParameter("gender")));

		try {
			Manager manager = Manager.getInstance();
			manager.createUser(user);
		    return "redirect:/user/login";
		        
		} catch (ExistingException e) {
	        request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/user_write.jsp";
		}
	}
	
}
