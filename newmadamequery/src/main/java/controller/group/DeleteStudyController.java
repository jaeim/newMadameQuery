package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;
import model.service.RemoveException;
//현지
public class DeleteStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Manager manager = Manager.getInstance();
		
		// groupId로 studyGroup 삭제
		int groupId = Integer.valueOf((String)request.getParameter("groupId"));
		int result = manager.removeStudyGroup(groupId);
		
		request.setAttribute("result", result); // 삭제결과를 저장
		return "redirect:/manage/manage_main.jsp";
	}

}
