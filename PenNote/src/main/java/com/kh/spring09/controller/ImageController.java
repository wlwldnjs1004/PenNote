package com.kh.spring09.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ImageController {

	
	@GetMapping("/get-image")
	public ResponseEntity<Map<String, String>> gettImage(@RequestParam("postId")Long postId){
		
		String imageUrl= "http://localhost:8080/uploads/travel_"+postId+".jsg";
		
		Map<String, String> response=new HashMap<>();
		response.put("imageUrl", imageUrl);
		return ResponseEntity.ok(response);
		
	}
}
