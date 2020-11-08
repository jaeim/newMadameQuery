package dao;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.StudyGroup;
import model.User;

public class StudyGroupDAO {

	private static StudyGroupDAO dao = new StudyGroupDAO();
	JDBCUtil util = null;
	
	public StudyGroupDAO() {
		util = new JDBCUtil();
	}
	
	public StudyGroupDAO getInstance() {
		return dao;
	}

	// StudyGroup 삭제
	boolean removeGroup(int groupId) {
		//group을 참조하고 있는 모든 자식 레코드들 삭제해야함
		
		int result = 0;
		String query = "DELETE FROM studyGroup WHERE group_id=?";
		
		Object [] param = new Object[] {groupId};
		util.setSqlAndParameters(query, param);
		
		try {
			result = util.executeUpdate();
		}catch(Exception e) {
			util.rollback();
		}finally {
			util.commit();
			util.close();
		}
		if(result == 1) {
			System.out.println("1행 삭제 성공");
			return true;
		}
		System.out.println("삭제실패");
		return false;
		
	}
	
	// group에 속해 있는 member 삭제
	boolean removeMemberInGroup(int groupId, int memberId) {
		int result = 0;
		String query = "DELETE FROM groupMember WHERE group_id=? and member_id=?";
	
		Object [] param = new Object[] {groupId, memberId};
		util.setSqlAndParameters(query, param);
		
		try {
			result = util.executeUpdate();
		}catch(Exception e) {
			util.rollback();
		}finally {
			util.commit();
			util.close();
		}
		
		if(result == 1) { 
			System.out.println("1행 삭제 성공");
			return true; }
		System.out.println("삭제실패");
		return false;
	}
	
	// StudyGroup의 속성을 수정
	boolean updateGroup(StudyGroup group) {
		int result = 0;
		String query = "UPDATE studyGroup SET created_date=? , number_of_member=? "
				+ ", name=? , description=? , term=? , meeting_type=? "
				+", gender_type=? , grade_type=? , subject_id=? , leader_id=? "
				+ "WHERE group_id=?";
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(group.getCreatedDate().getTime());
		
		Object [] param = new Object[] {sqlDate, group.getNumberOfUsers(),
				group.getGroupName(), group.getDescription(), group.getTerm(), group.getMeetingType()
				, group.getGenderType(), group.getGradeType(), group.getSubjectId(), group.getLeaderId(), group.get_id()};
		
		util.setSqlAndParameters(query, param);
		try {
			result = util.executeUpdate();
		}catch(Exception e) {
			util.rollback();
		}finally {
			util.commit();
			util.close();
		}
		
		if(result == 1) { 
			System.out.println("1행 수정 성공");
			return true; }
		System.out.println("수정실패");
		return false;
	}
	
	boolean applyToGroup(int groupId, int userId) {
		int result = 0;
		String query = "INSERT INTO applyList (member_id, group_id, apply_date, isApproved) values(?, ?, ?, ?)";
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		Object [] param = new Object[] {userId, groupId, sqlDate, 0};
		
		util.setSqlAndParameters(query, param);
		
		try {
			result = util.executeUpdate();
		}catch(Exception e) {
			util.rollback();
		}finally {
			util.commit();
			util.close();
		}
		
		if(result == 1) { 
			System.out.println("1행 삽입 성공");
			return true; }
		System.out.println("삽입실패");
		return false;
	}
	
	boolean manageApplication(int groupId, int userId, boolean approved) {
		int result = 0;
		String query;
		Object [] param;
		if(approved) {
			query = "UPDATE applyList SET isApproved=? and approved_date=?";
			
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			
			param = new Object[] {1, sqlDate};
		}else {
			// 차라리 삭제를 할까?
			query = "UPDATE applyList SET isApproved=?";
			param = new Object[] {0};
		}
		
		util.setSqlAndParameters(query, param);
		
		try {
			result = util.executeUpdate();
		}catch(Exception e) {
			util.rollback();
		}finally {
			util.commit();
			util.close();
		}
		
		if(result == 1) { 
			System.out.println("1행 수정 성공");
			return true; }
		System.out.println("수정실패");
		return false;
	}
	
	ArrayList<User> getMemberList(String groupId){
		
		return null;
	}
	
	int getNumberOfMember(String groupId) {
		return -1;
	}
}
