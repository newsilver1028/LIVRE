package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 비밀번호 찾기 VO
 */
@Data
public class NoticePWVO {
	private String userpw;		// 사용자 전화번호
	private String userName;	// 사용자 이름
}
