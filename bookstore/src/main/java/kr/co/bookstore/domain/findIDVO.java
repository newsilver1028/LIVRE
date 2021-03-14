package kr.co.bookstore.domain;

import lombok.Data;

/**
 * ID 찾기 VO
 */
@Data
public class findIDVO {
	
	private String userpn;		// 사용자 전화번호
	private String usermail;	// 사용자 이메일
	private String birth;		// 사용자 생년월일
	private String usernikname;	// 사용자 이름
}
