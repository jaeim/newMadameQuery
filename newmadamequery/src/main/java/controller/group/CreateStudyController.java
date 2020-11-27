package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.Subject;
import model.service.Manager;

// 재임 : Main.java test 완료
public class CreateStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("GET")) {
			Manager manager = Manager.getInstance();
			ArrayList<Subject> list = manager.getAllSubject();
			
			request.setAttribute("subjectList", list);
			System.out.println("과목은 가져옴.");
			return "/study/addStudygroup.jsp";
		}
		// post 방식 => 스터디 생성
		StudyGroup studyGroup = new StudyGroup(Integer.parseInt(request.getParameter("numberOfUsers")),
				request.getParameter("groupName").toString(), request.getParameter("description").toString(),
				Integer.parseInt(request.getParameter("term")), request.getParameter("meetingType").toString(),
				request.getParameter("genderType").toString(), request.getParameter("gradeType").toString(),
				Integer.parseInt(request.getParameter("subjectId")));
//		StudyGroup studyGroup = new StudyGroup(4, "데베프스터디", "데베프 스터디입니다.", 3, "online",
//				"0", "0", 1);
//		int userId = 201;
		System.out.println("새로운 객체는 생성됨.");
		try {
			Manager manager = Manager.getInstance();
//			manager.createStudyGroup(studyGroup, Integer.parseInt(request.getParameter("userId")));	
			// session을 통해 user의 PK 구함
			System.out.println("그룹이 아직 생성되기 전");
			HttpSession session = request.getSession();
			int userId = UserSessionUtils.getLoginUserId(session);
			
			manager.createStudyGroup(studyGroup, userId);
			System.out.println("그룹이 생성됨.");
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
