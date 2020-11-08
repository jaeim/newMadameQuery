package dao;
import java.text.SimpleDateFormat;

import model.StudyGroup;

public class StudyGroupDAO {

	StudyGroupDAO dao = new StudyGroupDAO();
	JDBCUtil util = null;
	public StudyGroupDAO() {
		util = new JDBCUtil();
	}
	
	public StudyGroupDAO getInstance() {
		return dao;
	}

	boolean removeGroup(String groupId) {
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
		return false;
		
	}
	
	boolean removeMemberInGroup(String groupId, String memberId) {
		int result = 0;
		String query = "DELETE FROM groupMember WHERE groupId=? and memberId=?";
	
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
		return false;
	}
	
	boolean updateGroup(StudyGroup group) {
		int result = 0;
		String query = "UPDATE studyGroup SET created_date=? and number_of_member=? "
				+ "and name=? and descroption=? and term=? and meeting_type=? "
				+"and gender_type=? and grade_type=? and subject_id=? and leader_id=? ";
		
		Object [] param = new Object[] {group.getCreatedDate(), group.getNumberOfUsers(),
				group.getGroupName(), group.getDescription(), group.getTerm(), group.getMeetingType()
				, group.getGenderType(), group.getGradeType(), group.getSubjectId(), group.getLeaderId()};
		
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
		return false;
	}
	
	boolean applyToGroup(String groupId, String userId) {
		int result = 0;
		String query = "INSERT INTO applyList (member_id, group_id, apply_date, isApproved) values(?, ?, ?, ?)";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String sDate = sdf.format(new java.util.Date());
		java.sql.Date date = java.sql.Date.valueOf(sDate);
		
		Object [] param = new Object[] {userId, groupId, date, 0};
		
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
		return false;
	}
	
	boolean manageApplication(String groupId, String userId, boolean approved) {
		int result = 0;
		String query;
		Object [] param;
		if(approved) {
			query = "UPDATE applyList SET isApproved=? and approved_date=?";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String sDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(sDate);
			
			param = new Object[] {1, date};
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
		return false;
	}
}
