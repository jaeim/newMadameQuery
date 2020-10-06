package DTO;

import java.util.ArrayList;
import java.util.Date;

public class StudyGroup {

	int _id; 
	Date postedDate; 
	Date createdDate; 

	String subjectName;
	int span; 
	int numberOfUsers; 
	
	User groupLeader; 
	ArrayList<User> groupUsers;
	
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
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
	
	public void addGroupUsers(User newUser) {
		this.groupUsers.add(newUser);
	}
	public void deleteGroupUser(User oldUser) {
		this.groupUsers.remove(oldUser);
	}
	
	
}
