package com.common.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.common.mapper.MemberMapper;
import com.common.utils.utilFile;
import com.common.vo.FileVO;
import com.common.vo.boardVO;

@Controller
@RequestMapping("/*")
public class mainController {

	@Autowired
	private MemberMapper mapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String jspFile(Model model) throws Exception {
		// System.out.println("index.jsp request");
		model.addAttribute("itemList", mapper.getAllItemList());
		
		return "index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) throws Exception {
		// System.out.println("index.jsp request");
		model.addAttribute("itemList", mapper.getAllItemList());
//		str s='11';
		return "test";
	}

	@RequestMapping(value = "/goCreateItem", method = RequestMethod.GET)
	public String goCreateItem(Model model) throws Exception {
		// model.addAttribute("vo", vo);
		return "createItem";

	}

	@RequestMapping(value = "/detailItem", method = RequestMethod.GET)
	public String detailItem(Model model, int bno) throws Exception {
		model.addAttribute("vo", mapper.getBoardDetail(bno));

		model.addAttribute("replyList", mapper.getReplyList(bno));

		return "createItem";
	}

	@RequestMapping(value = "/deleteItem", method = RequestMethod.POST)
	public String deleteItem(boardVO vo) throws Exception {
		// System.out.println("deleteItem start");

//		if (vo.getBno()) {
//			// error
//			// mapper.createItem(vo);
//		} else {
			mapper.deleteItem(vo);
//		}

		return "redirect:";
	}

	@RequestMapping(value = "/createItem", method = RequestMethod.POST)
	public String createItem(boardVO vo, FileVO fvo, @RequestPart MultipartFile files, HttpServletRequest req,
			HttpServletResponse rep) throws Exception {

		// utilFile.fileUpload2(req, rep);

		if(files.isEmpty()) {
			if (vo.getBno()<1) {
				mapper.createItem(vo);
			} else {
				mapper.updateItem(vo);
			}
		}else {
			
			FileVO file = new FileVO();

			String sourceFileName = files.getOriginalFilename();
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\Users\\qwerh\\git\\pro2\\travelPlanner\\src\\main\\webapp\\resources\\uploadImg\\";
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			if (vo.getBno()<1) {
				mapper.createItem(vo);
				file.setBno(vo.getBno());
				file.setFileName(destinationFileName);
				file.setFileOriName(sourceFileName);
				file.setFileUrl(fileUrl);
				System.out.println(file.getBno());
				mapper.fileInsert(file);
			} else {
				mapper.updateItem(vo);
			}
		}
		return "redirect:";
	}

}
