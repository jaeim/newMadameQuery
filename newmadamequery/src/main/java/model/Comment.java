package model;

import java.util.*;

public class Comment {
	private int comment_id; // 댓글 번호(comment_id)
	private User userName; //댓글 올린 사람 이름 (member_name을 대신 사용)
	private Date createdDate = null; //댓글 올린 날짜
	private Date modifiedDate = null; //댓글 수정 날짜
	private String content; // 댓글 내용
	private int postId; //post_id
	private int groupId;
	
	private int member_id; // 댓글 작성자의 멤버id
	private String member_name; // 댓글 작성자의 이름 (member 테이블과 조인해야 함)
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Comment(int comment_id, User userName, Date createdDate, Date modifiedDate, String content, int ref) {
		super();
		this.comment_id = comment_id;
		this.userName = userName;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.content = content;
		this.postId = ref;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int _id) {
		this.comment_id = _id;
	}
	public User getUserName() {
		return userName;
	}
	public void setUserName(User userName) {
		this.userName = userName;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int ref) {
		this.postId = ref;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}


	public int getMember_id() {
		return member_id;
	}


	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}


	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String memeber_name) {
		this.member_name = memeber_name;
	}
}
	

