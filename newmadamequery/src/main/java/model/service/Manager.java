package model.service;

import model.dao.*;

import java.sql.SQLException;

import model.StudyGroup;
import model.User;


public class Manager {
	
	private static Manager manager = new Manager();
	private MemberDAO memberDAO;
	private StudyGroupDAO studyGroupDAO;
	private PostDAO postDAO;
	private CommentDAO commentDAO;
	private SubjectDAO subjectDAO;
	
	private Manager() {
		try {
			memberDAO = MemberDAO.getInstance();
			studyGroupDAO = StudyGroupDAO.getInstance();
			postDAO = PostDAO.getInstance();
			commentDAO = CommentDAO.getInstance();
			subjectDAO = SubjectDAO.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Manager getInstance() {
		return manager;
	}
	
	public int createUser(User user) throws SQLException, ExistingException{
		if(memberDAO.existingUser(user.getUserId(), user.getPassword())) {
			throw new ExistingException(user.getUserId() + "는 존재하는 아이디임");
		}
		return memberDAO.userCreate(user);
	}
	
	public int updateUser(User user) throws SQLException, NotFoundException{
		// NotFoundException이 나는지 확인하기 위해 수행하는 코드
		findUser(user.getUserId());
		
		return memberDAO.userInfoUpdate(user);
	}
	
	public User findUser(String userId) throws SQLException, NotFoundException {
			User user = memberDAO.findUser(userId);
			
			if (user == null) {
				throw new NotFoundException(userId + "는 존재하지 않는 아이디입니다.");
			}		
			return user;
	}
	
	public int createStudyGroup(StudyGroup group, User user) throws SQLException, ExistingException{
		if(studyGroupDAO.existingGroup(group.get_id())) {
			throw new ExistingException(group.get_id() + "는 존재하는 groupId 입니다.");
		}
		
		return studyGroupDAO.addGroup(group, user);
	}
	
	public int removeStudyGroup(int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		studyGroupDAO.removeMemberInGroup(groupId, -1);
		studyGroupDAO.removeAllComment(groupId);
		studyGroupDAO.removeAllPost(groupId);
		studyGroupDAO.removeAllApply(groupId);
		
		return studyGroupDAO.removeGroup(groupId);
	}
}
