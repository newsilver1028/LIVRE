package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 게시물 사진 경로
 */
@Data
public class FileURLandBNO {
	private String URL;		// 사진을 업로드한 파일 경로
	private Long bno;
}
