package com.kh.PenNote.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.PenNote.dto.ChapterDto;


@Component
public class ChapterMapper implements RowMapper<ChapterDto>{

	@Override
	public ChapterDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		return ChapterDto.builder()
				.chapterNo(rs.getInt("chapter_no"))
				.workNo(rs.getInt("work_no"))
				.chapterTitle(rs.getString("chapter_title"))
				.chapterDetail(rs.getString("chapter_detail"))
				.chapterComment(rs.getString("chapter_comment"))
				.chapterModified(rs.getTimestamp("chapter_modified"))
				.chapterRecent(rs.getTimestamp("chapter_recent"))
				.build();
	}

}
