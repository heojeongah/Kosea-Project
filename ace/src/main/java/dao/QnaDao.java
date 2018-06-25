package dao;

import java.util.List;
import java.util.concurrent.locks.Condition;

import model.Qna;

public interface QnaDao {
	Integer getMaxId();
	void insertQna(Qna qna);
	void insertWriting(Qna qna);
	List<Qna> getWriting(Condition c);
	Qna getWritingInfoById(String qna_id);
	Integer selectMaxGoupId();
	void updateGoupIdReply(Qna qna);
	Integer selectReplyPages(Integer qna_id);
	void deleteQna(Integer qna_id);
	void updateWritingInfo(Qna q);
}










