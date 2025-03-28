package com.kh.PenNote.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.PenNote.dto.WorkDto;
import com.kh.PenNote.mapper.WorkMapper;




@Repository
public class WorkDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private WorkMapper workMapper;
	
	
	
	//커버 등록 
	public void insert(WorkDto workDto) {
		String sql = "insert into work("
							+ "work_no, "
							+ "work_name, "
							+ "work_id, "
							+ "work_prefer, "
							+ "work_paid, "
							+ "work_contract, "
							+ "work_subtotal "
						+ ") "
						+ "values(work_seq.nextval, ?,?,?,?,?,?)";
		Object[] data = {
				workDto.getWorkName(),
				workDto.getWorkId(),
				workDto.getWorkPrefer(),
				workDto.getWorkPaid(),
				workDto.getWorkContract(),
				workDto.getWorkSubtotal()
		};
		jdbcTemplate.update(sql, data);
	}
	
	public void insert2(WorkDto workDto) {
		String sql = "insert into work("
							+ "work_no, "
							+ "work_name, "
							+ "work_id, "
							+ "work_prefer, "
							+ "work_paid, "
							+ "work_contract, "
							+ "work_subtotal "
						+ ")"
						+ "values(?,?,?,?,?,?,?)";
		Object[] data = {
				workDto.getWorkNo(),
				workDto.getWorkName(),
				workDto.getWorkId(),
				workDto.getWorkPrefer(),
				workDto.getWorkPaid(),
				workDto.getWorkContract(),
				workDto.getWorkSubtotal()
		};
		jdbcTemplate.update(sql, data);
	}
	
	
	public int sequence() {
		String sql = "select work_seq.nextval from dual";//dual=임시테이블
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	//목록 조회
	public List<WorkDto> selectList() {
		String sql = "select * from work ";
		return jdbcTemplate.query(sql, workMapper);
	}
	
	
	//상세 페이지
	public WorkDto seleOne(int workNo) {
		String sql="select * from work where work_no = ? ";
		Object[] data= {workNo};
		List<WorkDto>list=jdbcTemplate.query(sql,workMapper,data);
		return list.isEmpty ()? null : list.get(0);
	}

	public int findAttachment(int workNo) {
		String sql = "select attachment_no from work_profile "
						+ "where work_no=?";
		Object[] data = {workNo};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	public void connect(int workNo, int attachmentNo) {
		String sql = "insert into work_profile ("
							+ "work_no, attachment_no"
					+ ") values(?, ?)";
		Object[] data = { workNo, attachmentNo };
		jdbcTemplate.update(sql, data);
	}
	

}

