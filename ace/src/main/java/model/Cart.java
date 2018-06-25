package model;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;

@Service
public class Cart {
	@Autowired
	private CartDao cartDao;
	
	private LinkedList<String> codeList = 
		new LinkedList<String>();
	private LinkedList<Integer> numList=
		new LinkedList<Integer>();
	private LinkedList<Integer> sizeList=
			new LinkedList<Integer>();
	
	public int getP_size(int i) {
		return sizeList.get(i);
	}
	public void setSizeList(int index, Integer p_size) {
		sizeList.add(p_size);
	}
	
	public int getSize() {
		return codeList.size();
	}
	public int getNum(int i) {
		return numList.get(i);
	}
	public void setCodeList(int index,String p_code) {
		codeList.add(index,p_code);
	}
	public void setNumList(int index, Integer c_amount) {
		numList.add(c_amount);
	}
	
	public List<CartItem> getCart(String c_id){
		return cartDao.selectCart(c_id);
	}
	
	
	public void modifyItem(String p_code, int c_amount,
			String c_id, Integer p_size) throws ServletException {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(p_code) && sizeList.get(i) == p_size) {
				numList.set(i, c_amount);
				updateCart(p_code, c_amount, c_id, p_size);
			}
		}
	}
	
	public void deleteItem(String p_code, String c_id,Integer p_size) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(p_code) && sizeList.get(i).equals(p_size)) {
				codeList.remove(i);
				numList.remove(i);
				sizeList.remove(i);
				CartItem cartItem = new CartItem();
				cartItem.setP_code(p_code);
				cartItem.setC_id(c_id);
				cartItem.setP_size(p_size);
				cartDao.deleteCart(cartItem);
				return;
			}
		}
	}
	
	private void updateCart(String p_code, int c_amount,
			String c_id, Integer p_size) throws ServletException{
		CartItem cartItem = new CartItem();
		cartItem.setP_code(p_code);
		cartItem.setC_amount(c_amount);
		cartItem.setC_id(c_id);
		cartItem.setP_size(p_size);
		cartDao.updateCart(cartItem);
	}
	
	private void insertCart(String p_code, int c_amount,
			String c_id, Integer p_size) throws ServletException{
		Integer seqno = cartDao.selectMaxCart();
		if(seqno == null) seqno = 0;
		CartItem cartItem = new CartItem();
		cartItem.setSeqno(seqno + 1);
		cartItem.setP_code(p_code);
		cartItem.setC_amount(c_amount);
		cartItem.setC_id(c_id);
		cartItem.setP_size(p_size);
		cartDao.insertCart(cartItem);
	}
	
	public void addCart(String p_code, int c_amount,
			String c_id, Integer p_size) throws ServletException{
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(p_code) && sizeList.get(i).equals(p_size)) {
				numList.set(i, numList.get(i)+1);
				updateCart(p_code, numList.get(i), c_id, p_size);
				return;
			}
		}
			codeList.add(p_code); numList.add(c_amount); sizeList.add(p_size);
			insertCart(p_code, c_amount, c_id, p_size);
	}
}







































