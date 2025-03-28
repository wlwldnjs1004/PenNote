package com.kh.PenNote.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.PenNote.dto.ChapterDto;
import com.kh.PenNote.mapper.ChapterMapper;


@Repository
public class ChapterDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ChapterMapper chapterMapper;
	

	
	//챕터 등록
	public void insert(ChapterDto chapterDto) {
		String sql = "insert into chapter("
							+ "chapter_no, "
							+ "work_no, "
							+ "chapter_title, "
							+ "chapter_detail, "
							+ "chapter_comment "
						+ ") "
						+ "values(chapter_seq.nextval, ?,?,?,?)";
		Object[] data = {
				chapterDto.getWorkNo(),
	chapterDto.getChapterTitle(),
	chapterDto.getChapterDetail(),
	chapterDto.getChapterComment()
		};
		jdbcTemplate.update(sql, data);
	}

	//상세 페이지
	public ChapterDto seleOne(int chapterNo) {
		String sql="select * from chapter where chapter_no = ? ";
		Object[] data= {chapterNo};
		List<ChapterDto>list=jdbcTemplate.query(sql,chapterMapper,data);
		return list.isEmpty ()? null : list.get(0);
	}
	//챕터 리스트 
	public List<ChapterDto> selectList() {
		String sql = "select * from chapter";
		return jdbcTemplate.query(sql, chapterMapper);
	}
	
	
}
