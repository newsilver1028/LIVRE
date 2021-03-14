package kr.co.bookstore.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 로그인 VO
 */
@Data
public class LoginVO {
	private String userName;		// 사용자 ID
	private String userpw;			// 사용자 비밀번호
	private String usernikname;		// 사용자 이름
	private boolean enabled;		// 사용자 권한

	private Date regDate;			// 게시물 쓴 날짜
	private Date updateDate;		// 게시물 수정한 날짜
	private List<AuthVO> authList;	// 사용자 권한 리스트

	private String birth;			// 사용자 생년월일
	private String userpn;			// 사용자 전화번호
	private String usermail;		// 사용자 이메일
	private String useradd;			// 사용자 주소
	private String pwfind;			// 비밀번호 찾기 질문
	private String answer;			// 비밀번호 찾기 답변

}
