package bit.com.a.dao;

import bit.com.a.model.CGVMemberDto;
import bit.com.a.model.CGVNoMemberDto;

public interface CGVMemberDao {
	public boolean registerMember(CGVMemberDto dto);
	public String getId(String id);
	public CGVMemberDto login(CGVMemberDto dto);
	public CGVMemberDto getMemberInfo(CGVMemberDto dto);
	public boolean modifyMember(CGVMemberDto dto);
	public boolean deleteMember(String id);
	public int isNoMember(CGVNoMemberDto noMemberDto);
	public void deleteMember(CGVNoMemberDto dto);
	public void createNoMember(CGVNoMemberDto noMemberDto);
}
