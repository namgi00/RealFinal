package org.dawin.mapper;

import java.util.List;

import org.dawin.domain.Criteria;
import org.dawin.domain.NoticeVO;


public interface NoticeMapper {
	
	//페이징 처리
		public int getTotalCount(Criteria cri);
		
		// 게시글 목록 추출
		public List<NoticeVO> getList(Criteria cri);
		
		public List<NoticeVO> getListWithPaging(Criteria cri); 

	    // 게시글 상세 조회
	    public NoticeVO read(Long noticeNo);

	    // 게시글 등록
	    public void insert(NoticeVO notice);
	    
	    public void insertSelectKey(NoticeVO notice);
	    

	    // 게시글 수정
	    public int update(NoticeVO notice);

	    // 게시글 삭제
	    public int delete(Long noticeNo);


}
