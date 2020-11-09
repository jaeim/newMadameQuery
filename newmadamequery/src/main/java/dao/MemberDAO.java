//
//package dao;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import model.StudyGroup;
//import model.User;
//
//public class MemberDAO {
//	
//	private static MemberDAO md = new MemberDAO();
//	private JDBCUtil jdbcUtil = null;
//	
//	public MemberDAO() {
//		jdbcUtil = new JDBCUtil();
//	}
//	public static MemberDAO getInstance() {
//		return md;
//	}
//	
//	//회원가입 (새로운 user 추가)
//	public int userCreate(User user) throws SQLException {
//		
//		String query = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//		Object[] param = new Object[] {user.getUserId(), user.getPassword(), user.getEmail(), user.getPhone(),
//				user.getUniversity(), user.getDepartment(), user.getGrade()};
//		
//		jdbcUtil.setSqlAndParameters(query, param);
//		try {
//			int result = jdbcUtil.executeUpdate();
//			return result;
//		}catch (Exception ex) {
//			jdbcUtil.rollback();
//			ex.printStackTrace();
//		} finally {		
//			jdbcUtil.commit();
//			jdbcUtil.close();	
//		}		
//		return 0;
//	}
//	//로그인 (userId에 해당하는 사용자가 존재하는지 검사)
//	public boolean existingUser(String userId, String password) throws SQLException{
//		
//		String query = "SELECT count(*) FROM MEMBER WHERE email=?, password=?";
//		jdbcUtil.setSqlAndParameters(query, new Object[] {userId, password});
//		
//		try {
//			
//			ResultSet rs = jdbcUtil.executeQuery();
//			while(rs.next()) {
//				int count = rs.getInt(1);
//				return (count == 1 ? true : false);
//			}
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			jdbcUtil.close();
//		}
//		return false;
//	}
//	
//	//회원정보 수정 
//	//-1 사용자의 정보 가져오기
//	public User findUser(String userId) throws SQLException{
//		
//		//String userId, String password, String name, String email, String phone, String university,
//		//String department, int grade
//		String query = "SELECT password, name, email, phone, university, department, grade"
//				+ "FROM MEMBER "
//				+ "WHERE member_id =? ";
//		
//		jdbcUtil.setSqlAndParameters(query, new Object[] {userId});
//		
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();
//			while(rs.next()) {
//				User user = new User(
//						userId,
//						rs.getString("password"),
//						rs.getString("name"),
//						rs.getString("email"),
//						rs.getString("phone"),
//						rs.getString("university"),
//						rs.getString("department"),
//						rs.getInt("grade"));
//				return user;
//			}
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 반환
//		}
//		return null;
//	}
//	
//	//-2 사용자 정보 수정 
//	public int userInfoUpdate(User user) throws SQLException {
//		
//		String query = "UPDATE MEMBER "
//				+ "SET password=?, name=?, email=?, phone=?, university=?, department=?, grade=?"
//				+ "WHERE member_id=?";
//		Object[] param = new Object[] {user.getPassword(), user.getName(), user.getEmail(), user.getPhone(),
//				user.getUniversity(), user.getDepartment(), user.getGrade()};
//		jdbcUtil.setSqlAndParameters(query, param);
//		
//		try {
//			
//			int result = jdbcUtil.executeUpdate();
//			return result;
//		}catch (Exception ex) {
//			jdbcUtil.rollback();
//			ex.printStackTrace();
//		}finally {
//			jdbcUtil.commit();
//			jdbcUtil.close();
//		}
//		return 0;
//	}
//	//나의 스터디 조회
//	public List<StudyGroup> getMyGroup(StudyGroup s, User user) throws SQLException{
//		
//		List<StudyGroup> groupList = null;
//		String query = "SELECT ";
//		Object[] param = new Object[] {};
//		jdbcUtil.setSqlAndParameters(query, param);
//		
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		
//			while(rs.next()) {
//				
//				
//			}
//			
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			jdbcUtil.close();	
//		}
//		return groupList;
//	}
//	
//	//스터디 그룹 생성
//	public int addGroup(StudyGroup s, User user) throws SQLException{
//		
//		String query = "INSERT INTO STUDYGROUP(name, description, number_of_members, term, meeting_type, gendertype, leader_id) "
//				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
//		Object[] param = new Object[] {s.getGroupName(), s.getDescription(), s.getNumberOfUsers(), 
//				s.getTerm(), s.getMeetingType(), s.getGenderType(), user.getUserId()};
//		
//		jdbcUtil.setSqlAndParameters(query, param);
//		
//		try {
//			int result = jdbcUtil.executeUpdate();
//			return result;
//		}catch (Exception ex) {
//			jdbcUtil.rollback();
//			ex.printStackTrace();
//		} finally {		
//			jdbcUtil.commit();
//			jdbcUtil.close();	
//		}		
//		return 0;
//	}
//}

