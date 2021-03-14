package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 비밀번호 찾기 VO
 */
@Data
public class AnswerVO {
	private String pwfind;	// 비밀번호 찾기 질문
	private String answer;	// 비밀번호 찾기 답변
}
