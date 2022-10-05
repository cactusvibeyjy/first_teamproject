package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.CGVNoMemberDto;
import bit.com.a.model.CGVReserveDto;

public interface CGVReserveDao {
	
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserveList(CGVReserveDto dto);
	
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
	public List<CGVReserveDto> getReserveSeats(CGVReserveDto dto);
	public boolean modifyMovie(CGVReserveDto dto);
	public CGVReserveDto getReserveMovie(CGVReserveDto reserveDto);
	public boolean deleteMovie(int id);
	public void deleteMoviePay(int reserveSeq);
}
