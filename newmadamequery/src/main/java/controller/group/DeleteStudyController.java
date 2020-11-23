package controller.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;

// 재임 : Main.java test 완료
public class DeleteStudyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deleteId = request.getAttribute("groupId").toString();
		
		try {
			Manager manager = Manager.getInstance();
			manager.removeStudyGroup(Integer.parseInt(deleteId));
			// 성공시 다시 (팀장)스터디 그룹 목록화면으로 redirect
			return "redirect:/studyGroup/manageStudy";
			
		} catch (Exception e) { // 예외 발생시 다시 manage_main.jsp로 forwarding
			//alert(exception)
			request.setAttribute("exception", e);
			return "/manage/manage_main.jsp";
		}
		
	}
	
//import model.service.RemoveException;
////현지
//public class DeleteStudyController implements Controller {
//
//	@Override
//	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// TODO Auto-generated method stub
//		Manager manager = Manager.getInstance();
//		
//		// groupId로 studyGroup 삭제
//		int groupId = Integer.valueOf((String)request.getParameter("groupId"));
//		int result = manager.removeStudyGroup(groupId);
//		
//		request.setAttribute("result", result); // 삭제결과를 저장
//		return "redirect:/manage/manage_main.jsp";
//	}

}
