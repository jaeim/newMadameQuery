package com.example.repository.mapper;

import java.util.ArrayList;

import model.Comment;
import model.StudyGroup;

public interface CommentMapper {

	Comment selectCommentByPrimaryKey(int comment_id);
	
	ArrayList<Comment> selectAllComment(int postId);
	
	int selectCommentCount(int postId);
	
	int insertComment(Comment comment);
	
	int updateComment(Comment comment);
	
	int deleteComment(int comment_id);
	
	int deleteAllComments(int postId);
	
	ArrayList<StudyGroup> selectAllStudyGroup();
}
