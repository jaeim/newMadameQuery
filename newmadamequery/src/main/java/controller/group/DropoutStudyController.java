package controller.group;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.StudyGroup;
import model.service.DeleteException;
import model.service.Manager;
import model.service.NotFoundException;

public class DropoutStudyController implements Controller {

	// 현지
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception, DeleteException {
		// TODO Auto-generated method stub
		
		int groupId = Integer.valueOf(request.getParameter("groupId"));
		//int memberId = Integer.valueOf(request.getParameter("member_id"));
		int memberId = UserSessionUtils.getLoginUserId(request.getSession());
		
		Manager manager = Manager.getInstance();
		try {
			StudyGroup group = manager.findGroup(groupId);
			if(group.getLeaderId() == memberId) {
				System.out.println("팀장은 그룹에서 탈퇴할 수 없습니다.");
				throw new DeleteException("팀장은 그룹에서 탈퇴할 수 없습니다.");
			}else {
				manager.removeMemberInGroup(groupId, memberId);
			}
		}catch(Exception e) {
			if(e instanceof NotFoundException) {
				request.setAttribute("exception", "notFound");
			}
			if(e instanceof SQLException) {
				request.setAttribute("exception", "sqlException");
			}
			if(e instanceof DeleteException) {
				request.setAttribute("exception", "deleteException");
				request.setAttribute("groupList", manager.getMyStudyGroupList(memberId));
				return "/myStudy/myStudy_main.jsp";
			}
			
			return ""; //오류페이지 
			
		}
		request.setAttribute("groupList", manager.getMyStudyGroupList(memberId));
		return "/myStudy/myStudy_main.jsp";
	}
}