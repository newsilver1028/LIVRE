package kr.co.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.domain.NoticePWVO;
import kr.co.bookstore.domain.findIDVO;
import kr.co.bookstore.domain.findPWVO;
import kr.co.bookstore.mapper.MemberMapper;
import kr.co.bookstore.service.BookService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 로그인, 회원가입, 아이디 찾기, 비밀번호 찾기 처리 컨트롤러
 * GetMapping, PostMapping, RequestMapping
 */
@Controller
@Log4j
public class LogController {
	@Setter(onMethod_ = @Autowired)
	private BookService service;

	/* 로그인 매핑 */
	@GetMapping("/loginform")
	public void loginInput(String error, String logout, Model model) {
		if (error != null)
			model.addAttribute("error","아이디나 비밀번호가 일치하지 않습니다.");
		if (logout != null) {
			model.addAttribute("logout","로그아웃");
		}
	}

	/* 로그아웃 매핑 */
	@GetMapping("/logoutform")
	public void logoutGet() {
		log.info("custom logout");
	}

	/* 회원가입 매핑 */
	@GetMapping("/membership")
	public void membership() {
		return;
	}

	@PostMapping("/membership")
	public String membership(LoginVO vo, RedirectAttributes rttr) {
		log.info(vo);
		service.member(vo);
		return "/loginform";
	}
	

	/* 아이디 찾기 매핑 */
	@GetMapping("/findID")
	public void findID() {
		return;
	}

	@RequestMapping(value = "/findID", method = RequestMethod.POST)
	@ResponseBody
	public String findID(findIDVO memberId) throws Exception {
		log.info("form에서 넘어온 데이터" + memberId);
		String result = service.findID(memberId);

		if (result == null) {

			return "fail"; 					/* 아이디 중복 */

		} else {

			return result; 					/* 아이디 중복 x */

		}
	}

	/* 비밀번호 찾기 매핑 */
	@GetMapping("/findPW")
	public void findPW() {
		return;
	}

	@RequestMapping(value = "/findPW", method = RequestMethod.POST)
	@ResponseBody
	public String findPW(findPWVO memberId) throws Exception {
		log.info("form에서 넘어온 데이터" + memberId);
		String result = service.findPW(memberId);
		log.info(result);
		if (result == null) {

			return "fail"; 					/* 아이디 중복 */

		} else {

			return "/noticePW"; 			/* 아이디 중복 x */

		}
	}

	@RequestMapping(value = "/memberIdck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		int result = service.idCheck(memberId);

		if (result != 0) {

			return "fail"; 					/* 아이디 중복 */

		} else {

			return "success"; 				/* 아이디 중복 x */

		}
	}

	/* 비밀번호 찾기 매핑 */
	@GetMapping("/noticePW")
	public void noticePW() {
		return;
	}

	@PostMapping("/noticePW")
	public String noticepw(findPWVO vo, RedirectAttributes rttr) {
		log.info(vo);
		service.findPW(vo);
		return "/loginform";
	}

	/* 비밀번호 변경 매핑 */
	@PostMapping("/update")
	public String update(NoticePWVO pw, RedirectAttributes rttr) {
		log.info(pw);
		String[] a = pw.getUserName().split("\\?");
		pw.setUserName(a[1]);
		service.update(pw);
		return "/loginform";
	} 

}
