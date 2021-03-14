package kr.co.bookstore.mapper;

import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.domain.NoticePWVO;
import kr.co.bookstore.domain.findIDVO;
import kr.co.bookstore.domain.findPWVO;

/**
 * 로그인, 회원가입, 아이디 찾기, 비밀번호 찾기 Mapper
 */
public interface MemberMapper {
	
	public LoginVO read(String ID);				// 회원 정보 테이블과 회원 권한 테이블을 조인하여 1개의 타입으로 회원 관련 정보를 리턴

	public void join(LoginVO vo);				// 회원가입 기능

	public LoginVO findpw(LoginVO vo);			// 비밀번호 찾기 기능

	public void userauth(String userName);		// 사용자 ID와 권한 삽입 기능

	public String findid(findIDVO vo);			// 아이디 찾기 기능

	public String findpw(findPWVO vo);			// 비밀번호 찾기 기능

	public int idCheck(String memberId);		// 아이디 식별 기능

	public void update(NoticePWVO pw);			// 비밀번호 변경 기능

	public LoginVO loginfo(String name);		// 사용자 ID 찾기에 필요한 이름 가져오기

	public void modifyinfo(LoginVO vo);			// 사용자 ID와 일치하는 log 테이블의 정보 수정

	public void modifyinfo2(LoginVO vo);		// 사용자 ID와 일치하는 log 테이블의 정보 수정
}
