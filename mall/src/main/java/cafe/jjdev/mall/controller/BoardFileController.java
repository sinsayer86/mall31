package cafe.jjdev.mall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.service.BoardFileService;

@Controller
public class BoardFileController {
	@Autowired BoardFileService boardFileService;
	
	// 파일 하나 삭제 폼으로 이동
	@GetMapping(value="/board/removeBoardFile")
	public String removeBoardFileByFileNo(int boardFileNo, int boardNo, Model model) {
		model.addAttribute("boardFileNo", boardFileNo);
		model.addAttribute("boardNo", boardNo);
		return "board/removeBoardFile";
	}
	
	// 파일 하나 삭제 처리
	@PostMapping(value="/board/removeBoardFile")
	public String removeBoardFileByFileNo(int boardFileNo, int boardNo, String boardPw) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardFileNo", boardFileNo);
		map.put("boardPw", boardPw);
		map.put("path", PathStr.UPLOAD_PATH);
		boardFileService.removeBoardFileByFileNo(map);
		
		return "redirect:" + "/board/modifyBoard?boardNo=" + boardNo;
	}
}
