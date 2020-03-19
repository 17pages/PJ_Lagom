package com.lagom.service.board;

public class Pager {
	public static final int PAGE_SCALE=10;//페이지당 게시물수
	public static final int BLOCK_SCALE=10;//화면당 페이지 수
	
	private int curPage; //현재페이지
	private int prevPage; //이전페이지
	private int nextPage; //다음페이지
	private int totPage; //전체 페이지 갯수
	private int totBlock; // 전체 페이지 블록 갯수
	private int curBlock; //현재 블록
	private int prevBlock; //이전 블록
	private int nextBlock; //다음 블록
	private int pageBegin; //#{start} 변수에 전달될 값
	private int pageEnd; //#{end} 변수에 전달될 값
	@Override
	public String toString() {
		return "Pager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
				+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
				+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
				+ blockBegin + ", blockEnd=" + blockEnd + "]";
	}
	private int blockBegin; //블록의 시작페이지 번호
	private int blockEnd; // 블록의 끝페이지 번호

	//Pager(레코드갯수, 출력할페이지번호)
	//생성자 boardcontroller에서 보낸거
	//				15				1
	public Pager(int count, int curPage) {
		curBlock = 1; // 현재블록 번호
		this.curPage = curPage; //현재 페이지 번호//this 자기자신 전역변수
		setTotPage(count); // 전체 페이지 갯수 계산 // 매서드, 호출한거
		setPageRange();//#{start}, #{end}값 계산
		setTotBlock(); // 전체 블록 갯수 계산
		setBlockRange();//블록의 시작, 끝 번호 계산
		}
	public void setBlockRange() {
		//원하는 페이지가 몇번째 블록에 속하는지 계산
		//1-1=0 0+1=1
		curBlock=(curPage-1)/BLOCK_SCALE + 1;
		//블록의 시작페이지, 끝페이지 번호 계산
		blockBegin=(curBlock-1)*BLOCK_SCALE+1;
		blockEnd=blockBegin+BLOCK_SCALE-1;
		//마지막 블록 번호가 범위를 초과하지 않도록 처리
		if(blockEnd > totPage) {
			blockEnd = totPage;
		}
		//[이전][다음]을 눌렀을 때 이동할 페이지 번호
		//삼항연산자 참이면 앞 : 거짓이면 뒤 (결과 ? true:false)
		prevPage=(curBlock==1) ? 1 : (curBlock-1)*BLOCK_SCALE;
		nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE)
				: (curBlock*BLOCK_SCALE)+1;
		//마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totPage) {
			nextPage=totPage;
		}
	}
	//블록의 갯수 계산
	//2.0/10=0.2 1.0->1
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
	}
	
	// where rn between #{start} and #{end}에 입력될 값
	public void setPageRange() {
		//시작번호 = (현재페이지 -1) x 페이지당 게시물수 + 1
		//끝번호 = 시작번호 + 페이지당 게시물수 -1
		//pageBegin : (1-1)*10+1=1
		//pageEnd: 1+10-1=10
		pageBegin = (curPage-1) * PAGE_SCALE +1 ;
		pageEnd = pageBegin + PAGE_SCALE-1;
		
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotPage() {
		return totPage;
	}
	//전체 페이지 갯수 계산 // 위의 setTotpage에서 가져옴.
	public void setTotPage(int count) {
		//Math.ceil()올림 //page_SCALE은 전체가 대문자라 상수임. 나누면 1.5나오고 올림하라니까 2.0가됨
		//그런데 int로 형변환 하라고 했으니 상수가 됨. 그래서 2
		totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
}
