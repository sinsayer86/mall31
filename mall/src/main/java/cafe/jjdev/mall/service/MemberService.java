package cafe.jjdev.mall.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.MemberMapper;
import cafe.jjdev.mall.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private JavaMailSender emailSender;
	
	// 로그인 처리
	public Member getMember(Member member) {
		Member loginMember = memberMapper.selectMember(member);
		System.out.println(loginMember.toString() + " <- loginMember |MemberService.getMember");
		return loginMember;
	}
	
	// 회원 가입 처리
	public int addMember(Member member) {
		System.out.println(member.toString() + " <- member |MemberService.getMember");
		int result = 0;
		if(memberMapper.selectMemberId(member) == null) {
			result = memberMapper.insertMember(member);
			System.out.println(result + " <- result |MemberService.getMember");
		}
		
		return result;
	}
	
	// 개인정보 확인 처리
	public Member getMemberOne(Member member) {
		return memberMapper.selectMemberOne(member);
	}
	
	// 회원 비밀번호 수정 처리
	public void modifyMemberPw(Map<String, String> map) {
		memberMapper.updateMemberPw(map);
	}
	
	// 회원정보 수정 처리
	public void modifyMember(Member member) {
		memberMapper.updateMember(member);
	}
	
	// 회원 탈퇴 처리
	public int removeMember(Member member) {
		int result = memberMapper.deleteMember(member); //회원정보 삭제
		if(result != 0) {
			memberMapper.insertMemberId(member); //아이디 저장
		}
		
		return result;
	}
	
	// 아이디 찾기 처리
    public String getMemberIdByEmail(String memberEmail) {
    	return memberMapper.selectMemberIdByEmail(memberEmail);
	}
    
    // 비밀번호 찾기 및 이메일 전송 처리
    public void getMemberPw(Member member) {
    	Member selectMember = memberMapper.selectMemberPw(member);
    	System.out.println(selectMember.toString() + " <- selectMember.toString() |MemberService.getMemberPw");
    	UUID uuid = UUID.randomUUID();
		String randomPw = uuid.toString().replace("-", "");
    	
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", selectMember.getMemberId());
		map.put("memberPw1", selectMember.getMemberPw());
		map.put("memberPw2", randomPw);
		
    	int result = memberMapper.updateMemberPw(map);
    	if(result != 0) {
    		SimpleMailMessage message = new SimpleMailMessage();
        	message.setFrom("Mitsumine");
            message.setTo(selectMember.getMemberEmail());
            message.setSubject(selectMember.getMemberId() + " SEND PASSWORD");
            message.setText("임시 비밀번호\n" + randomPw);
            
            emailSender.send(message);
    	}
    }
}
