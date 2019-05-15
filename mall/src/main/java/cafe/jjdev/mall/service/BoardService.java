package cafe.jjdev.mall.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.mapper.BoardCommentMapper;
import cafe.jjdev.mall.mapper.BoardFileMapper;
import cafe.jjdev.mall.mapper.BoardMapper;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardComment;
import cafe.jjdev.mall.vo.BoardFile;
import cafe.jjdev.mall.vo.BoardRequest;

@Service
@Transactional
public class BoardService {
	@Autowired private BoardMapper boardMapper;
	@Autowired private BoardCommentMapper boardCommentMapper;
	@Autowired private BoardFileMapper boardFileMapper;
	
	public Map<String, Object> getBoardList(int currentPage) {
		// 요청 가공
		final int ROW_PER_PAGE = 10;
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		// Model값 가공
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		
		List<Board> list = boardMapper.selectBoardList(map);
		
		int boardCount = boardMapper.selectBoardCount();
		int lastPage = boardCount / ROW_PER_PAGE;
		if(lastPage % 2 != 0) {
			lastPage++;
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("boardCount", boardCount);
		
		return returnMap;
	}
	
	public int modifyBoard(Board board) {
		return boardMapper.updateBoard(board);
	}
	
	public void addBoard(BoardRequest boardRequest, String path) {
		Board board = new Board();
		board.setBoardPw(boardRequest.getBoardPw());
		board.setBoardTitle(boardRequest.getBoardTitle());
		board.setBoardContent(boardRequest.getBoardContent());
		board.setBoardUser(boardRequest.getBoardUser());
		System.out.println(board);
		boardMapper.insertBoard(board);

		// 2. BoardRequest -> MultipartFile -> BoardFile
		MultipartFile multipartFile = boardRequest.getBoardFile();
		System.out.println(multipartFile);

		if(multipartFile.isEmpty() == false) {
			String originalFileName = multipartFile.getOriginalFilename();
			int i = originalFileName.lastIndexOf(".");
			String originName = originalFileName.substring(0, i);
			String ext = originalFileName.substring(i+1).toLowerCase(); // 확장자 모두 소문자로
			UUID uuid = UUID.randomUUID();
			String saveName = uuid.toString().replace("-", "");
			
			BoardFile boardFile = new BoardFile();
			boardFile.setBoardFileSize(multipartFile.getSize());
			boardFile.setBoardFileType(multipartFile.getContentType());
			boardFile.setBoardFileOriginName(originName);
			boardFile.setBoardFileSaveName(saveName);
			boardFile.setBoardFileExt(ext);
			boardFile.setBoardNo(board.getBoardNo());
			System.out.println(boardFile + " <- boardFile |BoardService.addBoard()");
			
			// 3. 폴더에 저장
			File file = new File(path + "/" + saveName + "." + ext); // 빈 파일 생성
			try {
				multipartFile.transferTo(file); // 생성된 빈 파일에 업로드 파일 카피.
			}
			catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException(); // 예외처리 안 해도 괜찮은 예외 생성(예외를 삼킴).
			}
			// 테이블에는 경로만, 파일은 폴더에 저장.
			
			boardFileMapper.insertBoardFile(boardFile);
		}
	}
	
	public void removeBoard(Board board, String path) {
		boardCommentMapper.deleteBoardCommentByBoardNo(board.getBoardNo()); // 코멘트 삭제
		
		List<BoardFile> boardFileList = boardFileMapper.selectBoardFileByFK(board.getBoardNo()); // 파일 정보 리스트 가져오기
		System.out.println(boardFileList + " <- boardFileList |BoardService.removeBoard()");
		
		
		// 게시글에 포함된 실제 파일 모두 삭제
		for(BoardFile boardFile : boardFileList) {
			File file = new File(path + "/" + boardFile.getBoardFileSaveName() + "." + boardFile.getBoardFileExt()); // 빈 파일 생성
			file.delete(); // 실제 파일 삭제
		}
		
		boardFileMapper.deleteBoardFile(board.getBoardNo()); // 게시글에 포함 된 파일 정보 모두 삭제
		boardMapper.deleteBoard(board); // 게시글 삭제
	}
	
	public Map<String, Object> getBoardAndCommentList(int boardNo) {
		Board board = boardMapper.selectBoard(boardNo);
		List<BoardComment> boardCommentList = boardCommentMapper.selectBoardCommentListByBoardNo(boardNo);
		List<BoardFile> boardFileList = boardFileMapper.selectBoardFileByFK(boardNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", board);
		map.put("boardCommentList", boardCommentList);
		map.put("boardFileList", boardFileList); // 파일이 없으면 리스트 안에 아무것도 없음.
		
		return map;
	}
	
	public Map<String, Object> getBoard(int boardNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("board", boardMapper.selectBoard(boardNo));
		map.put("boardFile", boardFileMapper.selectBoardFileByFK(boardNo));
		
		return map;
	}
}
