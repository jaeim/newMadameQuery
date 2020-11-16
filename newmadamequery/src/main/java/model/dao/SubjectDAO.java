package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Comment;
import model.Subject;

public class SubjectDAO {
	
	private static SubjectDAO dao = new SubjectDAO();
	private JDBCUtil jdbcUtil = null; 
	
	private SubjectDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public static SubjectDAO getInstance() {
		return dao;
	}
	
	// create를 굳이 여기서 할 필요는 없을 것 같음 (사용자가 추가하는게 아니라면)
	
	public ArrayList<Subject> getAllSubject() throws SQLException{
		String query = "select * from subject";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {});
		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			ArrayList<Subject> subjectList = new ArrayList<Subject>();
			while(rs.next()) {
				Subject subject = new Subject();
				subject.setSubjectId(rs.getInt("subject_id"));
				subject.setName(rs.getString("name"));
				subject.setTerm(rs.getString("term"));
				
				subjectList.add(subject);
			}
			jdbcUtil.commit();
			return subjectList;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
}
