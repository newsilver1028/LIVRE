package kr.co.bookstore.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.bookstore.domain.LoginVO;


public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	private LoginVO member;

	
	public CustomUser(String userName, String userpw, Collection<? extends GrantedAuthority> authorities) {
		super(userName, userpw, authorities);
		
	}

	
	
	/*
	 * 사용자가 로그인 창에서 아이디와 패스워드를 입력하면,
	 * 해당 아이디를 가지고 일치하는 회원 정보를 찾기.(서비스 처리)
	 */
	public CustomUser(LoginVO vo) {
		super(vo.getUserName(), vo.getUserpw(), vo.getAuthList().stream().map(auth ->
		new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member=vo;					// 사용자 아이디, 패스워드, 권한 목록으로 초기화.

	}
}
