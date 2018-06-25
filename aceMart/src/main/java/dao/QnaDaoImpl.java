package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Qna;
@Repository
public class QnaDaoImpl implements QnaDao {
	@Autowired
	private SqlSession session;
	public void insertQna(Qna qna) {
		session.insert("qna.insertQna",qna);
	}

	public Integer getMaxQnaId() {
		return session.selectOne(
				"qna.getMaxQnaId");
	}

	public List<Qna> getQna(Condition c) {
		return session.selectList(
				"qna.selectQnaByCond",c);
	}

	public Qna getQnaInfoById(Integer id) {
		return session.selectOne(
				"qna.getQnaInfoById",id);
	}
	public Integer selectQnaCount() {
		return session.selectOne("qna.selectQnaCount");
	}//전체 이미지글 갯수
	public Integer selectMaxGoupId() {
		return session.selectOne(
				"qna.selectMaxGroupId");
	}
	public void updateQnaReply(Qna qna) {
		session.update("qna.updateQnaReply",qna);
	}

	public Integer selectReplyPages(Integer seqno) {
		return session.selectOne(
				"qna.selectReplyPages",seqno);
	}

	public void deleteQnaInfo(Integer id) {
		session.delete("qna.deleteQnaInfo",id);
	}

	public void updateQnaInfo(Qna qna) {
		session.update("qna.updateQnaInfo",qna);
	}

}



