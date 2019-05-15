package cafe.jjdev.mall.vo;

public class BoardComment {
	
	private int BoardCommentNo;
	private int BoardNo;
	private String BoardCommentPw;
	private String BoardCommentContent;
	private String BoardCommentUser;
	
	public int getBoardCommentNo() {
		return BoardCommentNo;
	}
	public void setBoardCommentNo(int boardCommentNo) {
		BoardCommentNo = boardCommentNo;
	}
	public int getBoardNo() {
		return BoardNo;
	}
	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}
	public String getBoardCommentPw() {
		return BoardCommentPw;
	}
	public void setBoardCommentPw(String boardCommentPw) {
		BoardCommentPw = boardCommentPw;
	}
	public String getBoardCommentContent() {
		return BoardCommentContent;
	}
	public void setBoardCommentContent(String boardCommentContent) {
		BoardCommentContent = boardCommentContent;
	}
	public String getBoardCommentUser() {
		return BoardCommentUser;
	}
	public void setBoardCommentUser(String boardCommentUser) {
		BoardCommentUser = boardCommentUser;
	}
	
	@Override
	public String toString() {
		return "BoardComment [BoardCommentNo=" + BoardCommentNo + ", BoardNo=" + BoardNo + ", BoardCommentPw="
				+ BoardCommentPw + ", BoardCommentContent=" + BoardCommentContent + ", BoardCommentUser=" + BoardCommentUser + "]";
	}
}
