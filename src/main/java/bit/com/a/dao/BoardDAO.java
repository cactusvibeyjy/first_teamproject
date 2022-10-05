package bit.com.a.dao;

import java.util.List;

import bit.com.a.vo.BoardVO;
import bit.com.a.vo.Criteria;
import bit.com.a.vo.SearchCriteria;

public interface BoardDAO {

	// 寃뚯떆湲� �옉�꽦
	public void write(BoardVO boardVO) throws Exception;
	
	// 寃뚯떆臾� 紐⑸줉 議고쉶
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	// 寃뚯떆臾� 珥� 媛��닔
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 寃뚯떆臾� 議고쉶
	public BoardVO read(int bno) throws Exception;
	
	// 寃뚯떆臾� �닔�젙
	public void update(BoardVO boardVO) throws Exception;
	
	// 寃뚯떆臾� �궘�젣
	public void delete(int bno) throws Exception;
}
