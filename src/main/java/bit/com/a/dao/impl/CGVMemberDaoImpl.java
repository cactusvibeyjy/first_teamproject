package bit.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.CGVMemberDao;
import bit.com.a.model.CGVMemberDto;
import bit.com.a.model.CGVNoMemberDto;

@Repository
public class CGVMemberDaoImpl implements CGVMemberDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean registerMember(CGVMemberDto dto) {
		int count = sqlSession.insert("register", dto);
		return count > 0 ? true : false;
	}

	@Override
	public String getId(String id) {
		
		String getId = sqlSession.selectOne("getId", id);
		if(getId == null) {
			getId = "";
		}
		return getId;
	}

	@Override
	public CGVMemberDto login(CGVMemberDto dto) {
		CGVMemberDto cgvMemberDto = sqlSession.selectOne("login", dto);
		return cgvMemberDto;
	}
	/*
	 * 회원정보 불러오기 /수정 / 탈퇴 & 비회원 예매 / 조회 / 취소
	 */
	@Override
	public CGVMemberDto getMemberInfo(CGVMemberDto dto) {
		return sqlSession.selectOne("getMemberInfo", dto);
	}

	@Override
	public boolean modifyMember(CGVMemberDto dto) {
		int count = sqlSession.update("modifyMember", dto); 
		return count > 0 ? true : false;
	}

	@Override
	public boolean deleteMember(String id) {
		int count = sqlSession.delete("deleteMember", id);
		return count > 0 ? true : false;
	}

	@Override
	public int isNoMember(CGVNoMemberDto noMemberDto) {
		return sqlSession.selectOne("isNoMember", noMemberDto);
	}

	@Override
	public void deleteMember(CGVNoMemberDto dto) {
		sqlSession.delete("deleteNoMember", dto);
		
	}

	@Override
	public void createNoMember(CGVNoMemberDto noMemberDto) {
		sqlSession.insert("createNoMember", noMemberDto);
	}
	
}
