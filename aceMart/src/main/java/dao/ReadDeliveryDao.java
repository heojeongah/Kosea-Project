package dao;

import java.util.List;

import model.Delivery;
import model.SCondition;

public interface ReadDeliveryDao {
	List<Delivery> readDelivery(SCondition sc);
	Integer getDeliveryCount();
	Delivery getDeliveryDetail(String d_number);
	List<Delivery> getByState(SCondition sc);
	void updateState(Delivery delivery);
	Integer countState();
	Integer countState2();

}
