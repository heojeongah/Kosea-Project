package dao;

import java.util.List;

import model.Comment;
import model.Condition;
import model.Product;


public interface CommentDao {
	void insertComment(Comment comment);
	Integer getMaxCommentId();
	List<Comment> getCommentDetail(Condition c);
	Integer getCommentCount();
	List<Comment> getWriting(Condition c);
	Comment getWritingInfoById(Integer id);
	Comment getCommentGrade(String code);
	void updateProductGrade(Product p);
	Integer selectImageCount();
	Integer selectMaxGoupId();
	void updateGoupIdReply(Comment comment);
	String selectReplyPages(String content);
	void updateCommentInfo(Comment comment);
	void deleteComment(String comment_id);
}