package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.StudyGroup;
import model.User;

public class MemberDAO {
	
	private static MemberDAO md = new MemberDAO();
	private JDBCUtil jdbcUtil = null;
	
	public MemberDAO() {
		jdbcUtil = new JDBCUtil();
	}
	public static MemberDAO getInstance() {
		return md;
	}
	
	//회원가입 (새로운 user 추가)
	public int userCreate(User user) throws SQLException {
		
		String query = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {user.getUserId(), user.getPassword(), user.getEmail(), user.getPhone(),
				user.getUniversity(), user.getDepartment(), user.getGrade()};
		
		jdbcUtil.setSqlAndParameters(query, param);
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		}catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}
	//로그인 (userId에 해당하는 사용자가 존재하는지 검사)
	public boolean existingUser(String userId, String password) throws SQLException{
		
		String query = "SELECT count(*) FROM MEMBER WHERE email=?, password=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {userId, password});
		
		try {
			
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		return false;
	}
	
	//회원정보 수정 
	//-1 사용자의 정보 가져오기
	public User findUser(String userId) throws SQLException{
		
		//String userId, String password, String name, String email, String phone, String university,
		//String department, int grade
		String query = "SELECT password, name, email, phone, university, department, grade"
				+ "FROM MEMBER "
				+ "WHERE member_id =? ";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {userId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while(rs.next()) {
				User user = new User(
						userId,
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("university"),
						rs.getString("department"),
						rs.getInt("grade"));
				return user;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	//-2 사용자 정보 수정 
	public int userInfoUpdate(User user) throws SQLException {
		
		String query = "UPDATE MEMBER "
				+ "SET password=?, name=?, email=?, phone=?, university=?, department=?, grade=?"
				+ "WHERE member_id=?";
		Object[] param = new Object[] {user.getPassword(), user.getName(), user.getEmail(), user.getPhone(),
				user.getUniversity(), user.getDepartment(), user.getGrade()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			
			int result = jdbcUtil.executeUpdate();
			return result;
		}catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
	//나의 스터디 조회
	public List<StudyGroup> getMyGroup(StudyGroup s, User user) throws SQLException{
		
		List<StudyGroup> groupList = null;
		
		String query = "SELECT s.name, s.description, s.term, s.number_of_member, s.gender_type, s.grade_type, s.meeting_type, "
				+ "FROM STUDYGROUP s, MEMBER m "
				+ "WHERE s.leader_id = m.member_id;";
				
		Object[] param = new Object[] {};
		jdbcUtil.setSqlAndParameters(query, param);
	
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			while(rs.next()) {
				StudyGroup sg = new StudyGroup();
				
				sg.setGroupName(rs.getString("s.name"));
				sg.setDescription(rs.getString("s.description"));
				sg.setTerm(rs.getInt("s.term"));
				sg.setNumberOfUsers(rs.getInt("s.number_of_member"));
				sg.setGenderType(rs.getInt("s.gender_type"));
				sg.setGradeType(rs.getInt("s.grade_type"));
				sg.setMeetingType(rs.getInt("s.meeting_type"));
				
				groupList.add(sg);
		}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();	
		}
		return groupList;
		
	}
	
	//스터디 그룹 생성
	public int addGroup(StudyGroup s, User user) throws SQLException{
		
		String query = "INSERT INTO STUDYGROUP(name, description, number_of_members, term, meeting_type, gendertype, leader_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {s.getGroupName(), s.getDescription(), s.getNumberOfUsers(), 
				s.getTerm(), s.getMeetingType(), s.getGenderType(), user.getUserId()};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		}catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return 0;
	}
}
