package model;

import java.util.*;

public class Post {
	private int _id; // 게시글 id
	private String title; // 게시글 제목
	private Date createdDate; //게시글 올린 날짜
	private Date modifiedDate; //게시글 수정 날짜
	private String userName; //글쓴이
	private String content; // 게시글 내용
	private int member_id; //member_id
	private int group_id; //group_id
	
	public Post() {
		super();
	}
	
	public Post(int _id, String title, Date createdDate, Date modifiedDate, String userName, String content,
			int refMember, int refGroup) {
		super();
		this._id = _id;
		this.title = title;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.userName = userName;
		this.content = content;
		this.member_id = refMember;
		this.group_id = refGroup;
	}

	public int get_id() {
		return _id;
	}
	
	public void set_id(int _id) {
		this._id = _id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	

	
	
}
