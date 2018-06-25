package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Comment;
import model.Condition;
import model.Product;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired
	private SqlSession session;
	
	public void updateCommentInfo(Comment id) {
		session.update("home.updateCommentInfo",id);
	}

	public Integer getCommentCount() {
		return session.selectOne("home.getCommentCount");
	}

	public void insertComment(Comment comment) {
		session.insert("home.insertComment",comment);
	}

	public List<Comment> getCommentDetail(Condition c) {
		return session.selectList("home.getCommentDetail",c);
	}

	public void insertWriting(Comment comment) {
		session.insert("home.insertComment",comment);
	}

	public Integer getMaxCommentId() {
		return session.selectOne(
				"home.getMaxCommentId");
	}

	public List<Comment> getWriting(Condition c) {
		return session.selectList(
				"home.getWritingInfo",c);
	}

	public Comment getWritingInfoById(Integer id) {
		return session.selectOne(
				"home.getWritingInfoById",id);
	}
	public Integer selectImageCount() {
		return session.selectOne("home.selectImageCount");
	}//전체 이미지글 갯수
	public Integer selectMaxGoupId() {
		return session.selectOne(
				"home.selectMaxGroupId");
	}
	public void updateGoupIdReply(Comment comment) {
		session.update("home.updateGroupIdReply",comment);
	}

	public Integer selectReplyPages(Integer comment_id) {
		return session.selectOne(
				"home.selectReplyPages",comment_id);
	}


	public void deleteComment(String comment_id) {
		session.delete("home.deleteComment",comment_id);
		
	}

	public Comment getWritingInfoById(String comment_id) {
		return session.selectOne(
				"home.getWritingInfoById",comment_id);
	}

	public String selectReplyPages(String content) {
	
		return null;
	}
	
	public Comment getCommentGrade(String code) {
		return session.selectOne("home.getCommentGrade",code);
	}

	public void updateProductGrade(Product p) {
		session.update("home.updateProductGrade",p);
	}

}


