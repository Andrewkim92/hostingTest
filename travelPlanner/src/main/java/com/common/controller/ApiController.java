package com.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.common.mapper.replyMapper;
import com.common.vo.boardVO;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	replyMapper mapper;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody boardVO vo){
		
		ResponseEntity<String> entity =null;
		try {
			mapper.createReply(vo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
