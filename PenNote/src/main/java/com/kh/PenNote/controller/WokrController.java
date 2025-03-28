package com.kh.PenNote.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.PenNote.dao.WorkDao;
import com.kh.PenNote.dto.WorkDto;
import com.kh.PenNote.mapper.WorkMapper;
import com.kh.PenNote.service.AttachmentService;


@Controller
@RequestMapping("/work")
public class WokrController {

	@Autowired
	private WorkDao workDao;
	
	@Autowired
	private WorkMapper workMapper;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@GetMapping("/add")
	public String add() {
			
		return"/WEB-INF/views/work/add.jsp"; 
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute WorkDto workDto,
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
		
		int workNo=workDao.sequence();
		workDto.setWorkNo(workNo);
		workDao.insert2(workDto);

		if(attach.isEmpty()==false) {
		
		int attachmentNo=attachmentService.save(attach);

		workDao.connect(workNo, attachmentNo);
		}
		
		
		return"/WEB-INF/views/work/addFinish.jsp"; 
	}
	@RequestMapping("/addFinish")//방식 무관
	public String add3() {
		return "/WEB-INF/views/work/addFinish.jsp";
	}
	@RequestMapping("/image")
	public String image(@RequestParam int workNo) {
		try {
			int attachmentNo = workDao.findAttachment(workNo);
			return "redirect:/attachment/download?attachmentNo="+attachmentNo;
		}
		catch(Exception e) {
			return "redirect:/images/empty.jpg";
			//return "redirect:https://placehold.co/400x400?text=P";
		}
	}
	@RequestMapping("/detail")
	public String detail(@RequestParam int workNo,Model model) {
		WorkDto workDto=workDao.seleOne(workNo);
		model.addAttribute("workDto",workDto);
		return"/WEB-INF/views/work/detail.jsp";
	}
}
