package dao;

import model.Post;
import model.StudyGroup; //StudyGroupDAO로 옮기면 삭제 해야함
import model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
	private static PostDAO dao = new PostDAO();
	private JDBCUtil jdbcUtil = null;
	
	public PostDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public static PostDAO getInstance() {
		return dao;
	}

	//전체 게시글 보기
	public List<Post> getPostList(int groupId) throws SQLException {
		String query = "SELECT post_id, name, title, content, created_date, modified_date, member_id "
				+ "FROM post JOIN member USING (member_id) "
				+ "WHERE group_id = ? ORDER BY created_date DESC";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {groupId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Post> postList = new ArrayList<Post>();
			
			while (rs.next()) {
				Post post = new Post();
				
				post.set_id(rs.getInt("post_id"));
				post.setUserName(rs.getString("name"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getNString("content"));
				post.setCreatedDate(rs.getDate("created_date"));
				post.setModifiedDate(rs.getDate("modified_date"));
				post.setRefMember(rs.getInt("member_id"));
				
				postList.add(post);
			}
			return postList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		
		return null;
	}
	
	//게시글 상세보기
	public Post getOnePost(int postId) throws SQLException {
		String query = "SELECT name, title, content, created_date, modified_date, member_id, group_id "
				+ "FROM post JOIN member USING (member_id) "
				+ "WHERE post_id = ?";
		
		jdbcUtil.setSqlAndParameters(query, new Object[] {postId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			
			if (rs.next()) {
				Post post = new Post();
				
				post.setUserName(rs.getString("name"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getNString("content"));
				post.setCreatedDate(rs.getDate("created_date"));
				post.setModifiedDate(rs.getDate("modified_date"));
				post.setRefMember(rs.getInt("member_id"));
				post.setRefGroup(rs.getInt("group_id"));
				
				return post;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		
		return null;
	}
	
	//게시글 등록
	public int addPost(Post post) throws SQLException {
		String query = "INSERT INTO post (post_id, title, content, created_date, member_id, group_id) "
				+ "VALUES (SEQUENCE_POST.nextval, ?, ?, SYSDATE, ?, ?)";
		Object[] param = new Object[] {post.getTitle(), post.getContent(), post.getRefMember(), post.getRefGroup()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		return 0;
	}
	
	//게시글 수정
	public int updatePost(Post post) throws SQLException {
		String query = "UPDATE post SET title = ?, content = ?, modified_date = SYSDATE "
				+ "WHERE post_id = ?";
		Object[] param = new Object[] {post.getTitle(), post.getContent(), post.get_id()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		return 0;
	}
	
	//게시글 삭제
	public int removePost(int postId) throws SQLException {
		String query = "DELETE FROM post WHERE post_id = ?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {postId});
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		return 0;
	}

	
	//스터디그룹 DAO -> 스터디그룹 검색, 모든 스터디그룹 목록 조회 -> 나중에 StudyGroupDAO로 옮겨야함
	
	//스터디그룹 목록 조회
	public List<StudyGroup> getGroupList() throws SQLException {
		String query = "SELECT * FROM studygroup ORDER BY name";
		jdbcUtil.setSqlAndParameters(query, new Object[] {});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<StudyGroup> groupList = new ArrayList<StudyGroup>();
			
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
				
				group.set_id(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setSubjectName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setSpan(rs.getInt("term"));
				group.setMeetingType(rs.getString("meeting_type"));
				group.setGenderType(rs.getString("gender_type"));
				group.setGradeType(rs.getString("gender_type"));
				group.setRefSubject(rs.getInt("subject_id"));
				group.setRefLeader(rs.getInt("leader_id"));
				
				groupList.add(group);
			}
			return groupList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		
		return null;
	}
	
	
	//스터디그룹 검색 -> 과목이름, 인원, 기간으로 검색
	public List<StudyGroup> searchGroupList(String name, int term, int numOfMem) throws SQLException {
		String query = "SELECT * FROM studygroup WHERE name=? AND term=? AND number_of_member=? ORDER BY name";
		Object[] param = new Object[] {name, term, numOfMem};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<StudyGroup> groupList = new ArrayList<StudyGroup>();
			
			while (rs.next()) {
				StudyGroup group = new StudyGroup();
				
				group.set_id(rs.getInt("group_id"));
				group.setCreatedDate(rs.getDate("created_date"));
				group.setNumberOfUsers(rs.getInt("number_of_member"));
				group.setSubjectName(rs.getString("name"));
				group.setDescription(rs.getString("description"));
				group.setSpan(rs.getInt("term"));
				group.setMeetingType(rs.getString("meeting_type"));
				group.setGenderType(rs.getString("gender_type"));
				group.setGradeType(rs.getString("gender_type"));
				group.setRefSubject(rs.getInt("subject_id"));
				group.setRefLeader(rs.getInt("leader_id"));
				
				groupList.add(group);
			}
			return groupList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		
		return null;
	}
}
