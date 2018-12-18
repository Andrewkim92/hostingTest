package com.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.common.mapper.MemberMapper;

@RestController
@RequestMapping("/login")
public class loginController {

	@Autowired
	private MemberMapper mapper;

	@RequestMapping(value = "/goCreateItem", method = RequestMethod.GET)
	public String goCreateItem(Model model) throws Exception {
		// model.addAttribute("vo", vo);
		return "createItem";
	}
	
	@RequestMapping(value = "/detailItem", method = RequestMethod.GET)
	public String detailItem(Model model,int bno) throws Exception {
		
		model.addAttribute("vo", mapper.getBoardDetail(bno));
		
		return "createItem";

	}

}
