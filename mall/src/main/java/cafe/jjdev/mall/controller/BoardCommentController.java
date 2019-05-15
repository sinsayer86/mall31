package cafe.jjdev.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.BoardCommentService;
import cafe.jjdev.mall.vo.BoardComment;

@Controller
public class BoardCommentController {
	@Autowired
	private BoardCommentService boardCommentService;
	
	@GetMapping(value="/board/removeBoardComment")
	public String removeBoardCommentByCommentNo(int boardNo, int boardCommentNo, Model model) {
		model.addAttribute("boardCommentNo", boardCommentNo);
		model.addAttribute("boardNo", boardNo);
		return "board/removeBoardComment";
	}
	
	@PostMapping(value="/board/removeBoardComment")
	public String removeBoardCommentByCommentNo(BoardComment boardComment) {
		boardCommentService.removeBoardCommentByCommentNo(boardComment);
		return "redirect:" + "/board/getBoard?boardNo=" + boardComment.getBoardNo();
	}
	
	@PostMapping(value="/board/addBoardComment")
	public String addBoardComment(BoardComment boardComment) {
		int result = boardCommentService.addBoardComment(boardComment);
		System.out.println(result + " <- result |BoardCommentController.addBoardComment");
		return "redirect:" + "/board/getBoard?boardNo=" + boardComment.getBoardNo();
	}
	
}
