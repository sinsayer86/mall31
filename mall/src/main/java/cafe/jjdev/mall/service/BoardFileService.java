package cafe.jjdev.mall.service;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.mapper.BoardFileMapper;
import cafe.jjdev.mall.vo.BoardFile;

@Service
@Transactional
public class BoardFileService {
	@Autowired BoardFileMapper boardFileMapper;
	
	// 파일 하나 삭제하는 서비스 메서드
	public void removeBoardFileByFileNo(Map<String, Object> map) {
		BoardFile boardFile = boardFileMapper.selectBoardFileByFileNo((Integer)map.get("boardFileNo")); //패스 제작용 파일 정보 받아오기

		File file = new File(map.get("path") + "/" + boardFile.getBoardFileSaveName() + "." + boardFile.getBoardFileExt());
		file.delete(); // 실제 파일 삭제
		
		System.out.println(map.get("boardFileNo") + " <- boardFileNo |BoardFileService.removeBoardFileByFileNo()");
		
		boardFileMapper.deleteBoardFileByFileNo(map); // 파일 정보 삭제
	}
	
}
