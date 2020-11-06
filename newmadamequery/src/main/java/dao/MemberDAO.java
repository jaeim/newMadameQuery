package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		String query = "INSERT INTO MEMBER VALUES (?, ?, ?, )"
		
		return 0;
	}
	//로그인 (userId에 해당하는 사용자가 존재하는지 검사)
	public boolean existingUser(String userId, String password) throws SQLException{
		
		String query = "SELECT count(*) FROM MEMBER WHERE member_id=?, password=?";
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
}
