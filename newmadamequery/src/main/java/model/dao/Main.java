package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import model.Application;
import model.Comment;
import model.Post;
import model.StudyGroup;
import model.Subject;
import model.User;
import model.service.ExistingException;
import model.service.Manager;
import model.service.NotFoundException;
import model.service.PasswordMismatchException;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		MemberDAO member = MemberDAO.getInstance();
		
//		User u = new User();
//		u.setEmail("yoo77hyeon@gmail.com");
//		u.setPassword("123456");
//		u.setName("유현지");
//		u.setDob(new java.util.Date());
//		u.setPhone("010-3716-0724");
//		u.setDate_of_join(new java.util.Date());
//		u.setUniversity("동덕여자대학교");
//		u.setDepartment("컴퓨터학과");
//		u.setGrade("3");
//		u.setGender(2);
		
//		User u = new User();
//		u.setEmail("20201234@naver.com");
//		u.setPassword("01020304");
//		u.setName("김동덕");
//		u.setDob(new java.util.Date());
//		u.setPhone("010-9999-8876");
//		u.setDate_of_join(new java.util.Date());
//		u.setUniversity("동덕여자대학교");
//		u.setDepartment("정보통계학과");
//		u.setGrade("2");
//		u.setGender(1);
//		
		
		//새로운 스터디그룹 생성
		//StudyGroupDAO studyGroupDAO = StudyGroupDAO.getInstance();

				
		Manager manager = Manager.getInstance();
//		int result = 0;
		
//		ArrayList<StudyGroup> list = null;
//		try {
//			list = manager.getAllStudyGroup();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	
		
		
//		StudyGroup s = new StudyGroup();
//		s.set_id(list.get(0).get_id());
//		s.setNumberOfUsers(10);
//		s.setGroupName("성과사랑");
//		s.setDescription("노트공유");
//		s.setTerm(2);
//		s.setMeetingType("oline");
//		s.setGenderType("0");
//		s.setGradeType("3");
//		s.setSubjectId(1);
//		s.setLeaderId(1);
		

//		Post post = new Post();
//		post.setTitle("노트공유합니다");
//		post.setContent("4주차 강의 노트 요약 ...");
//		post.setRefMember(201);
//		post.setRefGroup(611);
//		
//		try {
//			System.out.println(manager.createPost(post));
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		ArrayList<Post> postList = null;
//		try {
//			postList = manager.getAllPost(611);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(postList != null) {
//			for(Post p : postList) {
//				System.out.println(p.get_id() + ", " + p.getUserName());
//			}
//		}
		
//		PostDAO postDAO = PostDAO.getInstance();
//		try {
//			System.out.println(postDAO.existingPost(401));
//		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		Comment comment = new Comment();
//		comment.setContent("네!");
//		comment.setPostId(401);
		
