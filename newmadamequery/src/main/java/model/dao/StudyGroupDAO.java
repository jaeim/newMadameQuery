package model.dao;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.StudyGroup;
import model.User;
import model.service.AppException;


public class StudyGroupDAO {

	private static StudyGroupDAO dao = new StudyGroupDAO();
	JDBCUtil jdbcUtil = null;
	
	private StudyGroupDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public static StudyGroupDAO getInstance() {
		return dao;
	}
	
	//스터디 그룹 생성
	public int addGroup(StudyGroup s, User user) throws SQLException{
			
		String query = "INSERT INTO STUDYGROUP(name, description, number_of_members, term, meeting_type, gendertype, leader_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {s.getGroupName(), s.getDescription(), s.getNumberOfUsers(), 
					s.getTerm(), s.getMeetingType(), s.getGenderType(), user.getUserId()};
			
		jdbcUtil.setSqlAndParameters(query, param);
		int result = 0;	
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch (Exception ex) {
			//if(ex instanceof AppException)
				//추가 할 코드가 있다면 정의
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();	
		}		
		return result;
	}
	
	public int removeAllPost(int groupId) throws SQLException {
		int result = 0;
		String query = "DELETE FROM post WHERE group_id = ?";
		Object [] param = new Object[] {groupId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();
		}
		
		return result;	
	}
	
	public int removeAllComment(int groupId) {
		int result = 0;
		
		//COMMT 테이블에 group_id 컬럼이 존재하지 않음
		String query = "DELETE FROM commt WHERE group_id=?";
		Object [] param = new Object[] {groupId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public int removeAllApply(int groupId) {
		int result = 0;
		String query = "DELETE FROM applylist WHERE group_id=?";
		
		Object [] param = new Object[] {groupId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}

		return result;
	}
	
	// StudyGroup 삭제
	public int removeGroup(int groupId) throws SQLException {
		//group을 참조하고 있는 모든 자식 레코드들 삭제해야함
		
//		// group에 속한 모든 멤버삭제
//		int sub = removeMemberInGroup(groupId, -1);
//		System.out.println(sub + "개의 그룹멤버 삭제");
//		
//		//group의 게시물에 달린 모든 댓글 삭제
//		sub = removeAllComment(groupId);
//		System.out.println(sub + "개의 댓글 삭제");
//		
//		// group에서 게시된 모든 게시물 삭제
//		sub = removeAllPost(groupId);
//		System.out.println(sub + "개의 게시글 삭제");
//		//
//		// group에 지원한 모든 지원서 삭제
//		sub = removeAllApply(groupId);
//		System.out.println(sub + "개의 지원서 삭제");
		
		int result = 0;
		String query = "DELETE FROM studyGroup WHERE group_id=?";
		
		Object [] param = new Object[] {groupId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	// group에 속해 있는 member 삭제
	public int removeMemberInGroup(int groupId, int memberId) {
		int result = 0;
		String query;
		Object [] param;
		if(memberId == -1) { // group내 모든 멤버 삭제
			query = "DELETE FROM groupMember WHERE group_id=?";
			param = new Object[] {groupId};
		}else {
			query = "DELETE FROM groupMember WHERE group_id=? and member_id=?";
			param = new Object[] {groupId, memberId};
		}
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();} 
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	// StudyGroup의 속성을 수정
	public int updateGroup(StudyGroup group) {
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
		
		jdbcUtil.setSqlAndParameters(query, param);
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public int applyToGroup(int groupId, int userId) {
		int result = 0;
		String query = "INSERT INTO applyList (member_id, group_id, apply_date, isApproved) values(?, ?, ?, ?)";
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		Object [] param = new Object[] {userId, groupId, sqlDate, 0};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public int manageApplication(int groupId, int userId, boolean approved) {
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
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	//스터디그룹 목록 조회
	public List<StudyGroup> getGroupList() throws SQLException {
		String query = "SELECT group_id, created_date, number_of_member, name, description, term, "
					+ "meeting_type, gender_type, grade_type, subject_id, leader_id FROM studygroup ORDER BY name";
		jdbcUtil.setSqlAndParameters(query, null);
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			
			List<StudyGroup> groupList = new ArrayList<StudyGroup>();
			
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
					
				group.set_id(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setGroupName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setTerm(rs.getInt("term"));
				group.setMeetingType(rs.getInt("meeting_type"));
				group.setGenderType(rs.getInt("gender_type"));
				group.setGradeType(rs.getInt("grade_type"));
				group.setRefSubject(rs.getInt("subject_id"));
				group.setRefLeader(rs.getInt("leader_id"));;
					 
				groupList.add(group);
			}
			jdbcUtil.commit();
			return groupList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
			
		return null;
	}
			
	//스터디그룹 검색 -> 과목이름, 인원, 기간으로 검색
	public List<StudyGroup> searchGroupList(String name, int term, int numOfMem) throws SQLException {
		String query = "SELECT group_id, created_date, number_of_member, name, description, term, "
				+ "meeting_type, gender_type, grade_type, subject_id, leader_id FROM studygroup "
				+ "WHERE name=? AND term=? AND number_of_member=? ORDER BY name";
		Object[] param = new Object[] {name, term, numOfMem};
			
		jdbcUtil.setSqlAndParameters(query, param);
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			List<StudyGroup> groupList = new ArrayList<StudyGroup>();
				
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
					
				group.set_id(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setGroupName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setTerm(rs.getInt("term"));
				group.setMeetingType(rs.getInt("meeting_type"));
				group.setGenderType(rs.getInt("gender_type"));
				group.setGradeType(rs.getInt("grade_type"));
				group.setRefSubject(rs.getInt("subject_id"));
				group.setRefLeader(rs.getInt("leader_id"));
				
				groupList.add(group);
			}
			jdbcUtil.commit();
			return groupList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
			
		return null;
	}
	
	public ArrayList<User> getMemberList(String groupId){
		
		return null;
	}
	
	public int getNumberOfMember(String groupId) {
		return -1;
	}
	
	public StudyGroup findGroup(int groupId) {
		StudyGroup group;
		
		return null;
	}
	
	public boolean existingGroup(int groupId) {
		String query = "SELECT * FROM StudyGroup WHERE group_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {groupId});
		
		int result = 0;
		try {			
			result = jdbcUtil.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		
		if(result == 1) return true;
		return false;
	}
}
