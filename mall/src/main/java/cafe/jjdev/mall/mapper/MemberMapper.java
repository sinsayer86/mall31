package cafe.jjdev.mall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Member;

@Mapper
public interface MemberMapper {
	
	public Member selectMember(Member member); //회원 한 명 정보 선택 메서드(비밀번호 필요)
	public int insertMember(Member member); //회원 등록 메서드
	public Member selectMemberOne(Member member); //회원 한 명 정보 선택 메서드
	public int updateMemberPw(Map<String, String> map); //회원 비밀번호 수정 메서드
	public void updateMember(Member member); // 회원정보 수정 메서드
	public int deleteMember(Member member); //회원 탈퇴 메서드
	public void insertMemberId(Member member); //회원 탈퇴 시 아이디 저장 메서드
	public String selectMemberId(Member member); //아이디 중복 체크 메서드
	public String selectMemberIdByEmail(String memberEmail); //이메일로 아이디 가져오는 메서드
	public Member selectMemberPw(Member member); //아이디로 비밀번호와 이메일 가져오는 메서드
}
