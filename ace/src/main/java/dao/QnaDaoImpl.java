package dao;

import java.util.Calendar;
import java.util.List;
import java.util.concurrent.locks.Condition;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {
	@Autowired
	private SqlSession session;
	
	public void updateWritingInfo(Qna c_id) {
		session.update("home.updateWritingInfo",c_id);
	}

	public Integer getMaxId() {
		Integer qna_id=session.selectOne(
				"home.getMaxId");
		if(qna_id == null) qna_id = 0;
		return qna_id;
	}

	public void insertQna(Qna qna) {
		qna.setQna_id(getMaxId()+1);
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int mon=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String w_date=year+"년"+mon+"월"+date+"일";
		qna.setW_date(w_date);
		session.insert("home.insertQna",qna);
	}

	public void insertWriting(Qna qna) {
		session.insert("home.insertQna",qna);
	}


	public List<Qna> getWriting(Condition c) {
		return session.selectList(
				"home.getWritingInfo",c);
	}

	public Qna getWritingInfoById(String c_id) {
		return session.selectOne(
				"home.getWritingInfoById",c_id);
	}
	public Integer selectMaxGoupId() {
		return session.selectOne(
				"home.selectMaxGroupId");
	}
	public void updateGoupIdReply(Qna qna) {
		session.update("home.updateGroupIdReply",qna);
	}

	public Integer selectReplyPages(Integer Qna_id) {
		return session.selectOne(
				"home.selectReplyPages",Qna_id);
	}

	public void deleteQna(Integer qna_id) {
		session.delete("home.deleteQna",qna_id);
		
	}

}




