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

			// 이메일을 파라미터로 받아야함
			String email = request.getParameter("email");
			// int updateId = Integer.parseInt(request.getParameter("userId"));

			Manager manager = Manager.getInstance();
			// memberId를 setAttribute로 보내야함
			User user = (User) manager.findUser((int)(request.getAttribute("memberId")));
			request.setAttribute("user", user);

			HttpSession session = request.getSession();
			// 로그인할때 이메일 사용하니까 이메일을 매개변수로 보냄
			if (UserSessionUtils.isLoginUser(email, session) || UserSessionUtils.isLoginUser("admin", session)) {
				return "/user/updateForm.jsp";
			}

			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", new IllegalStateException("타인의 정보는 수정할 수 없습니다."));
			return "/user/myPage.jsp";
		}

		// POST request (회원정보가 parameter로 전송됨)
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd");
		java.util.Date dob = df.parse(request.getParameter("birthday"));

		User updateUser = new User(
				request.getParameter("email"), 
				request.getParameter("password"),
				request.getParameter("name"), 
				dob, 
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