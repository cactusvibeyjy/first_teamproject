package bit.com.a.service;

import java.util.List;

import bit.com.a.dao.CGVReserveDao;
import bit.com.a.model.CGVNoMemberDto;
import bit.com.a.model.CGVReserveDto;

public interface CGVReserveService {
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
	public List<CGVReserveDto> getReserveSeats(CGVReserveDto dto);
	public boolean modifyMovie(CGVReserveDto dto);
	public CGVReserveDto getReserveMovie(CGVReserveDto reserveDto);
	public boolean deleteMovie(int reserveSeq);
	public void deleteMoviePay(int reserveSeq);
}
