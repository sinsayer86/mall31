package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Board;

@Mapper
public interface BoardMapper {
	
	public int updateBoard(Board board);
	public int deleteBoard(Board board);
	public Board selectBoard(int boardNo);
	public List<Board> selectBoardList(Map<String, Integer> map);
	public int selectBoardCount();
	public int insertBoard(Board board);
	
	// controller에서는 클라이언트 요청 기준으로 5개의 메서드만 호출해야 한다.
	// service에서 처리(service는 controller에 맞춘다).
}
