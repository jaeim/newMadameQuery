package model;

import java.util.*;

public class Comment {
	private int _id; // 댓글 번호(id)
	private User userName; //댓글 올린 사람 이름
	private Date uploadDate; //댓글 올린 날짜
	private String commentText; // 댓글 내용
	
	
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	
	
}
