package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.StudyGroup;
import model.service.Manager;
import model.service.NotFoundException;

// 현지
public class ViewStudyController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int groupId = Integer.valueOf(request.getParameter("groupId"));
		String result = request.getParameter("result");
		Manager manager = Manager.getInstance();
		
		StudyGroup group = null;
		try {
			group = manager.findGroup(groupId);
		}catch(NotFoundException e) {
			return ""; // 오류페이지로 이동
		}
		
		request.setAttribute("StudyGroup", group);
		if(result == null) {
			return "/study/studygroup_view.jsp";
		}else {
			return "/study/studygroup_view.jsp?result=" + result;
		}
	}
}
