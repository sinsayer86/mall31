package cafe.jjdev.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.service.BoardFileService;
import cafe.jjdev.mall.service.BoardService;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardRequest;

@Controller
public class BoardController {
	@Autowired private BoardService boardService;
	
	@GetMapping(value="/board/addBoard")
	public String addBoard() {
		
		return "board/addBoard";
	}
	
	@PostMapping(value="/board/addBoard")
	public String addBoard(BoardRequest boardRequest) {
		boardService.addBoard(boardRequest, PathStr.UPLOAD_PATH);
		
		return "redirect:" + "/board/getBoardList";
	}
	
	@GetMapping(value="/board/removeBoard")
	public String removeBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model) {
		
		model.addAttribute("boardNo", boardNo);
		
		return "board/removeBoard";
	}
	
	@PostMapping(value="/board/removeBoard")
	public String removeBoard(Board board) {
		boardService.removeBoard(board, PathStr.UPLOAD_PATH);
		
		return "redirect:" + "/board/getBoardList";
	}
	
	@GetMapping(value="/board/modifyBoard")
	public String modifyBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model) {
		
		Map<String, Object> map = boardService.getBoard(boardNo);
		
		model.addAttribute("board", map.get("board"));
		model.addAttribute("boardFile", map.get("boardFile"));
		
		return "board/modifyBoard";
	}
	
	@PostMapping(value="/board/modifyBoard")
	public String modifyBoard(Board board) {
		
		int result = boardService.modifyBoard(board);
		System.out.println(result + " <- result |BoardController.modifyBoard");
		
		return "redirect:" + "/board/getBoard?boardNo=" + board.getBoardNo();
	}
	
	@GetMapping(value="/board/getBoard")
	public String getBoardAndCommentList(@RequestParam(value="boardNo", required=true) int boardNo, Model model) {
		
		Map<String, Object> map = boardService.getBoardAndCommentList(boardNo);
		model.addAttribute("board", map.get("board"));
		model.addAttribute("boardCommentList", map.get("boardCommentList"));
		model.addAttribute("boardFileList", map.get("boardFileList"));
		
		return "board/getBoard";
	}
	
	@GetMapping(value="/board/getBoardList")
	public String getBoardList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		Map<String, Object> map = boardService.getBoardList(currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardCount", map.get("boardCount"));
		model.addAttribute("currentPage", currentPage);
		
		return "board/getBoardList";
	}
	
}
