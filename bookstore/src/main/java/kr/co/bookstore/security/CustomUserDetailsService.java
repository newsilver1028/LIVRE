package kr.co.bookstore.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.mapper.MemberMapper;
import kr.co.bookstore.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	
	/* 전달된 id로 사용자 정보를 검색. */
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("load user by userName : " + userName);
		LoginVO vo = memberMapper.read(userName);
		
		return vo == null ? null : new CustomUser(vo);

	}

}
