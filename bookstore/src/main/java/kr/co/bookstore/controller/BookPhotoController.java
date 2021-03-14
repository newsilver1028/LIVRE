package kr.co.bookstore.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bookstore.domain.GettingBookPhoto;
import lombok.extern.log4j.Log4j;

/**
 * 게시물 사진 처리 컨트롤러
 */
@Controller
@Log4j
public class BookPhotoController {
	String bookPhoto = "c:\\upload";

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<GettingBookPhoto>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<GettingBookPhoto> list = new ArrayList<>();
		log.info(uploadFile);
		String uploadFolderPath = getFolder();
		File uploadPath = new File(bookPhoto, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		for (MultipartFile multipartFile : uploadFile) {
			GettingBookPhoto bookphotos = new GettingBookPhoto();
			String uploadFileName = multipartFile.getOriginalFilename();			/* 파일의 원래 이름 저장. */
			
			log.info("uploadFileName_before :" + uploadFileName);

			
			/* 인터넷 익스플로러 경우, 예외 처리
			 * substring(index) : 인덱스를 포함하여 끝까지 읽어오기.
			 * lastIndexOf("문자") : 해당 문자가 마지막에 위치하는 위치값 리턴.
			 * 즉, 경로를 제외한 실제 파일명만 가져오기.
			 */
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("uploadFileName_after :" + uploadFileName);

			
			bookphotos.setFileName(uploadFileName);									/* 파일 이름 저장. */

			/*
			 * universal unique identifier, 범용 고유 식별자.
			 * 파일의 중복을 회피.
			 */
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);									/* 서버에 파일 저장. */

				bookphotos.setUuid(uuid.toString());
				bookphotos.setUploadPath(uploadFolderPath);

				list.add(bookphotos);												/* 업로드된 파일 정보를 객체 배열에 담아서 리턴. */
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	
	/*
	 * 파일 검색 시간을 줄이기 위해서
	 * 년월일로 구분하여 폴더를 생성하고 파일 저장.
	 * File.separator : 폴더 구분자를 운영체제에 맞춰서 변경.
	 */
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("delete: " + fileName);
		File file;
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
