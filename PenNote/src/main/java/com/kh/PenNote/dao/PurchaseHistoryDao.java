package com.kh.PenNote.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.PenNote.dto.PurchaseHistoryDto;
import com.kh.PenNote.mapper.PurchaseHistoryMapper;


@Repository
public class PurchaseHistoryDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PurchaseHistoryMapper purchaseHistoryMapper;

public List<PurchaseHistoryDto> selectList(String memberId){
	String sql="select * from purchase_history "
			+ "where giftcard_purchase_member=? "
			+ "order by giftcard_purchase_no desc";
	Object[] data={memberId};
	
	return jdbcTemplate.query(sql, purchaseHistoryMapper,data);
	
	
}

}
