package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import model.Comment;
import model.Post;
import model.StudyGroup;
import model.Subject;
import model.User;
import model.service.ExistingException;
import model.service.Manager;
import model.service.NotFoundException;

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
		
		Comment comment = new Comment();
		comment.setContent("네!");
		comment.setPostId(401);
		
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
		
		ArrayList<StudyGroup> groupList = null;
		try {
			groupList = manager.getManageStudyGroupList(201);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(groupList != null) {
			for(StudyGroup s : groupList) {
				System.out.println(s.getGroupId() + ", " + s.getLeaderId() + ", " + s.getGroupName());
			}
		}
		
		
		ArrayList<User> applyList = null;
		try {
			applyList = manager.getApplyList();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NotFoundException e) {
			e.printStackTrace();
		}
		
		if(applyList != null) {
			for(User u : applyList) {
				System.out.println("신청 목록 확인: " + u.getStudyName() + ", " + u.getApplyDate() + ", " 
						+ u.getApprovedDate() + ", " + u.isApproved());
			}
		}
		
		
	}
}
