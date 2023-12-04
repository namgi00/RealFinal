package org.dawin.service;


import java.util.List;

import org.dawin.domain.Criteria;
import org.dawin.domain.NoticeVO;

public interface NoticeService {
	
	public int getTotal(Criteria cri);

    // 게시글 목록 조회
	public List<NoticeVO> getList(Criteria cri);

    // 게시글 상세 조회
    public NoticeVO get(Long noticeNo);

    // 게시글 등록
    public void register(NoticeVO notice) throws Exception;

    // 게시글 수정
    public boolean modify(NoticeVO notice) throws Exception;

    // 게시글 삭제
    public boolean remove(Long noticeNo);


    
}
