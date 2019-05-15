package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.BoardFile;

@Mapper
public interface BoardFileMapper {

	public void insertBoardFile(BoardFile boardFile);
	public List<BoardFile> selectBoardFileByFK(int boardNo); // 파일 정보 가져오는 메서드
	
	public BoardFile selectBoardFileByFileNo(int boardFileNo); // 파일 하나 정보 가져오는 메서드
	public void deleteBoardFile(int boardNo); // 파일 정보 삭제하는 메서드
	public void deleteBoardFileByFileNo(Map<String, Object> map); // 파일 하나 정보 삭제하는 메서드
	
}
