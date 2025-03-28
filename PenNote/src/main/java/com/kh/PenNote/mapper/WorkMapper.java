package com.kh.PenNote.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.PenNote.dto.WorkDto;


@Component
public class WorkMapper implements RowMapper<WorkDto>{

	@Override
	public WorkDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		return WorkDto.builder()
				.workNo(rs.getInt("work_no"))
				.workName(rs.getString("work_name"))
				.workId(rs.getString("work_id"))
				.workPrefer(rs.getString("work_prefer"))
				.workWtime(rs.getTimestamp("work_wtime"))
				.workPaid(rs.getString("work_paid"))
				.workContract(rs.getString("work_contract"))
				.workSubtotal(rs.getString("work_subtotal"))
				.build();
	}

	
	
}
