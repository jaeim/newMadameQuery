package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.StudyGroup;
import model.User;
import model.service.ExistingException;
import model.service.Manager;
import model.service.NotFoundException;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MemberDAO member = MemberDAO.getInstance();
		
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
		
		// userCreate 실행
//		try {
//			System.out.println(member.userCreate(u));
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		// existingUser 실행
//		try {
//			if(member.existingUser(u.getMember_id(), u.getPassword())) {
//				System.out.println("존재함");
//			}else {
//				System.out.println("존재하지않음");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		 findUser 실행
//		User user = null;
//		try {
//			user = member.findUser(201);
//			if(user == null) {
//				System.out.println("찾지못함");
//			}else {
//				System.out.println("찾음\n 이름:" + user.getName());
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(user != null) {
//			user.setName("YHJ");
//			user.setDepartment("Computer Science");
//			user.setPhone("01011112222");
//			user.setPassword("qwer");
//		
//			int result = 0;
//			try {
//				result = member.userInfoUpdate(user);
//			
//				System.out.println(result);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
		
		
		// getMyGroup 실행
//		ArrayList<StudyGroup> sList = new ArrayList<StudyGroup>();
//		if(user != null) {
//			try {
//				sList = member.getMyGroup(user.getMember_id());
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		
//		for(StudyGroup s : sList) {
//			System.out.println(s.get_id() + ", " + s.getGroupName());
//		}
		
//		StudyGroupDAO studyGroupDAO = StudyGroupDAO.getInstance();
//		StudyGroup s = new StudyGroup();
//		s.setCreatedDate(new java.util.Date());
//		s.setNumberOfUsers(5);
//		s.setGroupName("성과일상");
//		s.setDescription("족보공유");
//		s.setTerm(2);
//		s.setMeetingType("oline");
//		s.setGenderType("1");
//		s.setGradeType("3");
//		s.setSubjectId(1);
		
//		int result = 0;
//		try {
//			result = studyGroupDAO.addGroup(s, 1);
//			System.out.println(result);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		Manager manager = Manager.getInstance();
//		int result = 0;
//		try {
//			result = manager.createStudyGroup(s, 201);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ExistingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		System.out.println(result);
		
//		ArrayList<User> groupMember = null;
//		try {
//			System.out.println(manager.getNumberOfMemberInGroup(211));
//			groupMember = manager.getAllMemberInGroup(211);
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
		
		
		
	}
}
