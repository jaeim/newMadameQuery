package model;

import java.util.ArrayList;
import java.util.Date;

public class StudyGroup {

	int _id;
	String subjectName; //과목이름
	int span ; // 기간 (term)
	int numberOfUsers ; // 스터디 그룹 인원
	String description; // 간단한 설명
	int genderType; // 성별( 0: 상관없음, 1: 남성, 2: 여성)
	int gradeType; // 학년 ( 1~4, 0 - 상관없음)
	int meetingType; //스터디 방식 지정
	
	Date postedDate; 
	Date createdDate; 

	User groupLeader; 
	ArrayList<User> groupUsers;
	
	public StudyGroup() {}
	
	public StudyGroup(int _id, String subjectName, int span, int numberOfUsers, String description, int genderType,
			int gradeType, int meetingType, User groupLeader) {
		super();
		this._id = _id;
		this.subjectName = subjectName;
		this.span = span;
		this.numberOfUsers = numberOfUsers;
		this.description = description;
		this.genderType = genderType;
		this.gradeType = gradeType;
		this.meetingType = meetingType;
		this.groupLeader = groupLeader;
	}
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getSpan() {
		return span;
	}
	public void setSpan(int span) {
		this.span = span;
	}
	public int getNumberOfUsers() {
		return numberOfUsers;
	}
	public void setNumberOfUsers(int numberOfUsers) {
		this.numberOfUsers = numberOfUsers;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public Date getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public User getGroupLeader() {
		return groupLeader;
	}
	public void setGroupLeader(User groupLeader) {
		this.groupLeader = groupLeader;
	}
	public ArrayList<User> getGroupUsers() {
		return groupUsers;
	}
	public void setGroupUsers(ArrayList<User> groupUsers) {
		this.groupUsers = groupUsers;
	}
	public int getMeetingType() {
		return meetingType;
	}
	public void setMeetingType(int meetingType) {
		this.meetingType = meetingType;
	}
	
}
