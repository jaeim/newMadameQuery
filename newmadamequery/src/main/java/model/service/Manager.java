package model.service;

import model.dao.*;

import java.sql.SQLException;
import java.util.List;

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
		if(memberDAO.existingUser(user.getMember_id(), user.getPassword())) {
			throw new ExistingException(user.getMember_id() + "는 존재하는 아이디임");
		}
		return memberDAO.userCreate(user);
	}
	
	public int updateUser(User user) throws SQLException, NotFoundException{
		// NotFoundException이 나는지 확인하기 위해 수행하는 코드
		findUser(user.getMember_id());
		
		return memberDAO.userInfoUpdate(user);
	}
	
	public User findUser(int userId) throws SQLException, NotFoundException {
			User user = memberDAO.findUser(userId);
			
			if (user == null) {
				throw new NotFoundException(userId + "는 존재하지 않는 아이디입니다.");
			}		
			return user;
	}
	
	public int createStudyGroup(StudyGroup group, int memberId) throws SQLException, ExistingException, NotFoundException{
		int r1;
		int r2;
		
		if(studyGroupDAO.existingGroup(group.get_id())) {
			throw new ExistingException(group.get_id() + "는 존재하는 groupId 입니다.");
		}
		findUser(memberId);
		
		r1 = studyGroupDAO.addGroup(group, memberId);
		r2 = studyGroupDAO.addMemberInGroupMember(group.get_id(), memberId, "1");
		
		if(r1 == 1 && r2 == 1)
			return 1;
		return 0;
	}
	
	public int removeStudyGroup(int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		// StudyGroup을 참조 하고 있는 테이블 레코드 전부 삭제
		studyGroupDAO.removeMemberInGroup(groupId, -1);
		studyGroupDAO.removeAllComment(groupId);
		studyGroupDAO.removeAllPost(groupId);
		studyGroupDAO.removeAllApply(groupId);
		
		return studyGroupDAO.removeGroup(groupId);
	}
	
	public int updateStudyGroup(StudyGroup group)  throws SQLException, NotFoundException {
		findGroup(group.get_id());
		
		return studyGroupDAO.updateGroup(group);
	}
	
	public StudyGroup findGroup(int groupId) throws SQLException, NotFoundException{
		StudyGroup group = studyGroupDAO.findGroup(groupId);
		
		if(group == null) {throw new NotFoundException();}
		
		return group;
	}
	
	public List<StudyGroup> searchStudyGroups (String name, int term, int numOfMem) throws SQLException, NotFoundException {
		List<StudyGroup> groupList = studyGroupDAO.searchGroupList(name, term, numOfMem);
	
		if(groupList == null) {throw new NotFoundException();}
		
		return groupList;
	}
	
	public List<User> getAllMemberInGroup (int groupId) throws SQLException, NotFoundException{
		findGroup(groupId);
		
		return studyGroupDAO.getAllMemberInGroup(groupId);
	}
	
	public int getNumberOfMemberInGroup(int groupId) throws SQLException, NotFoundException {
		findGroup(groupId);
		
		return studyGroupDAO.getNumberOfMember(groupId);
	}
	
	public int manageApplicationInGroup(int groupId, int userId, boolean approved) throws SQLException, NotFoundException{
		int result = studyGroupDAO.findApplication(groupId, userId);
		
		// 지원서에 없을 경우
		if(result != 1) {throw new NotFoundException();}		
		
		result = studyGroupDAO.manageApplication(groupId, userId, approved);
		if(approved) {
			result = studyGroupDAO.addMemberInGroupMember(groupId, userId, "0");
		}
		
		return result;
	}
	
	public int applyToGroup(int groupId, int userId) throws SQLException, NotFoundException {
		findGroup(groupId);
		findUser(userId);
		
		return studyGroupDAO.applyToGroup(groupId, userId);
	}
	
	
	public static void main(String args[]) {
		StudyGroup s = new StudyGroup();
		s.setGroupName("데베프팀");
		s.setNumberOfUsers(4);
		s.setDescription("데베프팀입니다");
		s.setTerm(1);
		s.setMeetingType("online");
		//createStudyGroup()
	}
}
