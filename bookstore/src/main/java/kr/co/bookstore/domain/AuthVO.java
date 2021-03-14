package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 사용자 권한 VO
 */
@Data
public class AuthVO {
	private String userName;	// 사용자 ID
	private String auth;		// 사용자 권한
}
