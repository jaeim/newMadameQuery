package controller.group;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.Subject;
import model.User;
import model.service.Manager;

// 재임 : Main.java test 완료
public class CreateStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("GET")) {
			Manager manager = Manager.getInstance();
			ArrayList<Subject> list = manager.getAllSubject();
			
			request.setAttribute("subjectList", list);
			return "/study/addStudygroup.jsp";
		}
		
		Manager manager = Manager.getInstance();
		int memberId = UserSessionUtils.getLoginUserId(request.getSession());
		User user = manager.findUser(memberId);
		
		int genderType = Integer.valueOf(request.getParameter("genderType"));
		int gradeType = Integer.valueOf(request.getParameter("gradeType"));
		
		System.out.println("사용자 성별 : " + user.getGender());
		System.out.println("조건 성별 : " + genderType);
		try {
			if(genderType != 0) {
			// 성별조건이 상관없음도 아니고 팀장의 성별과 조건의 성별이 맞지 않는다면
				if(genderType != user.getGender()) {
					request.setAttribute("errorResult", "gender");
					return "/studyGroup/list";
				}
			}
		
			if(gradeType != 0 && gradeType > Integer.valueOf(user.getGrade())) {
				// 학년조건이 상관없음도 아니고 팀장의 학년과 조건의 학년이 맞지 않는다면
				request.setAttribute("errorResult", "grade");
				return "/studyGroup/list";
			}
		
		// post 방식 => 스터디 생성
		StudyGroup studyGroup = new StudyGroup(Integer.parseInt(request.getParameter("numberOfUsers")),
				request.getParameter("groupName").toString(), request.getParameter("description").toString(),
				Integer.parseInt(request.getParameter("term")), request.getParameter("meetingType").toString(),
				request.getParameter("genderType").toString(), request.getParameter("gradeType").toString(),
				Integer.parseInt(request.getParameter("subjectId")));

			
		HttpSession session = request.getSession();
		int userId = UserSessionUtils.getLoginUserId(session);
			
		manager.createStudyGroup(studyGroup, userId);
		return "/studyGroup/list";
			
		// 예외 발생 시 입력 form으로 forwarding
		
		}catch(Exception e) {
		
			request.setAttribute("exception", e);
			System.out.println(e.getMessage());
			return "/";
		}
	}
}
