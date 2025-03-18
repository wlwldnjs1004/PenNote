package com.kh.spring09.controller;

import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring09.dao.CertDao;
import com.kh.spring09.dao.MemberDao;
import com.kh.spring09.dao.PurchaseHistoryDao;
import com.kh.spring09.dto.CertDto;
import com.kh.spring09.dto.MemberDto;
import com.kh.spring09.error.NoPermissionException;
import com.kh.spring09.service.EmailService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PurchaseHistoryDao purchaseHistoryDao;
	@Autowired
	private CertDao certDao;
	@Autowired
	private EmailService emailService;
	
	//회원가입 매핑
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto, 
			@RequestParam String certNumber) throws MessagingException, IOException {
		//이메일과 인증번호를 이용한 이메일 진위여부 검사 추가
		CertDto certDto = certDao.selectOne(memberDto.getMemberEmail());
		if(certDto == null) //인증메일 발송내역이 없을 때
			throw new NoPermissionException("비정상적인 회원가입");
		if(certNumber.equals(certDto.getCertNumber()) == false)//번호 다름
			throw new NoPermissionException("비정상적인 회원가입");
		if(certDto.getCertConfirm() == null) //인증을 완료하지 않은 경우
			throw new NoPermissionException("비정상적인 회원가입");
		
		certDao.delete(memberDto.getMemberEmail());
		memberDao.insert(memberDto);//회원가입
		emailService.sendWelcomeMail(memberDto);//환영메일 발송
		return "redirect:joinFinish";
	}
	@RequestMapping("/joinFinish")
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
	}
	
	//로그인 매핑
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/member/login.jsp";
	}
	
	//HttpSession 추가
	//- 사용자별로 무언가 다른 정보를 기록해야 할 필요가 있을 때 사용
	//- Model처럼 선언만 하면 자동으로 스프링이 제공해줌
	//- 데이터 추가 : session.setAttribute("key", value);
	//- 데이터 추출 : session.getAttribute("key")
	//- 데이터 제거 : session.removeAttribute("key")
	//- 목표 : 로그인 성공 시 이 회원의 정보를 세션에 저장 (PK)
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto,
								@RequestParam(required = false) String remember,
								HttpSession session,
								HttpServletResponse response) {
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());
		//아이디가 없으면 findDto는 null이다
		if(findDto == null) {//아이디 없음
			return "redirect:login?error";//로그인 페이지로 쫓아낸다
		}
		//아이디가 있으면 비밀번호 검사를 진행
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw());
		if(isValid) {//로그인 성공 시
			
			//(+추가) 세션에 userId란 이름으로 사용자의 ID를 저장
			session.setAttribute("userId", findDto.getMemberId());
			//(+추가) 세션에 userLevel이란 이름으로 사용자의 등급을 저장
			session.setAttribute("userLevel", findDto.getMemberLevel());
			
			//(+추가) 최종 로그인 시각을 갱신 처리
			memberDao.updateMemberLogin(findDto.getMemberId());
			
			//(+추가) 아이디 저장하기에 대해 쿠키 생성/소멸 처리
			if(remember == null) {//쿠키 소멸
				Cookie cookie = new Cookie("saveId", memberDto.getMemberId());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			else {//쿠키 생성
				Cookie cookie = new Cookie("saveId", memberDto.getMemberId());
				cookie.setMaxAge(4*7*24*60*60);//4주
				response.addCookie(cookie);
			}
			
			return "redirect:/";
		}
		else {//비밀번호 다름
			return "redirect:login?error";//로그인 페이지로 쫓아낸다
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		//session.invalidate();//세션 소멸 명령
		return "redirect:/";
	}
	

	//마이페이지(내정보) 매핑
	//- 현재 로그인한 회원의 모든 정보가 화면에 출력 (단, 비밀번호 제외)
	//- HttpSession에 있는 아이디를 꺼내 회원의 모든 정보를 조회
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");//내 아이디 추출
		MemberDto memberDto = memberDao.selectOne(userId);//내정보 획득
		model.addAttribute("memberDto", memberDto);
		
		model.addAttribute("purchaseHistoryList", purchaseHistoryDao.selectList(userId));
		return "/WEB-INF/views/member/mypage.jsp";
	}
	
	//비밀번호 변경 매핑
	@GetMapping("/password")
	public String password() {
		return "/WEB-INF/views/member/password.jsp";
	}
	@PostMapping("/password")
	public String password(@RequestParam String currentPw,
				@RequestParam String newPw, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		boolean isValid = currentPw.equals(memberDto.getMemberPw());
		if(isValid == false) {//비밀번호가 일치하지 않는 경우
			return "redirect:password?error=1";
		}
		
		//(+추가) 동일한 비밀번호로는 변경할 수 없도록 차단 처리
		if(currentPw.equals(newPw)) {
			return "redirect:password?error=2";
		}
		memberDto.setMemberPw(newPw);//비밀번호 변경
		memberDao.updateMemberPassword(memberDto);
		return "redirect:mypage";
	}
	
	//개인정보 변경 매핑
	//- 비밀번호는 검사용으로 사용
	//- 닉네임, 생년월일, 연락처, 이메일, 주소(우편,기본,상세) 변경 가능
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/member/change.jsp";
	}
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto memberDto,
																HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		MemberDto findDto = memberDao.selectOne(userId);
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw());
		if(isValid == false) {//비밀번호가 일치하지 않는다면
			return "redirect:change?error";
		}
		
		//findDto에 원하는 항목을 교체한 뒤 수정 요청
		findDto.setMemberNickname(memberDto.getMemberNickname());
		findDto.setMemberBirth(memberDto.getMemberBirth());
		findDto.setMemberContact(memberDto.getMemberContact());
		findDto.setMemberEmail(memberDto.getMemberEmail());
		findDto.setMemberPost(memberDto.getMemberPost());
		findDto.setMemberAddress1(memberDto.getMemberAddress1());
		findDto.setMemberAddress2(memberDto.getMemberAddress2());
		
		memberDao.update(findDto);
		return "redirect:mypage";
	}
	
	//회원 탈퇴 매핑
	@GetMapping("/exit")
	public String exit() {
		return "/WEB-INF/views/member/exit.jsp";
	}
	@PostMapping("/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		boolean isValid = memberPw.equals(memberDto.getMemberPw());
		if(isValid == false) {
			return "redirect:exit?error";
		}
		
		memberDao.delete(userId);
		//return "redirect:logout";
		session.removeAttribute("userId");
		return "redirect:exitFinish";
	}
	
	@RequestMapping("/exitFinish")
	public String exitFinish() {
		return "/WEB-INF/views/member/exitFinish.jsp";
	}
	
	//비밀번호 찾기 매핑
	@GetMapping("/findPw")
	public String findPw() {
		return "/WEB-INF/views/member/findPw.jsp";
	}
	
	@PostMapping("/findPw")
	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException, IOException {
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());
		if(findDto == null) { 
			//throw new TargetNotFoundException("존재하지 않는 아이디");
			return "redirect:findPw?error";
		}
		if(!findDto.getMemberEmail().equals(memberDto.getMemberEmail())) {
			//throw new NoPermissionException("이메일 정보 오류");
			return "redirect:findPw?error";
		}
		
		emailService.sendResetMail(memberDto);//재설정 메일 발송
		
		return "redirect:findPwSend";
	}
	
	@GetMapping("/findPwSend")
	public String findPwSend() {
		return "/WEB-INF/views/member/findPwSend.jsp";
	}
	
	//이 페이지들은 인증정보가 일치할 경우에만 접근을 허용
	@GetMapping("/reset")
	public String reset(@RequestParam String memberId, 
			Model model,
			@RequestParam String certEmail, 
			@RequestParam String certNumber) {
		CertDto certDto = certDao.selectOne(certEmail);
		if(certDto == null) 
			throw new NoPermissionException("허용되지 않는 접근");
		if(!certDto.getCertNumber().equals(certNumber))
			throw new NoPermissionException("허용되지 않는 접근");
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("certEmail", certEmail);
		model.addAttribute("certNumber", certNumber);
		return "/WEB-INF/views/member/reset.jsp";
	}
	
	@PostMapping("/reset")
	public String reset(@ModelAttribute MemberDto memberDto,
								@RequestParam String certEmail,
								@RequestParam String certNumber) {
		CertDto certDto = certDao.selectOne(certEmail);
		if(certDto == null) 
			throw new NoPermissionException("허용되지 않는 접근");
		if(!certDto.getCertNumber().equals(certNumber))
			throw new NoPermissionException("허용되지 않는 접근");
		
		certDao.delete(certEmail);//인증정보 삭제
				
		memberDao.updateMemberPassword(memberDto);
		return "redirect:resetFinish";
	}
	
	@GetMapping("/resetFinish")
	public String resetFinish() {
		return "/WEB-INF/views/member/resetFinish.jsp";
	}
}










