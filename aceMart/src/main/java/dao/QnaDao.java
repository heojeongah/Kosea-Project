package dao;

import java.util.List;

import model.Condition;
import model.Qna;

public interface QnaDao {
	void updateQnaInfo(Qna writing);
	void deleteQnaInfo(Integer id);
	void insertQna(Qna writing);
	Integer getMaxQnaId();
	List<Qna> getQna(Condition c);
	Qna getQnaInfoById(Integer id);
	Integer selectQnaCount();
	Integer selectMaxGoupId();
	void updateQnaReply(Qna writing);
	Integer selectReplyPages(Integer seqno);
}










