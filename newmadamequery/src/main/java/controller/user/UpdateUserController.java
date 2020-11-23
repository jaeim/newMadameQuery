package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.User;
import model.service.Manager;

public class UpdateUserController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 수정 form 요청	
    		int updateId = Integer.parseInt(request.getParameter("userId"));
    		
    		Manager manager = Manager.getInstance();
			User user = (User) manager.findUser(updateId);	// 수정하려는 사용자 정보 검색
			request.setAttribute("user", user);			

			HttpSession session = request.getSession();
//			if (UserSessionUtils.isLoginUser(updateId, session) || UserSessionUtils.isLoginUser("admin", session)) {
//				return "/user/updateForm.jsp";
//			}    
		
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("타인의 정보는 수정할 수 없습니다."));            
			return "/user/myPage.jsp";
	    }	
    	
    	// POST request (회원정보가 parameter로 전송됨)
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd"); 
	    java.util.Date dob = df.parse(request.getParameter("birthday"));
		
		User updateUser = new User(
				Integer.parseInt(request.getParameter("userId")),
				request.getParameter("password"),
				request.getParameter("name"),
				dob,
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("university"),
				request.getParameter("department"),
				request.getParameter("grade"),
				Integer.parseInt(request.getParameter("gender")));

		Manager manager = Manager.getInstance();
		manager.updateUser(updateUser);	
        return "redirect:/user/mainPage";	
	}

}
