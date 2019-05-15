package cafe.jjdev.mall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import cafe.jjdev.mall.service.MemberService;
import cafe.jjdev.mall.vo.Member;

@Controller
public class MemberController {
	@Autowired private MemberService memberService;

	// 1. 로그인 폼 이동
	@GetMapping(value = "/member/login")
	public String getMember(HttpSession session){ //Spring이 session객체 자동 생성
		if(session.getAttribute("loginMember") != null) {
			return "/index";
		}
		else {
			return "/member/login";
		}
	}
	
	// 2. 로그인 액션 이동
	@PostMapping(value = "/member/login")
	public String getMember(HttpSession session, Member member) {
		Member loginMember = memberService.getMember(member);
		if(loginMember == null) {
			return "redirect:/member/login";
		}
		else {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}
	}
	
	// 3. 로그 아웃
	@GetMapping(value = "/member/logout")
	public String removeSession(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 4. 회원가입 폼
	@GetMapping(value = "/member/addMember")
	public String addMember(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "/index";
		}
		else {
			return "/member/addMember";
		}
	}
	
	// 5. 회원가입 액션
	@PostMapping(value = "/member/addMember")
	public String addMember(HttpSession session, Member member) {
		int result = memberService.addMember(member);
		if(result == 0) {
			return "redirect:/member/addMember";
		}
		else {
			//Member loginMember = memberService.getMember(member);
			Member loginMember = new Member();
			loginMember.setMemberId(member.getMemberId());
			loginMember.setMemberName(member.getMemberName());
			loginMember.setMemberLevel(member.getMemberLevel());
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}
	}
	
	// 6. 개인정보 확인
	@GetMapping(value = "/member/getMemberOne")
	public String getMemberOne(HttpSession session, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "/index";
		}
		else {
			model.addAttribute("member", memberService.getMemberOne((Member)session.getAttribute("loginMember")));
			return "/member/getMemberOne";
		}
	}
	
	// 7. 비밀번호 수정 폼
	@GetMapping(value = "/member/modifyMemberPw")
	public String modifyMemberPw(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "/index";
		}
		else {
			return "/member/modifyMemberPw";
		}
	}
	
	// 8. 비밀번호 수정 액션
	@PostMapping(value = "/member/modifyMemberPw")
	public String modifyMemberPw(HttpSession session, String memberPw1, String memberPw2, String memberPw3) {
		if(memberPw2.equals(memberPw3)) {
			Map<String, String> map = new HashMap<String, String>();
			Member loginMember = (Member)session.getAttribute("loginMember");
			map.put("memberId", loginMember.getMemberId());
			map.put("memberPw1", memberPw1);
			map.put("memberPw2", memberPw2);
			memberService.modifyMemberPw(map);
			System.out.println(map + " <- map |MemberController.modifyMemberPw");
		}
		
		return "redirect:/member/getMemberOne";
	}
	
	// 9. 회원정보 수정 폼
	@GetMapping(value = "/member/modifyMember")
	public String modifyMember(HttpSession session, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "/index";
		}
		else {
			model.addAttribute("member", memberService.getMemberOne((Member)session.getAttribute("loginMember")));
			return "/member/modifyMember";
		}
	}
	
	// 10. 회원정보 수정 액션
	@PostMapping(value = "/member/modifyMember")
	public String modifyMember(HttpSession session, Member member) {
		memberService.modifyMember(member);
		
		return "redirect:/member/getMemberOne";
	}
	
	// 11. 회원탈퇴 폼
	@GetMapping(value="/member/removeMember")
	public String removeMember(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "/index";
		}
		else {
			return "/member/removeMember";
		}
	}
	
	// 12. 회원탈퇴 액션
	@PostMapping(value="/member/removeMember")
	public String removeMember(HttpSession session, Member member) {
		int result = memberService.removeMember(member);
		
		if(result == 0) {
			return "redirect:/member/getMemberOne";
		}
		else {
			session.invalidate();
			return "redirect:/";
		}
	}
	
	
	// 13. 아이디 찾기
	@GetMapping(value="/member/getMemberId")
	public String getMemberId(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "/index";
		}
		else {
			return "/member/getMemberId";
		}
	}
	
	@PostMapping(value="/member/getMemberId")
	public String getMemberId(String memberEmail, Model model) {
		String memberId = memberService.getMemberIdByEmail(memberEmail);
		model.addAttribute("memberId", memberId);
		
		return "/member/id";
	}
	
	
	// 14. 비밀번호 찾기
	@GetMapping(value="/member/getMemberPw")
	public String getMemberPw(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "/index";
		}
		else {
			return "/member/getMemberPw";
		}
	}
	
	@PostMapping(value="/member/getMemberPw")
	public String getMemberPw(Member member) {
		memberService.getMemberPw(member);
		return "redirect:/";
	}
	
	// 15. member_out_id 테이블 생성 후 탈퇴 시 ID 저장
		// MemberService.addMember와 MemberService.removeMember에 코드 추가.
}
