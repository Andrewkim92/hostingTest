package com.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.common.mapper.searchMapper;
import com.common.vo.cityVO;

@RestController
@RequestMapping("/search")
public class SearchController {

	@Autowired
	searchMapper mapper;
	
	/*@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<List<boardVO>> register(@RequestBody String searchWord){
		ResponseEntity<List<boardVO>> entity =null;
		try {
			entity=new ResponseEntity<>(mapper.getDataList(searchWord),HttpStatus.OK);
//			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
//			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}*/
	
	@RequestMapping(value="/getLocationList", method=RequestMethod.POST)
	public ResponseEntity<List<cityVO>> getLocationList(@RequestBody String searchWord){
		ResponseEntity<List<cityVO>> entity =null;
		try {
			entity=new ResponseEntity<>(mapper.getLocationList(searchWord),HttpStatus.OK);
//			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
//			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
