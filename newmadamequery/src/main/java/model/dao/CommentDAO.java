package model.dao;

import model.Comment;
import model.User;
import model.service.AppException;
import oracle.net.aso.n;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class CommentDAO {
	private static CommentDAO dao = new CommentDAO();
	private JDBCUtil jdbcUtil = null; 
	public CommentDAO() {
		jdbcUtil = new JDBCUtil();
	}
	//Manager에서 처리하도록 수정하기
	public static CommentDAO getInstance() {
		return dao;
	}
	
	public boolean existingComment(int commentId) throws SQLException{
		boolean result = false;
		String query = "select * from COMMT where comment_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {commentId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				result = true;
			}
			jdbcUtil.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			jdbcUtil.rollback();
		} finally {
			jdbcUtil.close();
		}
		
		return result;
	}
	
	// 댓글 하나를 가져옴
	// member 테이블과 조인하여 댓글 작성자 이름 저장
	public Comment getOneComment(int comment_id) throws SQLException {
		String query = "SELECT COMMENT_ID, CONTENT, CREATED_DATE, MODIFIED_DATE, POST_ID, GROUP_ID, MEMBER_ID, NAME " 
				+ "FROM COMMT JOIN MEMBER USING(MEMBER_ID) " + 
				"WHERE COMMENT_ID = ?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {comment_id});
		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			Comment comt = new Comment();
			if (rs.next()) {	
				comt.setComment_id(rs.getInt("comment_id"));
				comt.setContent(rs.getNString("content"));
				comt.setCreatedDate(rs.getDate("created_date"));
				if(rs.getDate("modified_date") != null) {
					comt.setModifiedDate(rs.getDate("modified_date"));
				}
				comt.setPostId(rs.getInt("post_id"));
				comt.setGroupId(rs.getInt("group_id"));
				comt.setMember_id(rs.getInt("member_id"));
				comt.setMemeber_name(rs.getString("name"));
				return comt;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	//해당 게시글에 달린 댓글 갯수를 가져옴
	public int getCommentCount(int ref) throws SQLException {
		String query = "select count(*) as count from commt where post_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {ref});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			int count = 0;
			if(rs.next()) {
				count = rs.getInt("count");
			}
			return count;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return 0;
		

	}
	
	//해당 게시글에 해당하는 댓글리스트를 가져옴
	public ArrayList<Comment> getCommentList(int ref) throws SQLException{
		String query = "SELECT COMMENT_ID, CONTENT, CREATED_DATE, MODIFIED_DATE, POST_ID, GROUP_ID, MEMBER_ID, NAME " 
				+ "FROM COMMT JOIN MEMBER USING(MEMBER_ID) " + 
				"WHERE POST_ID = ? " + "ORDER BY CREATED_DATE";
		jdbcUtil.setSqlAndParameters(query, new Object[] {ref});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			ArrayList<Comment> commentList = new ArrayList<Comment>();
			while(rs.next()) {
				Comment comt = new Comment();
				
				comt.setComment_id(rs.getInt("comment_id"));
				comt.setContent(rs.getNString("content"));
				comt.setCreatedDate(rs.getDate("created_date"));
				if(rs.getDate("modified_date") != null) {
					comt.setModifiedDate(rs.getDate("modified_date"));
				}
				comt.setPostId(rs.getInt("post_id"));
				comt.setGroupId(rs.getInt("group_id"));
				comt.setMember_id(rs.getInt("member_id"));
				comt.setMemeber_name(rs.getString("name"));
				
				commentList.add(comt);
			}
			return commentList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	
	//댓글 등록
	public int createComment(Comment comt) throws SQLException {
		String query = "insert into commt (comment_id, created_date, content, post_id, group_id, member_id) "
				+ "values (SEQUENCE_COMMENT.nextval, sysdate, ?, ?, ?, ?)";
		String query2 = "SELECT SEQUENCE_COMMENT.CURRVAL AS COMMENT_ID FROM DUAL";
		
		Object[] param = new Object[] {comt.getContent(), comt.getPostId(), comt.getGroupId(), comt.getMember_id()};
		Object[] param2 = new Object[] {};
		
		ResultSet rs = null;
		try {
			jdbcUtil.setSqlAndParameters(query, param);
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			
			if (result > 0) { // 코멘트 삽입 성공시
				jdbcUtil.setSqlAndParameters(query2, param2);
				rs = jdbcUtil.executeQuery();
				if (rs.next()) {
					result = rs.getInt("COMMENT_ID");
				}
			}
			//삽입 실패시 0 반환 , 성공시 comment_id 반환
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;		
		
	}
	
	//댓글 삭제
	public int deleteComment(int comment_id) throws SQLException {
		String query = "delete from commt where comment_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {comment_id});
		
		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
	//해당 게시글에 엮인 댓글 모두 삭제
	public int deleteCommentByPost(int postId) throws SQLException {
		String query = "delete from commt where post_id=?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {postId});

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
	
	//댓글 수정
	public int updateComment(Comment comt) throws SQLException {
		String query = "update commt set content=?, modified_date = sysdate "
				+ "where comment_id=?";
		Object[] param = new Object[] {comt.getContent(), comt.getComment_id()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
	
	public int removeAllComment(int groupId) {
		int result = 0;
		
		//COMMT 테이블에 group_id 컬럼이 존재하지 않음
		String query = "DELETE FROM commt WHERE group_id=?";
		Object [] param = new Object[] {groupId};
		
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			result = jdbcUtil.executeUpdate();
//			if(result != 1) {throw new AppException();}
			jdbcUtil.commit();
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.close();
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		//commentDAO 테스트
		CommentDAO dao = CommentDAO.getInstance();	
		User user = null;
		int comment_id = 1;
		
		Comment cmt = new Comment(comment_id, user, new java.util.Date(), new java.util.Date(), "감사합니다~", 401);
		
		//int comment_id, User userName, Date createdDate, Date modifiedDate, String content, int ref
		
	
//		try {
//			Comment comm = dao.getOneComment(1);
//			System.out.println("댓글번호: " + comm.getComment_id() +
//					" 작성날짜: " + comm.getCreatedDate() + " 내용: " + comm.getContent());
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

		try {
				int result = dao.createComment(cmt);
				System.out.println("댓글 작성 날짜: " + cmt.getCreatedDate() +"\n댓글 내용: "+ cmt.getContent());
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
