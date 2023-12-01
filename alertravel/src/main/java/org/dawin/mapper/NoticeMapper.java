package org.dawin.mapper;

import java.util.List;

import org.dawin.common.NoticePagination;
import org.dawin.domain.NoticeVO;


public interface NoticeMapper {
	
	
	public void insert(NoticeVO noticeboard);
	
	public List<NoticeVO> getNoticeList(NoticePagination pagination);
	
	public int noticeCnt();
	
	public NoticeVO read(int noticeNo);


}
