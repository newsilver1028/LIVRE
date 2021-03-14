package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 비밀번호 찾기 VO
 */
@Data
public class findPWVO {
	private String userName;	// 사용자 ID
	private String pwfind;		// 비밀번호 찾기 질문
	private String answer;		// 비밀번호 찾기 답변

}
