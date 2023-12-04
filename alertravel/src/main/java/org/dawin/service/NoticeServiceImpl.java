package org.dawin.service;

import java.util.List;

import org.dawin.domain.Criteria;
import org.dawin.domain.NoticeVO;
import org.dawin.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	/*
	 * @Override public List<BoardVO> getList() { // 게시글 목록 조회 구현 return
	 * mapper.getListWithPaging(); }
	 */

	@Override
	public NoticeVO get(Long noticeNo) {
		// 게시글 상세 조회 구현

		log.info("get......" + noticeNo);
		NoticeVO notice = mapper.read(noticeNo);
		log.info(notice.toString());
		return notice;

	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void register(NoticeVO notice) throws Exception {
		// 게시글 등록 구현
		log.info("register......" + notice);

		mapper.insertSelectKey(notice);
		Long noticeNo = notice.getNoticeNo();

	}

	@Override
	public boolean modify(NoticeVO notice) throws Exception {
		// 게시글 수정 구현
		log.info("modify......" + notice);

		Long noticeNo =  notice.getNoticeNo();


		// 영향받은 행의 개수 리턴, 1이면 성공한 것
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(Long noticeNo) {
		// 게시글 삭제 구현
		return mapper.delete(noticeNo) == 1;
	}





}
