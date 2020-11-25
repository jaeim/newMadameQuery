package controller.group;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.Manager;
import model.service.NotFoundException;

public class DropoutStudyController implements Controller {

	// 현지
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int groupId = Integer.valueOf(request.getParameter("groupId"));
		int memberId = Integer.valueOf(request.getParameter("member_id"));
		
		Manager manager = Manager.getInstance();
		try {
			manager.removeMemberInGroup(groupId, memberId);
		}catch(Exception e) {
			if(e instanceof NotFoundException) {
				request.setAttribute("exception", "notFound");
			}
			if(e instanceof SQLException) {
				request.setAttribute("exception", "sqlException");
			}
			
			return ""; //오류페이지 
		}
		return null;
	}
}