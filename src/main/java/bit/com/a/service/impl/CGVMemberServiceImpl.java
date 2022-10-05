package bit.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.CGVMemberDao;
import bit.com.a.model.CGVMemberDto;
import bit.com.a.model.CGVNoMemberDto;
import bit.com.a.service.CGVMemberService;

@Service
public class CGVMemberServiceImpl implements CGVMemberService {

	@Autowired
	CGVMemberDao cgvMemberDao;
	
	@Override
	public boolean registerMember(CGVMemberDto dto) {
		
		return cgvMemberDao.registerMember(dto);
	}

	@Override
	public boolean getId(String id) {
		System.out.println("The ID is" + id);
		String getId = cgvMemberDao.getId(id);
		if(!getId.equals("") && getId != null) {
			return true;
		}
		return false;
		
	}

	@Override
	public CGVMemberDto login(CGVMemberDto dto) {
		
		return cgvMemberDao.login(dto);
	}

	@Override
	public CGVMemberDto getMemberInfo(CGVMemberDto param) {
		return cgvMemberDao.getMemberInfo(param);
	}

	@Override
	public boolean modifyMember(CGVMemberDto dto) {
		return cgvMemberDao.modifyMember(dto);
	}

	@Override
	public boolean deleteMember(String id) {
		// TODO Auto-generated method stub
		return cgvMemberDao.deleteMember(id);
	}

	@Override
	public int isNoMember(CGVNoMemberDto noMemberDto) {
		return cgvMemberDao.isNoMember(noMemberDto);
	}

	@Override
	public void deleteNoMember(CGVNoMemberDto dto) {
		cgvMemberDao.deleteMember(dto);
	}

	@Override
	public void createNoMember(CGVNoMemberDto noMemberDto) {
		cgvMemberDao.createNoMember(noMemberDto);
	}

}
