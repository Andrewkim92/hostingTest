package com.common.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class utilFile {
	public static String uploadFile (String uploadPath,String originalName,byte[] fileData)throws Exception{
		
		UUID uid = UUID.randomUUID();
		
		String savedName= uid.toString() + "_"+originalName;
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName)!=null) {
			uploadedFileName =makeThumbnail(uploadPath, savedPath,savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath,String path,String fileName)throws Exception{
		String iconName =uploadPath + path+ File.separator+fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath+ File.separator+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath +File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath,yearPath,monthPath,datePath);
		
		System.out.println(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath =new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath +path,fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName=
				uploadPath + path + File.separator+"s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName=
				fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
	public static Map fileUpload2(HttpServletRequest req, HttpServletResponse rep) { // 파일이 저장될 path 설정
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
	}
	
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
