package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	public MemberVO memberInfo(Map<String,String> params);
	public List<MemberVO> memberList(Map<String, String> params);
	public void deleteMemberInfo(Map<String,String> params);
	public void updateMemberInfo(MemberVO memberInfo);
	public void insertMember(MemberVO vo);
	public int totalCount(Map<String,String> params);
	public int updateAdminMember(MemberVO vo);
	public MemberVO selectByID(String string);
	
}