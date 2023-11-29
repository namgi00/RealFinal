package org.dawin.service;


import java.util.List;

import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;

public interface BoardService {
	
	public int getTotal(Criteria cri);

    // 게시글 목록 조회
	public List<BoardVO> getList(Criteria cri);

    // 게시글 상세 조회
    public BoardVO get(Long postId);

    // 게시글 등록
    public void register(BoardVO board);

    // 게시글 수정
    public boolean modify(BoardVO board);

    // 게시글 삭제
    public boolean remove(Long postId);


	


    
}
