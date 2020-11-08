package model;
import java.util.Date;
import java.util.ArrayList;

public class StudyGroup {

	int _id;
	java.util.Date createdDate; // 생성일
	int numberOfUsers ; // 스터디 그룹 인원
	String groupName; //그룹명
	String description; //간단한 설명
	int term; // 기간
	int meetingType; // 만남의 방식
	int genderType; // 성별( 0: 상관없음, 1: 남성, 2: 여성)
	int gradeType; // 학년 ( 1~4, 0 - 상관없음)	
	int subjectId; //과목id
	int leaderId;
	int refSubject;
	int refLeader;
	
	Date postedDate; 
	ArrayList<User> groupUsers;
	

	public StudyGroup() {
		
	}
	
	
	
	public int get_id() {
		return _id;
	}



	public void set_id(int _id) {
		this._id = _id;
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



	public int getRefSubject() {
		return refSubject;
	}



	public void setRefSubject(int refSubject) {
		this.refSubject = refSubject;
	}



	public int getRefLeader() {
		return refLeader;
	}



	public void setRefLeader(int refLeader) {
		this.refLeader = refLeader;
	}



	public Date getPostedDate() {
		return postedDate;
	}



	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}



	public ArrayList<User> getGroupUsers() {
		return groupUsers;
	}



	public void setGroupUsers(ArrayList<User> groupUsers) {
		this.groupUsers = groupUsers;
	}
}
