package org.dawin.service;


import java.util.List;

import org.dawin.domain.BoardAttachmentVO;
import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	
	public int getTotal(Criteria cri);

    // 게시글 목록 조회
	public List<BoardVO> getList(Criteria cri);

    // 게시글 상세 조회
    public BoardVO get(Long postId);

    // 게시글 등록
    public void register(BoardVO board, List<MultipartFile> files) throws Exception;

    // 게시글 수정
    public boolean modify(BoardVO board, List<MultipartFile> files) throws Exception;

    // 게시글 삭제
    public boolean remove(Long postId);
    
    //파일 업로드
    public BoardAttachmentVO getAttachment(Long no);
    
    public boolean removeAttachment(Long no);



    
}
