package dao;

import java.util.List;

import model.Condition;
import model.Qna;

public interface ReadDao {
	List<Qna> readQNA(Condition c);
	Integer getQnaCount();
	Qna getQnaDetail(Integer id);
}