//		try {
//			System.out.println(manager.createComment(comment));
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		try {
//			System.out.println(manager.numberOfComment(401));
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

//		if(groupMember != null) {
//			for(User u : groupMember) {
//				System.out.println(u.getMember_id());
//			}
//		}
//	
//		try {
//			System.out.println(manager.removeStudyGroup(211));
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//manager.createStudyGroup test
//		try {
//			//test group
//			StudyGroup studyGroup = new StudyGroup(4,
//					"데베프 스터디", "데베프 스터디 입니다.",
//					6, "blended",
//					"0", "0",
//					1);
//			//test member
//			int memberId = 1;
//			manager.createStudyGroup(studyGroup, memberId);
//			
//		} catch (Exception e) {
//			
//		}

//		ArrayList<Subject> subList = null;
//		try {
//			subList = manager.getAllSubject();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(subList != null) {
//			for(Subject s : subList) {
//				System.out.println(s.getSubjectId() + ", " + s.getName() + ", " + s.getTerm());
//			}
//		}
		
//		StudyGroupDAO studyGroupDAO = StudyGroupDAO.getInstance();
//		ArrayList<Integer> myGroupIdList = null;
//		try {
//			myGroupIdList = studyGroupDAO.getMyGroupIdList(201);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(myGroupIdList != null) {
//			for(int s : myGroupIdList) {
//				System.out.println(s);
//			}
//		}
		
//		ArrayList<StudyGroup> groupList = null;
//		try {
//			groupList = manager.getManageStudyGroupList(201);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}		
//		ArrayList<Subject> subList = null;
//		try {
//			subList = manager.getAllSubject();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(subList != null) {
//			for(Subject s : subList) {
//				System.out.println(s.getSubjectId() + ", " + s.getName() + ", " + s.getTerm());
//			}
//		}
		
		//test manager.removeStudyGroup => ok
//		try {
//			manager.removeStudyGroup(801);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		
//		try {
//			manager.applyToGroup(641, 1, "열심히 하겠습니다!!");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		test code : getOneComment => ok 
//		try {
//			CommentDAO commentDAO = CommentDAO.getInstance();
//			Comment comment = commentDAO.getOneComment(601);
//			
//			System.out.println("comment_id	created_date	modified_date	content \tpost_id\tgroup_id\tmember_id\tmember_name");
//			System.out.println(comment.getComment_id() + "		" + comment.getCreatedDate() + "	" + comment.getModifiedDate()
//			+ "		" + comment.getContent() + "\t\t" + comment.getPostId() + "\t" + comment.getGroupId() + "\t\t" + comment.getMember_id()
//			+ "\t\t" + comment.getMemeber_name());
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		// test code : getCommentList => ok
//		try {
//			CommentDAO commentDAO = CommentDAO.getInstance();
//			ArrayList<Comment> commentList = commentDAO.getCommentList(401);
//			System.out.println("comment_id	created_date	modified_date	content \tpost_id\tgroup_id\tmember_id\tmember_name");
//			for (Comment comment :  commentList) {		
//				System.out.println(comment.getComment_id() + "		" + comment.getCreatedDate() + "	" + comment.getModifiedDate()
//				+ "		" + comment.getContent() + "\t\t" + comment.getPostId() + "\t" + comment.getGroupId() + "\t\t" + comment.getMember_id()
//				+ "\t\t" + comment.getMemeber_name());
//			}		
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
//		 test code : createComment => ok
//		try {
//			CommentDAO commentDAO = CommentDAO.getInstance();
//			Comment comment2 = new Comment();
//			comment2.setContent("감사합니다^^");
//			comment2.setPostId(611);
//			comment2.setGroupId(611);
//			comment2.setMember_id(201);
//			int comment_id = commentDAO.createComment(comment2);
//			System.out.println("새로 생성된 코멘트 id는 " + comment_id);
//			System.out.println("------------------------------------------------------------------------------------------------");
//			ArrayList<Comment> commentList = commentDAO.getCommentList(401);
//			System.out.println("comm_id\tcreated\t\tmodified\tcontent\t\tpost\tgroup\tmember\tname");
//			for (Comment comment :  commentList) {		
//				System.out.println(comment.getComment_id() + "\t" + comment.getCreatedDate() + "\t" + comment.getModifiedDate()
//				+ "\t" + comment.getContent() + "\t" + comment.getPostId() + "\t" + comment.getGroupId() + "\t" + comment.getMember_id()
//				+ "\t" + comment.getMemeber_name());	
//			}			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		// test code : deleteComment => ok
//		try {
//			int commentId = 631;
//			CommentDAO commentDAO = CommentDAO.getInstance();
//			commentDAO.deleteComment(commentId);
//			
//			if(!commentDAO.existingComment(commentId)) {
//				throw new NotFoundException(commentId + "는 존재하지 않는 groupId 입니다.");
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		 
//		try {
//			CommentDAO commentDAO = CommentDAO.getInstance();
//			int comment_id = 651;
//			Comment c = commentDAO.getOneComment(651);
//			c.setContent("수정된 댓글입니다.");
//			c.setComment_id(comment_id);
//			commentDAO.updateComment(c);
//			
//			Comment comment = commentDAO.getOneComment(comment_id);
//			
//			System.out.println("comm_id\tcreated\t\tmodified\tcontent\t\tpost\tgroup\tmember\tname");
//			System.out.println(comment.getComment_id() + "\t" + comment.getCreatedDate() + "\t" + comment.getModifiedDate()
//			+ "\t" + comment.getContent() + "\t" + comment.getPostId() + "\t" + comment.getGroupId() + "\t" + comment.getMember_id()
//			+ "\t" + comment.getMemeber_name());	
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		// test code : getPostCount() 
//		try {
//			int ref = 611;
//			PostDAO postDAO = PostDAO.getInstance();
//			int count = postDAO.getPostCount(ref);
//			System.out.println(count);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		
		 // test code => create post
//		try {
//			Post post = new Post();
//			post.setTitle("공지사항입니다.");
//			post.setContent("모임장소는 인b301호 입니다.");
//			post.setGroup_id(611);
//			post.setMember_id(201);
//			
//			PostDAO postDAO = PostDAO.getInstance();
//			postDAO.addPost(post);
//			
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		
		
//		 delete post 특정 게시글 삭제 test => ok
//		try {
//			manager.removePost(611);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}


		
		//test code : update post => ok
//		try {
//			Post post = new Post();
//			post.setTitle("수정 공지사항이요.");
//			post.setContent("수정하였습니다.");
//			post.set_id(601);
//			//그룹:611 / 멤버:201	
//			PostDAO postDAO = PostDAO.getInstance();
//			postDAO.updatePost(post);
//		} catch (Exception e) {
//			// TODO: handle exception
//
//
//		if(groupList != null) {
//			for(StudyGroup s : groupList) {
//				System.out.println(s.getGroupId() + ", " + s.getLeaderId() + ", " + s.getGroupName());
//			}
//		}
//		
//		
//		ArrayList<User> applyList = null;
//		try {
//			applyList = manager.getApplyList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			e.printStackTrace();
//		}
//		
//		if(applyList != null) {
//			for(User u : applyList) {
//				System.out.println("신청 목록 확인: " + u.getStudyName() + ", " + u.getApplyDate() + ", " 
//						+ u.getApprovedDate() + ", " + u.isApproved());
//			}


//		if(groupList != null) {
//			for(StudyGroup s : groupList) {
//				System.out.println(s.getGroupId() + ", " + s.getLeaderId() + ", " + s.getGroupName());
//			}

//		}

//		ArrayList<User> applyList = null;
//		try {
//			applyList = manager.getApplyList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			e.printStackTrace();
//		}
//		
//		if(applyList != null) {
//			for(User u : applyList) {
//				System.out.println("신청 목록 확인: " + u.getStudyName() + ", " + u.getApplyDate() + ", " 
//						+ u.getApprovedDate() + ", " + u.isApproved());
//			}
//		}
		
//		ArrayList<Application> list = null;
//		StudyGroupDAO studyGroupDAO = StudyGroupDAO.getInstance();
//		System.out.println("dao 테스트");
//		try {
//			list = studyGroupDAO.getAllApplication(501);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		if(list != null) {
//			for(Application a : list) {
//				System.out.println(a.getMemberId());
//			}
//		}
//		else {
//			System.out.println("list is null");
//		}
//		
//		ArrayList<User> memberList = null;
//		try {
//			memberList = manager.getAllMemberInGroup(611);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(memberList != null) {
//			for(User a : memberList) {
//				System.out.println(a.getMember_id());
//			}
//		}
		
//		boolean result = false;
//		try {
//			result = manager.login("20170953@dongduk.ac.kr", "12345");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			System.out.println("email 주소가 없음");
//			e.printStackTrace();
//		} catch (PasswordMismatchException e) {
//			// TODO Auto-generated catch block
//			System.out.println("비밀번호 오류");
//			e.printStackTrace();
//		}
//		
//		if(result) {
//			System.out.println("로그인 성공");
//		}else {System.out.println("로그인 실패");}
		
//		int result = 0;
//		try {
//			result = manager.removeMemberInGroup(611, 221);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(result == 1) {System.out.println("멤버삭제성공");}
//		else{System.out.println("멤버삭제실패");}
	
		User user = null;
//		User user = null;
//		try {
//			user = manager.findUser("20170953@dongduk.ac.kr");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(user != null) {
//			System.out.println(user.getMember_id() + ", " + user.getName());
//		}
//		ArrayList<StudyGroup> groupList = null;
//		try {
//			groupList = manager.getAllStudyGroup();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(groupList != null) {
//			for(StudyGroup s: groupList) {
//				System.out.println("멤버명수 : " + s.getGroupUsers().size());
//			}
//		}
		
		ArrayList<StudyGroup> groupList = null;
		try {
			user = manager.findUser("20170953@dongduk.ac.kr");
			groupList = manager.searchStudyGroups(-1, -1, "혼합", "-1", "-1");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(user != null) {
			System.out.println(user.getMember_id() + ", " + user.getName());
		if(groupList != null) {
			for(StudyGroup s : groupList) {
				System.out.println(s.getGroupId());
				}
			}
		}
	}
}
