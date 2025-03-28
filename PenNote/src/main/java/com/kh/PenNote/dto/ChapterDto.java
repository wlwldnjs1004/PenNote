package com.kh.PenNote.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor @Builder
public class ChapterDto {

	private int chapterNo;
	private int workNo;
	private String chapterTitle;
	private String chapterDetail;
	private String chapterComment;
	private Timestamp chapterModified;
	private Timestamp chapterRecent;
	
}
