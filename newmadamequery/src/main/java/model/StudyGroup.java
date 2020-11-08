package model;
//<<<<<<< HEAD

import java.util.Date;

//=======
//>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git

import java.util.ArrayList;

public class StudyGroup {

	int _id;
	Date createdDate; // 생성일
	int numberOfUsers ; // 스터디 그룹 인원
	String groupName; //그룹명
	String description; //간단한 설명
	int term; // 기간
	int meetingType; // 만남의 방식
	int genderType; // 성별( 0: 상관없음, 1: 남성, 2: 여성)
	int gradeType; // 학년 ( 1~4, 0 - 상관없음)	
	String subjectId; //과목id
	String leaderId;

	ArrayList<User> groupUsers;
	
	public StudyGroup() {}

	public StudyGroup(int _id, Date createdDate, int numberOfUsers, String groupName, String description, int term,
			int meetingType, int genderType, int gradeType, String subjectId, String leaderId,
			ArrayList<User> groupUsers) {
		super();
		this._id = _id;
		this.createdDate = createdDate;
		this.numberOfUsers = numberOfUsers;
		this.groupName = groupName;
		this.description = description;
		this.term = term;
		this.meetingType = meetingType;
		this.genderType = genderType;
		this.gradeType = gradeType;
		this.subjectId = subjectId;
		this.leaderId = leaderId;
		this.groupUsers = groupUsers;
	}



	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
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

	public int getMeetingType() {
		return meetingType;
	}

	public void setMeetingType(int meetingType) {
		this.meetingType = meetingType;
	}

	public int getGenderType() {
		return genderType;
	}

	public void setGenderType(int genderType) {
		this.genderType = genderType;
	}

	public int getGradeType() {
		return gradeType;
	}

	public void setGradeType(int gradeType) {
		this.gradeType = gradeType;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public ArrayList<User> getGroupUsers() {
		return groupUsers;
	}

	public void setGroupUsers(ArrayList<User> groupUsers) {
		this.groupUsers = groupUsers;
	}
	

	
//<<<<<<< HEAD
	
	// 그룹 유저들을 찾는 메소드 정의 할 것(manager이용) -> groupUsers
	
//=======
//>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git
}
