package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance(){
		return (dao == null) ? dao = new IMemberDaoImpl() : dao;
	}
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		
		return (MemberVO) client.queryForObject("member.memberInfo",params);
			
			
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {
		return client.queryForList("member.memberList", params);
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception {
		client.update("member.deleteMember", params);
		
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		//update 쿼리
		//테이블 생성
		//프로시저, 펑션을 작성 및 호출
		//오라클 객체 생성
		//client.update(arg0)
		client.update("member.updateMember",memberInfo);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception{
		try {
			client.insert("member.insert",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int totalCount() throws Exception {
		return (int) client.queryForObject("member.totalCount");
	}


}
