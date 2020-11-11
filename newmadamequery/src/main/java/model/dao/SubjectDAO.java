package model.dao;

public class SubjectDAO {
	
	private static SubjectDAO dao = new SubjectDAO();
	JDBCUtil util = null;
	
	private SubjectDAO() {
		util = new JDBCUtil();
	}
	
	public static SubjectDAO getInstance() {
		return dao;
	}
	
}
