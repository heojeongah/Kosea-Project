package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Qna;
@Repository
public class ReadDaoImpl implements ReadDao {
	@Autowired
	private SqlSession session;
	public List<Qna> readQNA(Condition c) {
		return session.selectList("home.getQNAList",c);
	}

	public Integer getQnaCount() {
		return session.selectOne("home.getQnaCount");
	}

	public Qna getQnaDetail(Integer id) {
		return session.selectOne(
				"home.getQnaDetail",id);
	}

}



