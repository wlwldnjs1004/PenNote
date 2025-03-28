package com.kh.PenNote.dto;




import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class WorkDto {

	private int workNo;
	private String workName;
	private String workId;
	private String workPrefer;
	private Timestamp workWtime;
	private String workPaid;
	private String workContract;
	private String workSubtotal;
	
}
