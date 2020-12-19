package model.service;

import model.dao.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Application;
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
	//ok
	public boolean login(String email, String password) throws SQLException, NotFoundException, PasswordMismatchException{
		User user = findUser(email);
		if(user == null) {throw new NotFoundException();}

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
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
		// findUser(user.getEmail());
		if(memberDAO.existingUser(user.getEmail(), user.getPassword())) {
			return memberDAO.userInfoUpdate(user);
		}
		return -1;
	}
	
	//ok
	public User findUser(int userId) throws SQLException, NotFoundException {
			User user = memberDAO.findUser(userId);
			
			if (user == null) {
				throw new NotFoundException(userId + "는 존재하지 않는 아이디입니다.");
			}		
			return user;
	}
	
	public User findUser(String email) throws SQLException{
		User user = memberDAO.findUser(email);		
		return user;
	}
	
	//ok
	public int createStudyGroup(StudyGroup group, int memberId) throws SQLException, ExistingException, NotFoundException{
		int createdGroupId = 0;
		int r2 = 0;
		
		createdGroupId = studyGroupDAO.addGroup(group, memberId);
		if(createdGroupId != 0) {
			// groupmember 테이블에 팀장 추가
			r2 = studyGroupDAO.addMemberInGroupMember(group.getGroupId(), memberId, "1");
		}
		
		if(createdGroupId != 0 && r2 == 1)
			return createdGroupId;
		return 0;
	}
	
	// ok
	public int removeStudyGroup(int groupId) throws SQLException, NotFoundException, RemoveException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		int result = 0;
		// StudyGroup을 참조 하고 있는 테이블 레코드 전부 삭제
		result = studyGroupDAO.removeMemberInGroup(groupId, -1);
		System.out.println("member :" + result);
		result = commentDAO.deleteAllCommentsByGroupId(groupId);
		System.out.println("comment :" + result);
		result = postDAO.removeAllPost(groupId);
		System.out.println("post :" + result);
		result = studyGroupDAO.removeAllApply(groupId);
		System.out.println("applys :" + result);
		
		result = studyGroupDAO.removeGroup(groupId);
		if(result == 0) {throw new RemoveException(groupId + "그룹 삭제가 실패하였습니다.");}
		
		return result;
	}
	
	// ok
	public int updateStudyGroup(StudyGroup group)  throws SQLException, NotFoundException {
		if(!studyGroupDAO.existingGroup(group.getGroupId())) {
			throw new NotFoundException(group.getGroupId() + "는 존재하지 않는 groupId 입니다.");
		}
		int result = studyGroupDAO.updateGroup(group);
		if(result == 0) {throw new SQLException();}
		
		return result;
	}
	
	// ok (mabatis collection)
	public StudyGroup findGroup(int groupId) throws SQLException, NotFoundException{
		StudyGroup group = studyGroupDAO.selectStudyGroup(groupId);
		
		if(group == null) {throw new NotFoundException();}
		User leader = findUser(group.getLeaderId());
		group.setLeaderName(leader.getName());
		
		return group;
	}
	
	// ok
	public ArrayList<StudyGroup> searchStudyGroups (int term, int numOfMem, String meeting_type, String gender_type, String grade_type) throws SQLException {
		ArrayList<StudyGroup> groupList = studyGroupDAO.searchGroupList(term, numOfMem, meeting_type, gender_type, grade_type);
	
		if(groupList == null) {throw new SQLException("조건에 맞는 스터디 그룹이 없습니다.");}
		
		return groupList;
	}
	
	// ok
	public ArrayList<User> getAllMemberInGroup (int groupId) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		return studyGroupDAO.getAllMemberInGroup(groupId);
	}
	
	public int removeMemberInGroup(int groupId, int memberId) throws SQLException, NotFoundException {
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException();
		}
		int result = studyGroupDAO.deleteFromApplyList(groupId, memberId);
		return studyGroupDAO.removeMemberInGroup(groupId, memberId);
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
//		result = studyGroupDAO.deleteFromApplyList(groupId, userId);
		if(approved && result == 1) {
			StudyGroup group = studyGroupDAO.selectStudyGroup(groupId);
			if(group.getNumberOfUsers() <= group.getGroupUsers().size()) {
				return -3;
			}			
			studyGroupDAO.acceptApply(groupId, userId);
			result = studyGroupDAO.addMemberInGroupMember(groupId, userId, "0");
		} else if (approved == false && result == 1) {
			studyGroupDAO.rejectApply(groupId, userId);
		}
		
		return result;
	}
	
	// ok
	public int applyToGroup(int groupId, int userId, String comments) throws SQLException, NotFoundException{
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		User user = findUser(userId);
		StudyGroup studyGroup = findGroup(groupId);
		
		int isExistingUser = studyGroupDAO.findApplication(groupId, userId);
		int isGroupMember = studyGroupDAO.findUserInGroup(groupId, userId);
		
		
		if (isExistingUser != 0) {
			System.out.println("이미 해당 그룹에 신청하였습니다. 결과는  " + isExistingUser);
			//throw new ExistingException("이미 해당 그룹에 신청하였습니다.");	
			return -1;
		}
		if (isGroupMember != 0) {
			System.out.println("이미 해당 그룹에 존재하는 멤버입니다. 결과는  " + isGroupMember);
			//throw new ExistingException("이미 해당 그룹에 존재하는 멤버입니다.");	
			return 2;
		}
		if (!studyGroup.getGenderType().equals("0")) {
			if (!String.valueOf(user.getGender()).equals(studyGroup.getGenderType())) {
				System.out.println("신청 조건에 맞지 않습니다. 유저 성별: " + user.getGender() + " 그룹 성별: "  + studyGroup.getGenderType());
				//throw new ConditionMismatchException("신청 조건에 맞지 않습니다.");
				return 3;
			}		
		}
		if (!studyGroup.getGradeType().equals("0")) {
			System.out.println("유저 학년 : " + user.getGrade());
			System.out.println("조건 학년 : " + studyGroup.getGradeType());
			// studyGroup의 grade 이상인 학년은 가입 가능하도록 설정함
			if (Integer.valueOf(user.getGrade()) < Integer.valueOf(studyGroup.getGradeType())) {
				System.out.println("신청 조건에 맞지 않습니다." + "유저 학년: "
						+ user.getGrade() + " 그룹 학년 : " + studyGroup.getGradeType());
				//throw new ConditionMismatchException("신청 조건에 맞지 않습니다.");
				return 4;
			}
		}
		
		return studyGroupDAO.applyToGroup(groupId, userId, comments);
	}
	
	// ok (mybatis collection)
	public ArrayList<StudyGroup> getAllStudyGroup() throws SQLException, NotFoundException{
		
		ArrayList<StudyGroup> groupList = studyGroupDAO.selectAllStudyGroup();
		return groupList;
	}
	
	// ok
	public ArrayList<StudyGroup> getMyStudyGroupList(int memberId) throws SQLException, NotFoundException {		
		ArrayList<StudyGroup> groupList = memberDAO.getMyGroupList(memberId);
		if(groupList == null) {throw new SQLException("나의 그룹 내역 조회 실패");}
		
		return groupList;
	}
	
	// ok
	public ArrayList<StudyGroup> getManageStudyGroupList(int memberId) throws SQLException, NotFoundException{
		ArrayList<StudyGroup> groupList = memberDAO.getManageStudyList(memberId);
		if(groupList == null) {throw new SQLException("나의 그룹 내역 조회 실패");}
		
		return groupList;
	}
	
	public Post findPost(int postId) throws SQLException, NotFoundException{
		Post post = postDAO.getOnePost(postId);
		if(post == null) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
		return post;
	}
	
	// ok
	public ArrayList<Post> getAllPost(int groupId) throws SQLException, NotFoundException {
		if(!studyGroupDAO.existingGroup(groupId)) {
			throw new NotFoundException(groupId + "는 존재하지 않는 groupId 입니다.");
		}
		
		return postDAO.getPostList(groupId);
	}
	
	// ok
	public int createPost(Post post) throws SQLException, AppException{
		try {
			int postId = postDAO.addPost(post);
			return postId;
		} catch (Exception e) {
			throw new AppException("게시글 등록에 실패하였습니다.");
		}	
	}
	
	public int updatePost(Post post) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(post.getPostId())){
			throw new NotFoundException(post.getPostId() + "는 존재하지 않는 게시물입니다.");
		}
		return postDAO.updatePost(post);
	}
	
	public int removePost(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)){
			throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");
		}
		commentDAO.deleteAllComments(postId);
		
		return postDAO.removePost(postId);
	}
	
	public Comment findComment(int commentId) throws SQLException, NotFoundException{
//		Comment comment = commentDAO.getOneComment(commentId);
		Comment comment = commentDAO.selectCommentByPrimaryKey(commentId);
		if(comment == null) {throw new NotFoundException(commentId + "는 존재하지 않는 댓글입니다.");}
		
		return comment;
	}
	
	public int numberOfComment(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
	
//		return commentDAO.getCommentCount(postId);
		return commentDAO.selectCommentCount(postId);
	}
	
	public ArrayList<Comment> getAllComment(int postId) throws SQLException, NotFoundException{
		if(!postDAO.existingPost(postId)) {throw new NotFoundException(postId + "는 존재하지 않는 게시물입니다.");}
		
//		return commentDAO.getCommentList(postId);
		return commentDAO.selectAllComment(postId);
	}
	
	public int createComment(Comment comment) throws SQLException, AppException{
		try {
//			int comment_id = commentDAO.createComment(comment);
			commentDAO.insertComment(comment);
			return comment.getComment_id();
		} catch (Exception e) {
			throw new AppException("댓글 등록에 실패하였습니다.");
		}
	}
	
	public int removeComment(int commentId) throws SQLException, NotFoundException{
		if(!commentDAO.existingComment(commentId)) {throw new NotFoundException(commentId + "는 존재하지 않는 댓글입니다.");}
		
//		return commentDAO.removeComment(commentId);
		return commentDAO.deleteComment(commentId);
	}
	
	public int updateComment(Comment comment) throws SQLException, NotFoundException{
		if(!commentDAO.existingComment(comment.getComment_id())) {throw new NotFoundException(comment.getComment_id() + "는 존재하지 않는 댓글입니다.");}
	
//		return commentDAO.updateComment(comment);
		return commentDAO.updateCommentMB(comment);
	}
	
	public ArrayList<Subject> getAllSubject() throws SQLException{
		return subjectDAO.getAllSubject();
	}
	
	//나의 신청현황
	public ArrayList<Application> getApplyList(int userId) throws NotFoundException, SQLException {		
		ArrayList<Application> applyList = memberDAO.getApplyList(userId);
		
		if(applyList == null) {throw new NotFoundException("나의 신청 현황 조회 실패");}
		
		return applyList;
	}
	
	// 해당 그룹 지원서 반환 (단, isApproved가 0인 지원서에 대해서만 반환함)
	public ArrayList<Application> getAllApplication(int groupId) throws NotFoundException, SQLException {
		if(!studyGroupDAO.existingGroup(groupId)) {throw new NotFoundException();}
		
		return studyGroupDAO.getAllApplication(groupId);
	}
	
}
