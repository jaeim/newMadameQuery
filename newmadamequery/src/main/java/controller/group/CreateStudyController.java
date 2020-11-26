package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.service.Manager;

// 재임 : Main.java test 완료
public class CreateStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudyGroup studyGroup = new StudyGroup(Integer.parseInt(request.getParameter("numberOfUsers")),
				request.getParameter("groupName").toString(), request.getParameter("description").toString(),
				Integer.parseInt(request.getParameter("term")), request.getParameter("meetingType").toString(),
				request.getParameter("genderType").toString(), request.getParameter("gradeType").toString(),
				Integer.parseInt(request.getParameter("subjectId")));
//		StudyGroup studyGroup = new StudyGroup(4, "데베프스터디", "데베프 스터디입니다.", 3, "online",
//				"0", "0", 1);
//		int userId = 201;
		try {
			Manager manager = Manager.getInstance();
//			manager.createStudyGroup(studyGroup, Integer.parseInt(request.getParameter("userId")));	
			// session을 통해 user의 PK 구함
			HttpSession session = request.getSession();
			int userId = UserSessionUtils.getLoginUserId(session);
			manager.createStudyGroup(studyGroup, userId);
			
			return "redirect:/studyGroup/list";
			
		} catch (Exception e) { // 예외 발생 시 입력 form으로 forwarding
			//실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/addStudygroup.jsp
			//alert(exception)
			request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("studyGroup", studyGroup);
			return "/study/addStudygroup.jsp";
		}
	}
	
}
