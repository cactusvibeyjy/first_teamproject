package bit.com.a.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.CGVReserveDao;
import bit.com.a.model.CGVNoMemberDto;
import bit.com.a.model.CGVReserveDto;

@Repository
public class CGVReserveDaoImpl implements CGVReserveDao {

	@Autowired
	SqlSession session;

	@Override
	public boolean CGVReserve(CGVReserveDto dto) {
		int count = session.insert("CGVReserve", dto);

		return count > 0 ? true : false;
	}

	@Override
	public List<CGVReserveDto> getCGVReserveList(CGVReserveDto dto) {
		// TODO Auto-generated method stub
		List<CGVReserveDto> list = new ArrayList<CGVReserveDto>();
		list = session.selectList("getCGVReserveList", dto);
		return list;
	}

	@Override
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto) {
		List<CGVReserveDto> list = new ArrayList<CGVReserveDto>();
		list = session.selectList("selectMapping", dto);
		return list;
	}

	@Override
	public boolean modifyMovie(CGVReserveDto dto) {
		int count =  session.update("modifyMovie", dto);
		return count > 0 ? true : false;
	}

	@Override
	public boolean deleteMovie(int id) {
		int count =  session.delete("deleteMovie", id);
		return count > 0 ? true : false;
	}

	@Override
	public void deleteMoviePay(int reserveSeq) {
		session.delete("deleteMoviePay", reserveSeq);

	}

	@Override
	public CGVReserveDto getReserveMovie(CGVReserveDto reserveDto) {
		return session.selectOne("getReserveMovie", reserveDto);
	}
	@Override
	public List<CGVReserveDto> getReserveSeats(CGVReserveDto dto){
		List<CGVReserveDto> list = new ArrayList<CGVReserveDto>();
		System.out.println("DAO in..." + dto.getRunningTime());
		System.out.println("DAO in..." + dto.getMovieDate());
		System.out.println("DAO in..." + dto.getSelectedLocation());
		System.out.println("DAO in..." + dto.getSelectedTheater());
		list = session.selectList("getReserveSeats", dto);
//		CGVReserveDto test = session.selectOne("getReserveSeats", dto);
		System.out.println("list 내용 확인. " +list);
//		System.out.println("test 내용 확인. " +test);
		return list;
	}
	

}
