package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Comment;
import model.SCondition;
@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired	
	private SqlSession session;
	public List<Comment> readCommentList(SCondition sc) {
		return session.selectList("home.getCommentList",sc);
	}

	public Integer getCommentCount() {
		return session.selectOne("home.getCommentCount");
	}

	public Comment getCommentDetail(String comment_id) {
		return session.selectOne("home.getCommentDetail", comment_id);
	}

}
