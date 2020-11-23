package model;
import java.util.Date;
import java.util.ArrayList;

public class StudyGroup {

	int groupId;
	java.util.Date createdDate; // 생성일
	int numberOfUsers ; // 스터디 그룹 인원
	String groupName; //그룹명
	String description; //간단한 설명
	int term; // 기간
	String meetingType; // 만남의 방식
	String genderType; // 성별( 0: 상관없음, 1: 남성, 2: 여성)
	String gradeType; // 학년 ( 1~4, 0 - 상관없음)	
	int subjectId; 
	int leaderId;
	
<<<<<<< HEAD
//	int refSubject;//subjectid와 중복
//	int refLeader;//leaderid와 중복
//	
	Date postedDate; 
	ArrayList<User> groupUsers;
	
	

	
	public StudyGroup(int numberOfUsers, String groupName, String description, int term, String meetingType,
			String genderType, String gradeType, int subjectId) {
		super();
		this.numberOfUsers = numberOfUsers;
		this.groupName = groupName;
		this.description = description;
		this.term = term;
		this.meetingType = meetingType;
		this.genderType = genderType;
		this.gradeType = gradeType;
		this.subjectId = subjectId;
	}



	public StudyGroup() {
		
	}
	
=======
>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git
	
	public int getGroupId() {
		return groupId;
	}



	public void setGroupId(int _id) {
		this.groupId = _id;
	}



	public java.util.Date getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(java.util.Date createdDate) {
		this.createdDate = createdDate;
	}



	public int getNumberOfUsers() {
		return numberOfUsers;
	}



	public void setNumberOfUsers(int numberOfUsers) {
		this.numberOfUsers = numberOfUsers;
	}



	public String getGroupName() {
		return groupName;
	}



	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getTerm() {
		return term;
	}



	public void setTerm(int term) {
		this.term = term;
	}



	public String getMeetingType() {
		return meetingType;
	}



	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}



	public String getGenderType() {
		return genderType;
	}



	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}



	public String getGradeType() {
		return gradeType;
	}



	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}



	public int getSubjectId() {
		return subjectId;
	}



	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}



	public int getLeaderId() {
		return leaderId;
	}



	public void setLeaderId(int leaderId) {
		this.leaderId = leaderId;
	}
<<<<<<< HEAD



//	public int getRefSubject() {
//		return refSubject;
//	}
//
//
//
//	public void setRefSubject(int refSubject) {
//		this.refSubject = refSubject;
//	}
//
//
//
//	public int getRefLeader() {
//		return refLeader;
//	}
//
//
//
//	public void setRefLeader(int refLeader) {
//		this.refLeader = refLeader;
//	}
=======
>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git
}
