package dao;

public class SubjectDAO {
	
	private static SubjectDAO dao = new SubjectDAO();
	JDBCUtil util = null;
	
	public SubjectDAO() {
		util = new JDBCUtil();
	}
	
	public SubjectDAO getInstance() {
		return dao;
	}
	
}
