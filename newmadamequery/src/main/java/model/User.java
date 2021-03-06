package model;

import java.util.Date;

/*
 * 사용자 관리를 위한 user dto. USERINFO 테이블과 대응됨
 */
public class User {

	private int member_id;
	private String email;
	private String password;
	private String name;
	private java.util.Date dob;
	private String phone;
	private java.util.Date date_of_join;
	private String university;
	private String department;
	private String grade;
	private int gender;

	public User() {
		dob = null;
		date_of_join = null;

	} // 기본 생성자

	public User(int member_id, String email, String password, String name, Date dob, String phone, Date date_of_join,
			String university, String department, String grade, int gender) {
		super();
		this.member_id = member_id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.date_of_join = date_of_join;
		this.university = university;
		this.department = department;
		this.grade = grade;
		this.gender = gender;
	}

	public User(String email, String password, String name, Date dob, String phone, String university,
			String department, String grade, int gender) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.university = university;
		this.department = department;
		this.grade = grade;
		this.gender = gender;
	}
	
	public User(String email, String password, String name, String phone, String university,
			String department, String grade, int gender) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.university = university;
		this.department = department;
		this.grade = grade;
		this.gender = gender;
	}

	public User(int member_id, String email, String password, String name, String phone, String university,
			String department, String grade, int gender) {
		super();
		this.member_id = member_id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.university = university;
		this.department = department;
		this.grade = grade;
		this.gender = gender;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public java.util.Date getDob() {
		return dob;
	}

	public void setDob(java.util.Date dob) {
		this.dob = dob;
	}

	public java.util.Date getDate_of_join() {
		return date_of_join;
	}

	public void setDate_of_join(java.util.Date date_of_join) {
		this.date_of_join = date_of_join;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}

	public boolean isSameUser(int userid) {
		if (this.member_id == member_id)
			return true;
		return false;
	}

	@Override
	public String toString() {
		return "User [userId=" + member_id + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", university=" + university + ", department=" + department + ", grade=" + grade
				+ "]";
	}

}
