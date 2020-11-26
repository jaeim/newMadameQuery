package model.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.naming.java.javaURLContextFactory;

import model.StudyGroup;
import model.User;
import model.service.AppException;

public class MemberDAO {
	
	private static MemberDAO md = new MemberDAO();
	private JDBCUtil jdbcUtil = null;
	
	private MemberDAO() {
		jdbcUtil = new JDBCUtil();
	}
	public static MemberDAO getInstance() {
		return md;
	}
		
	//회원가입 (새로운 user 추가)
	public int userCreate(User user) throws SQLException {
		int result = 0;
		String query = "INSERT INTO MEMBER (member_id, email, password, name, phone, "
				+ "dob, date_of_join, univ, dep, grade, gender)"
				+ " VALUES (SEQUENCE_USER.NEXTVAL, ?, ?, ?, ?, sysdate, sysdate, ?, ?, ?, ?)";
		
		//java.sql.Date dob = new java.sql.Date(user.getDob().getTime());
		//java.sql.Date date_of_join = new java.sql.Date(user.getDate_of_join().getTime());
		Object[] param = new Object[] {user.getEmail(), user.getPassword(), user.getName(),
				user.getPhone(), user.getUniversity(), user.getDepartment(), user.getGrade(), user.getGender()};
		
		jdbcUtil.setSqlAndParameters(query, param);
		try {
			result = jdbcUtil.executeUpdate();
			jdbcUtil.commit();
		}catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();	
		}		
		return result;
	}
	//로그인 (userId에 해당하는 사용자가 존재하는지 검사)
	public boolean existingUser(String email, String password) throws SQLException{
		boolean result = false;
		String query = "SELECT * FROM MEMBER WHERE email=? and password=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {email, password});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			jdbcUtil.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			jdbcUtil.rollback();
		}finally {
			jdbcUtil.close();
		}
		return result;
	}
	
	//회원정보 수정 
	//-1 사용자의 정보 가져오기
	public User findUser(int userId) throws SQLException{
		
		//String userId, String password, String name, String email, String phone, String university,
		//String department, int grade
		String query = "SELECT *"
				+ "FROM MEMBER "
				+ "WHERE member_id =?";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {userId});
		ResultSet rs = null;
		User user = null;
		try {
			rs = jdbcUtil.executeQuery();
			if(rs.next()) {
				user = new User(
						userId,
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getDate("dob"),
						rs.getString("phone"),
						rs.getDate("date_of_join"),
						rs.getString("univ"),
						rs.getString("dep"),
						rs.getString("grade"),
						rs.getInt("gender"));			
			}
			jdbcUtil.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			jdbcUtil.rollback();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return user;
	}
	
	public User findUser(String email) throws SQLException{
		String query = "SELECT *"
				+ "FROM MEMBER "
				+ "WHERE email=?";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {email});
		ResultSet rs = null;
		User user = null;
		try {
			rs = jdbcUtil.executeQuery();
			if(rs.next()) {
				user = new User(
						rs.getInt("member_id"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getDate("dob"),
						rs.getString("phone"),
						rs.getDate("date_of_join"),
						rs.getString("univ"),
						rs.getString("dep"),
						rs.getString("grade"),
						rs.getInt("gender"));			
			}
			jdbcUtil.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			jdbcUtil.rollback();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return user;
	}
	
	//-2 사용자 정보 수정 
	public int userInfoUpdate(User user) throws SQLException {
		int result = 0;
		String query = "UPDATE MEMBER "
				+ "SET email=?, password=?, name=?, phone=?, "
				+ "univ=?, dep=?, grade=?, gender=?"
				+ "WHERE member_id=?";
		
		//java.sql.Date dob = new java.sql.Date(user.getDob().getTime());
		//java.sql.Date date_of_join = new java.sql.Date(user.getDate_of_join().getTime());
		
		Object[] param = new Object[] {user.getEmail(), user.getPassword(), user.getName(), user.getPhone(), 
				user.getUniversity(), user.getDepartment(), user.getGrade(), user.getGender(), user.getMember_id()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
			jdbcUtil.commit();
		}catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		return result;
	}

	// 나의 스터디목록 조회
	public ArrayList<StudyGroup> getMyGroupList(int memberId) throws SQLException{
		
		ArrayList<StudyGroup> groupList = new ArrayList<StudyGroup>();
		
		String query = "select * from GROUPMEMBER gm, STUDYGROUP s "
				+ "where gm.group_id = s.group_id and member_id=?";
		Object[] param = new Object[] {memberId};
		jdbcUtil.setSqlAndParameters(query, param);
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			while(rs.next()) {
				StudyGroup sg = new StudyGroup();
				
				sg.setGroupId(rs.getInt("group_id"));
				sg.setCreatedDate(rs.getDate("created_date"));
				sg.setNumberOfUsers(rs.getInt("number_of_member"));
				sg.setGroupName(rs.getString("name"));
				sg.setDescription(rs.getString("description"));
				sg.setTerm(rs.getInt("term"));
				sg.setMeetingType(rs.getString("meeting_type"));
				sg.setGenderType(rs.getString("gender_type"));
				sg.setGradeType(rs.getString("grade_type"));
				sg.setSubjectId(rs.getInt("subject_id"));
				sg.setLeaderId(rs.getInt("leader_id"));
				
				groupList.add(sg);
		}
			jdbcUtil.commit();
			return groupList;
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();	
		}
		return null;
		
	}
	
	//사용자가 팀장인 스터디그룹의 리스트 가져오기
	public ArrayList<StudyGroup> getManageStudyList(int memberId) throws SQLException{
		
		ArrayList<StudyGroup> groupList = new ArrayList<StudyGroup>();
		String query ="SELECT * " 
				+ "FROM studygroup "
				+ "WHERE leader_id=?";
		Object[] param = new Object[] {memberId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			while(rs.next()) {
				StudyGroup sg = new StudyGroup();
				
				sg.setGroupId(rs.getInt("group_id"));
				sg.setCreatedDate(rs.getDate("created_date"));
				sg.setNumberOfUsers(rs.getInt("number_of_member"));
				sg.setGroupName(rs.getString("name"));
				sg.setDescription(rs.getString("description"));
				sg.setTerm(rs.getInt("term"));
				sg.setMeetingType(rs.getString("meeting_type"));
				sg.setGenderType(rs.getString("gender_type"));
				sg.setGradeType(rs.getString("grade_type"));
				sg.setSubjectId(rs.getInt("subject_id"));
				sg.setLeaderId(rs.getInt("leader_id"));
				
				groupList.add(sg);
		}
			jdbcUtil.commit();
			return groupList;
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.close();	
		}
		
		return null;
	}
	
	//내가 신청한 스터디그룹 목록
	public ArrayList<User> getApplyList() {
		String query = "SELECT name, apply_date, approved_date, isApproved "
				+ "FROM studygroup JOIN applylist USING (group_id)";
		jdbcUtil.setSqlAndParameters(query, null);
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs == null) {throw new AppException();}
			
			ArrayList<User> applyList = new ArrayList<User>();
			
			while (rs.next()) {
				User apply = new User();
				
				apply.setStudyName(rs.getString("name"));
				apply.setApplyDate(rs.getDate("apply_date"));
				apply.setApplyDate(rs.getDate("approved_date"));
				
				String approved = rs.getString("isApproved");
				if (approved.equals("1"))
					apply.setApproved(true);
				else
					apply.setApproved(false);
					 
				applyList.add(apply);
			}
			jdbcUtil.commit();
			return applyList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		
		return null;
	}
	
}
