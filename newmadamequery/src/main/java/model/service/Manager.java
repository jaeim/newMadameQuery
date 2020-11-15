package model.service;

import model.dao.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Comment;
import model.Post;
import model.StudyGroup;
import model.Subject;
import model.User;

// 현지
public class Manager {
	
	private static Manager manager = new Manager();
	private MemberDAO memberDAO;
	private StudyGroupDAO studyGroupDAO;
	private PostDAO postDAO;
	private CommentDAO commentDAO;
	private SubjectDAO subjectDAO;
	
	private Manager() {
		try {
			memberDAO = MemberDAO.getInstance();
			studyGroupDAO = StudyGroupDAO.getInstance();
			postDAO = PostDAO.getInstance();
			commentDAO = CommentDAO.getInstance();
			subjectDAO = SubjectDAO.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Manager getInstance() {
		return manager;
	}
	
	public boolean isLogin(String email, String password) throws SQLException{
		return memberDAO.existingUser(email, password);
	}
	
	public int createUser(User user) throws SQLException, ExistingException{
		if(isLogin(user.getEmail(), user.getPassword())) {
			throw new ExistingException(user.getEmail() + "는 존재하는 유저아이디임");
		}
		return memberDAO.userCreate(user);
	}
	
	public int updateUser(User user) throws SQLException, NotFoundException{
		// NotFoundException이 나는지 확인하기 위해 수행하는 코드
		findUser(user.getMember_id());
		
		return memberDAO.userInfoUpdate(user);
	}
	
	//ok
	public User findUser(int userId) throws SQLException, NotFoundException {
			User user = memberDAO.findUser(userId);
			
			if (user == null) {
				throw new NotFoundException(userId + "는 존재하지 않는 아이디입니다.");
			}		
			return user;
	}
	
	//ok
	public int createStudyGroup(StudyGroup group, int memberId) throws SQLException, ExistingException, NotFoundException{
		int r1 = 0;
		int r2 = 0;
		
		if(studyGroupDAO.existingGroup(group.get_id())) {
			throw new ExistingException(group.get_id() + "는 존재하는 groupId 입니다.");
		}
		findUser(memberId);
		
		r1 = studyGroupDAO.addGroup(group, memberId);
		if(r1 == 1) {
			r2 = studyGroupDAO.addMemberInGroupMember(group.get_id(), memberId, "1");
		}
		
		if(r1 == 1 && r2 == 1)
			return 1;
		return 0;
	}
	
	// ok
	public int removeStudyGroup(int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		int result = 0;
		// StudyGroup을 참조 하고 있는 테이블 레코드 전부 삭제
		result = studyGroupDAO.removeMemberInGroup(groupId, -1);
		System.out.println("member :" + result);
		result = studyGroupDAO.removeAllComment(groupId);
		System.out.println("comment :" + result);
		result = studyGroupDAO.removeAllPost(groupId);
		System.out.println("post :" + result);
		result = studyGroupDAO.removeAllApply(groupId);
		System.out.println("applys :" + result);
		
		return studyGroupDAO.removeGroup(groupId);
	}
	
	// ok
	public int updateStudyGroup(StudyGroup group)  throws SQLException, NotFoundException {
		if(!studyGroupDAO.existingGroup(group.get_id())) {
			throw new NotFoundException(group.get_id() + "는 존재하지 않는 groupId 입니다.");
		}
		
		return studyGroupDAO.updateGroup(group);
	}
	
	// ok
	public StudyGroup findGroup(int groupId) throws SQLException, NotFoundException{
		StudyGroup group = studyGroupDAO.findGroup(groupId);
		
		if(group == null) {throw new NotFoundException();}
		
		return group;
	}
	
	// ok
	public ArrayList<StudyGroup> searchStudyGroups (String name, int term, int numOfMem) throws SQLException {
		ArrayList<StudyGroup> groupList = studyGroupDAO.searchGroupList(name, term, numOfMem);
	
		if(groupList == null) {throw new SQLException("ArrayList 값이 null입니다.");}
		
		return groupList;
	}
	
	// ok
	public ArrayList<User> getAllMemberInGroup (int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		return studyGroupDAO.getAllMemberInGroup(groupId);
	}
	
	// ok
	public int getNumberOfMemberInGroup(int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		return studyGroupDAO.getNumberOfMember(groupId);
	}
	
	// ok
	public int manageApplicationInGroup(int groupId, int userId, boolean approved) throws SQLException, NotFoundException{
		int result = studyGroupDAO.findApplication(groupId, userId);
		
		// 지원서에 없을 경우
		if(result != 1) {throw new NotFoundException();}		
		
		result = studyGroupDAO.manageApplication(groupId, userId, approved);
		if(approved && result == 1) {
			result = studyGroupDAO.addMemberInGroupMember(groupId, userId, "0");
		}
		
		return result;
	}
	
	// ok
	public int applyToGroup(int groupId, int userId) throws SQLException, NotFoundException {
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		findUser(userId);
		
		return studyGroupDAO.applyToGroup(groupId, userId);
	}
	
	// ok
	public ArrayList<StudyGroup> getAllStudyGroup() throws SQLException{
		return studyGroupDAO.getGroupList();
	}
	
	public Post findPost(int postId) throws SQLException, NotFoundException{
		Post post = postDAO.getOnePost(postId);
		
		if(post == null) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
		
		return post;
		
	}
	
	// ok
	public ArrayList<Post> getAllPost(int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		return postDAO.getPostList(groupId);
	}
	
	// ok
	public int createPost(Post post) throws SQLException{
		return postDAO.addPost(post);
	}
	
	public int updatePost(Post post) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(post.get_id())){
			throw new NotFoundException(post.get_id() + "는 존재하지 않는 게시물입니다.");
		}
		
		return postDAO.updatePost(post);
	}
	
	public int removePost(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)){
			throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");
		}
		
		return postDAO.removePost(postId);
	}
	
	public Comment findComment(int commentId) throws SQLException, NotFoundException{
		Comment comment = commentDAO.getOneComment(commentId);
		
		if(comment == null) {throw new NotFoundException(commentId + "는 존재하지 않는 댓글입니다.");}
		
		return comment;
	}
	
	public int numberOfComment(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
	
		return commentDAO.getCommentCount(postId);
	}
	
	public ArrayList<Comment> getAllComment(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
		
		return commentDAO.getCommentList(postId);
	}
	
	public int createComment(Comment comment) throws SQLException{
		return commentDAO.createComment(comment);
	}
	
	public int removeComment(int commentId) throws SQLException, NotFoundException{
		if(!commentDAO.existingComment(commentId)) {throw new NotFoundException(commentId + "는 존재하지 않는 댓글입니다.");}
		
		return commentDAO.deleteComment(commentId);
	}
	
	public int updateComment(Comment comment) throws SQLException, NotFoundException{
		if(!commentDAO.existingComment(comment.getComment_id())) {throw new NotFoundException(comment.getComment_id() + "는 존재하지 않는 댓글입니다.");}
	
		return commentDAO.updateComment(comment);
	}
	
	public ArrayList<Subject> getAllSubject() throws SQLException{
		return subjectDAO.getAllSubject();
	}
}
