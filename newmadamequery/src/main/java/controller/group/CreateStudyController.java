package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
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
		
		try {
			Manager manager = Manager.getInstance();
			manager.createStudyGroup(studyGroup, (int)(request.getAttribute("memberId")));
			
			return "redirect:/study/studygroup_list.jsp";
			
		} catch (Exception e) { // 예외 발생 시 입력 form으로 forwarding
			//회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 in /study/addStudygroup.jsp
			//alert(exception)
			request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("studyGroup", studyGroup);
			return "/study/addStudygroup.jsp";
		}
	}
	
}
