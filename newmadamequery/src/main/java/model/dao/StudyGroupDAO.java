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
	public int addGroup(StudyGroup s, int memberId) throws SQLException{
		int result = 0;
		int key = 0;
		String query1 = "INSERT INTO STUDYGROUP "
					+ "VALUES (sequence_studygroup.nextval, SYSDATE, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String query2 = "SELECT SEQUENCE_STUDYGROUP.CURRVAL as group_id FROM DUAL";
		ResultSet rs = null;

		Object[] param = new Object[] {s.getNumberOfUsers(), s.getGroupName(), s.getDescription(),
				s.getTerm(), s.getMeetingType(), s.getGenderType(), s.getGradeType(), s.getSubjectId(), memberId};
		Object[] param2 = new Object[] {};
		try {
			jdbcUtil.setSqlAndParameters(query1, param);
			result = jdbcUtil.executeUpdate();
			if(result != 1) {throw new AppException();}
			
			jdbcUtil.setSqlAndParameters(query2, param2);
			rs = jdbcUtil.executeQuery();
			if(rs.next()) {
				key = rs.getInt("group_id");
			}
			
			jdbcUtil.commit();
		}catch (Exception ex) {
			//if(ex instanceof AppException)
				//추가 할 코드가 있다면 정의
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();	
		}		
		return key;
	}
	
	public int addMemberInGroupMember(int group_id, int member_id, String isLeader) {
		String query = "insert into GROUPMEMBER values(?, ?, ?)";
		
		Object [] param = new Object[] {member_id, group_id, isLeader};
		
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
	
	
	public int removeAllApply(int groupId) {
		int result = 0;
		String query = "DELETE FROM applylist WHERE group_id=?";
		
		Object [] param = new Object[] {groupId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
//			if(result != 1) {throw new AppException();}
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
		
		int result = 0;
		String query = "DELETE FROM studyGroup WHERE group_id=?";
		
		Object [] param = new Object[] {groupId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
//			if(result != 1) {throw new AppException();}
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
//			if(result != 1) {throw new AppException();} 
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	// StudyGroup의 속성을 수정 (StudyGroup을 수정 할 때 group_id와 created_date는 변경될 수 없다.)
	public int updateGroup(StudyGroup group) {
		int result = 0;
		String query = "UPDATE studyGroup SET number_of_member=? "
				+ ", name=? , description=? , term=? , meeting_type=? "
				+", gender_type=? , grade_type=? , subject_id=? , leader_id=? "
				+ "WHERE group_id=?";
			
		Object [] param = new Object[] {group.getNumberOfUsers(),
				group.getGroupName(), group.getDescription(), group.getTerm(), group.getMeetingType()
				, group.getGenderType(), group.getGradeType(), group.getSubjectId(), group.getLeaderId(), group.getGroupId()};
		
		jdbcUtil.setSqlAndParameters(query, param);
		try {
			result = jdbcUtil.executeUpdate();
//			if(result != 1) {throw new AppException();}
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
		String query = "INSERT INTO applyList (member_id, group_id, apply_date, isApproved) values(?, ?, SYSDATE, ?)";
		
		Object [] param = new Object[] {userId, groupId, "0"};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
//			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public int findApplication(int groupId, int userId) {
		int result = 0;
		String query = "select * from applyList where group_id=? and member_id=?";
		
		ResultSet rs = null;
		Object [] param = new Object[] {groupId, userId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			rs = jdbcUtil.executeQuery();
			if(rs == null)
				result = 0;
			result = 1;
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	// 지원서 리스트
	
	public int manageApplication(int groupId, int userId, boolean approved) {
		int result = 0;
		String query;
		Object [] param;
		if(approved) {
			query = "UPDATE applyList SET isApproved=?, approved_date=SYSDATE where member_id=? and group_id=?";
			param = new Object[] {"1", userId, groupId};
		}else {
			// 차라리 삭제를 할까?
			query = "UPDATE applyList SET isApproved=? where member_id=? and group_id=?";
			param = new Object[] {"0", userId, groupId};
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
	
	//모든 스터디그룹 목록 조회
	public ArrayList<StudyGroup> getGroupList() throws SQLException {
		String query = "SELECT group_id, created_date, number_of_member, name, description, term, "
					+ "meeting_type, gender_type, grade_type, subject_id, leader_id FROM studygroup ORDER BY name";
		jdbcUtil.setSqlAndParameters(query, null);
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			
			ArrayList<StudyGroup> groupList = new ArrayList<StudyGroup>();
			
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
					
				group.setGroupId(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setGroupName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setTerm(rs.getInt("term"));
				group.setMeetingType(rs.getString("meeting_type"));
				group.setGenderType(rs.getString("gender_type"));
				group.setGradeType(rs.getString("grade_type"));
				group.setSubjectId(rs.getInt("subject_id"));
				group.setLeaderId(rs.getInt("leader_id"));;
					 
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
	
	// 나의 스터디그룹 아이디 조회 (팀원)
	public ArrayList<Integer> getMyGroupIdList(int memberId) throws SQLException {
		String query = "SELECT * FROM groupmember WHERE member_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {memberId});
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			
			ArrayList<Integer> groupIdList = new ArrayList<Integer>();
			
			while (rs.next()) {
				int id = rs.getInt("group_id");
				
				groupIdList.add(id);
			}
			jdbcUtil.commit();
			return groupIdList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
			
		return null;
	}
	
	// 내가 관리하는 스터디그룹 아이디 조회 (팀장)
	public ArrayList<Integer> getManageGroupIdList(int memberId) throws SQLException {
		String query = "SELECT * FROM groupmember WHERE member_id=? and isleader=1";
		jdbcUtil.setSqlAndParameters(query, new Object[] {memberId});
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			
			ArrayList<Integer> groupIdList = new ArrayList<Integer>();
			
			while (rs.next()) {
				int id = rs.getInt("group_id");
				
				groupIdList.add(id);
			}
			jdbcUtil.commit();
			return groupIdList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
			
		return null;
	}
			
	//스터디그룹 검색 -> 과목이름, 인원, 기간으로 검색
	public ArrayList<StudyGroup> searchGroupList(String name, int term, int numOfMem) throws SQLException {
		String query = "SELECT group_id, created_date, number_of_member, name, description, term, "
				+ "meeting_type, gender_type, grade_type, subject_id, leader_id FROM studygroup "
				+ "WHERE name=? AND term=? AND number_of_member=? ORDER BY name";
		Object[] param = new Object[] {name, term, numOfMem};
			
		jdbcUtil.setSqlAndParameters(query, param);
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			ArrayList<StudyGroup> groupList = new ArrayList<StudyGroup>();
				
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
					
				group.setGroupId(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setGroupName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setTerm(rs.getInt("term"));
				group.setMeetingType(rs.getString("meeting_type"));
				group.setGenderType(rs.getString("gender_type"));
				group.setGradeType(rs.getString("grade_type"));
				group.setSubjectId(rs.getInt("subject_id"));
				group.setLeaderId(rs.getInt("leader_id"));
				
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
	
	public ArrayList<User> getAllMemberInGroup(int groupId){
		String query = "SELECT * from GROUPMEMBER gm, MEMBER m "
				+ "where gm.member_id = m.member_id and gm.group_id=?";
		Object[] param = new Object[] {groupId};
			
		jdbcUtil.setSqlAndParameters(query, param);
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			ArrayList<User> memberList = new ArrayList<User>();
				
			while (rs.next()) {
				User member = new User();
				member.setMember_id(rs.getInt("member_id"));
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setUniversity(rs.getString("univ"));
				member.setDepartment(rs.getString("dep"));
				member.setGrade(rs.getString("grade"));
				
				memberList.add(member);
			}
			jdbcUtil.commit();
			return memberList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
			
		return null;
	}
	
	public int getNumberOfMember(int groupId) {
		int result = 0;
		String query = "select count(*) as count from GROUPMEMBER where group_id=?";
		
		ResultSet rs = null;
		Object [] param = new Object[] {groupId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			rs = jdbcUtil.executeQuery();
			if(rs.next()){
				result = rs.getInt("count");
			}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public StudyGroup findGroup(int groupId) {
		StudyGroup group = null;
		String query = "select * from STUDYGROUP where group_id=?";
		
		ResultSet rs = null;
		Object [] param = new Object[] {groupId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			rs = jdbcUtil.executeQuery();
			if(rs.next()){
				group = new StudyGroup();
				
				group.setGroupId(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setGroupName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setTerm(rs.getInt("term"));
				group.setMeetingType(rs.getString("meeting_type"));
				group.setGenderType(rs.getString("gender_type"));
				group.setGradeType(rs.getString("grade_type"));
				group.setSubjectId(rs.getInt("subject_id"));
				group.setLeaderId(rs.getInt("leader_id"));;
			}
			jdbcUtil.commit();
		}catch(Exception e) {
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		
		
		return group;
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
