package dao;

import java.util.List;

import model.Comment;
import model.SCondition;


public interface CommentDao {
	List<Comment> readCommentList(SCondition sc);
	Integer getCommentCount();
	Comment getCommentDetail(String comment_id);
}
