package com.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.common.mapper.MemberMapper;
import com.common.utils.utilFile;
import com.common.vo.boardVO;

@Controller
@RequestMapping("/*")
public class mainController {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private utilFile utils;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String jspFile(Model model) throws Exception {
		System.out.println("index.jsp request");
		model.addAttribute("itemList", mapper.getAllItemList());
		
		return "index";
	}

	@RequestMapping(value = "/goCreateItem", method = RequestMethod.GET)
	public String goCreateItem(Model model) throws Exception {
		// model.addAttribute("vo", vo);
		return "createItem";

	}
	
	@RequestMapping(value = "/detailItem", method = RequestMethod.GET)
	public String detailItem(Model model,int bno) throws Exception {
		model.addAttribute("vo", mapper.getBoardDetail(bno));
		
		model.addAttribute("ReplyList", mapper.getReplyList(bno));
		
		return "createItem";
	}
	
	@RequestMapping(value = "/deleteItem", method = RequestMethod.POST)
	public String deleteItem(boardVO vo) throws Exception {
//		System.out.println("deleteItem start");
		
		if(vo.getBno().equals(null) || vo.getBno().equals("")) {
			//error
//			mapper.createItem(vo);
		}else {
			mapper.deleteItem(vo);
		}
				
		return "redirect:";
	}
	
	@RequestMapping(value = "/createReply", method = RequestMethod.POST)
	public String createReply(boardVO vo) throws Exception {
		
//		if(vo.getBno().equals(null) || vo.getBno().equals("")) {
			//error
			mapper.createReply(vo);
//		}else {
//			mapper.updateReply(vo);
//		}
				
		return "redirect:";
	}

	@RequestMapping(value = "/createItem", method = RequestMethod.POST)
	public String createItem(boardVO vo,@RequestPart MultipartFile file,HttpServletRequest req, HttpServletResponse rep) throws Exception {
        
		utilFile.fileUpload2(req,rep);
		
		if(vo.getBno().equals(null) || vo.getBno().equals("")) {
			mapper.createItem(vo);
		}else {
			mapper.updateItem(vo);
		}
				
		return "redirect:";
	}

}
