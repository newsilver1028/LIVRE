package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 게시물 사진 업로드
 */
@Data
public class GettingBookPhoto {
	private String uuid;		//
	private String uploadPath;	// 사진을 업로드한 경로
	private String fileName;	// 사진을 업로드한 파일 이름
	private boolean fileType;	// 사진 유형(확장자)
	private Long bno;

}
