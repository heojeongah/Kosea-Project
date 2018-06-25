package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Delivery;
import model.SCondition;
@Repository
public class ReadDeliveryDaoImpl implements ReadDeliveryDao {
	@Autowired
	private SqlSession session;
	
	


	public Integer countState() {
		return session.selectOne("deli.countDeliveryState");
	}

	public Integer countState2() {
		return session.selectOne("deli.countDeliveryState2");
	}

	public List<Delivery> readDelivery(SCondition sc) {
		return session.selectList("deli.getDeliveryList",sc);
	}

	public Integer getDeliveryCount() {
		return session.selectOne("deli.getDeliveryCount");
	}

	public Delivery getDeliveryDetail(String d_number) {
		return session.selectOne("deli.getDeliveryDetail", d_number);
	}

	public void updateState(Delivery delivery) {
		session.update("deli.updateState", delivery);
	}

	public List<Delivery> getByState(SCondition sc) {
		return session.selectList("deli.getDeliveryByState",sc);
	}

}
