package com.common.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.common.utils.utilFile;

@Controller
@RequestMapping("/upload")
public class UploadController {

	// Save the uploaded file to this folder
	private static String UPLOADED_FOLDER = "C://test//";

	@GetMapping("/")
	public String index() {
		return "upload";
	}

	/*@RequestMapping(value = "/fileUpload") // method = RequestMethod.GET
	public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { // 파일이 저장될 path 설정
		String path = "c://test";
		Map returnObject = new HashMap();
		try { // MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";
			List resultList = new ArrayList(); // 디레토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			} // 값이 나올때까지
			while (iter.hasNext()) {
				fieldName = (String) iter.next(); // 내용을 가져와서
				mfile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");// 한글꺠짐 방지

				// 파일명이 없다면
				if ("".equals(origName)) {
					continue;
				} // 파일 명 변경(uuid로 암호화)

				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
				String saveFileName = getUuid() + ext; // 설정한 path에 파일저장
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);
				Map file = new HashMap();
				file.put("origName", origName);
				file.put("sfile", serverFile);
				resultList.add(file);
			}
			returnObject.put("files", resultList);
			returnObject.put("params", mhsr.getParameterMap());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated
			e.printStackTrace();
		} catch (IllegalStateException e) { // TODO Auto-generated
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated
			e.printStackTrace();
		}
		return null;
	} // uuid생성
*/
	

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, String uploadPath) throws Exception {
		return new ResponseEntity<>(utilFile.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

	}

	@PostMapping("/upload") // //new annotation since 4.3
	public String singleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {

		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
			return "redirect:uploadStatus";
		}

		try {

			// Get the file and save it somewhere
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);

			redirectAttributes.addFlashAttribute("message",
					"You successfully uploaded '" + file.getOriginalFilename() + "'");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/uploadStatus";
	}

	@GetMapping("/uploadStatus")
	public String uploadStatus() {
		return "uploadStatus";
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public void uploadForm(MultipartFile file, Model model) throws Exception {

		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType());
	}
}
