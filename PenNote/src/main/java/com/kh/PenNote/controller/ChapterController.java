package com.kh.PenNote.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.PenNote.dao.ChapterDao;
import com.kh.PenNote.dao.WorkDao;
import com.kh.PenNote.dto.ChapterDto;
import com.kh.PenNote.mapper.ChapterMapper;


@Controller
@RequestMapping("/chapter")
public class ChapterController {

	
	@Autowired
	private ChapterDao chapterDao;
	
	@Autowired
	private WorkDao workDao;
	
	@Autowired
	private ChapterMapper chapterMapper;
	
	
	 @GetMapping("/add")
	public String add() {
		 
		 return"/WEB-INF/views/chapter/add.jsp";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute ChapterDto chapterDto) {
		 chapterDao.insert(chapterDto);
		return"/WEB-INF/views/chapter/addFinish.jsp";
	}
	
	@RequestMapping("/addFinish")//방식 무관
	public String add3() {
		return "/WEB-INF/views/chapter/addFinish.jsp";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<ChapterDto> list = chapterDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/chapter/list.jsp";
	}
	
	
	
	@RequestMapping("/detail")
	public String detail(@RequestParam int chapterNo,Model model) {
		ChapterDto chapterDto=chapterDao.seleOne(chapterNo);
		model.addAttribute("chapterDto",chapterDto);
		return"/WEB-INF/views/chapter/detail.jsp";
	}
}
