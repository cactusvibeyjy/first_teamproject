package bit.com.a.service;

import bit.com.a.model.CGVMemberDto;
import bit.com.a.model.CGVNoMemberDto;

public interface CGVMemberService {
	public boolean registerMember(CGVMemberDto dto);
	public boolean getId(String id);
	public CGVMemberDto login(CGVMemberDto dto);
	public CGVMemberDto getMemberInfo(CGVMemberDto param);
	public boolean modifyMember(CGVMemberDto dto);
	public boolean deleteMember(String string);
	public int isNoMember(CGVNoMemberDto noMemberDto);
	public void deleteNoMember(CGVNoMemberDto dto);
	public void createNoMember(CGVNoMemberDto noMemberDto);
}
