package org.dawin.service;

import java.util.List;

import org.dawin.domain.BoardAttachmentVO;
import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;
import org.dawin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	/*
	 * @Override public List<BoardVO> getList() { // 게시글 목록 조회 구현 return
	 * mapper.getListWithPaging(); }
	 */

	@Override
	public BoardVO get(Long postId) {
		// 게시글 상세 조회 구현

		log.info("get......" + postId);
		BoardVO board = mapper.read(postId);
		log.info(board.toString());

		List<BoardAttachmentVO> list = mapper.getAttachmentList(postId);
		log.info(list);
		board.setAttaches(list);
		return board;

	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void register(BoardVO board, List<MultipartFile> files) throws Exception {
		// 게시글 등록 구현
		log.info("register......" + board);

		mapper.insertSelectKey(board);
		Long postid = board.getPostid();

		for (MultipartFile part : files) {
			if (part.isEmpty())
				continue;
			try {
				BoardAttachmentVO attach = new BoardAttachmentVO(postid, part);
				mapper.insertAttachment(attach);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public boolean modify(BoardVO board, List<MultipartFile> files) throws Exception {
		// 게시글 수정 구현
		log.info("modify......" + board);

		Long postid = board.getPostid();

		for (MultipartFile part : files) {
			if (part.isEmpty())
				continue;
			BoardAttachmentVO attach = new BoardAttachmentVO(postid, part);
			mapper.insertAttachment(attach);
		}

		// 영향받은 행의 개수 리턴, 1이면 성공한 것
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long postId) {
		// 게시글 삭제 구현
		return mapper.delete(postId) == 1;
	}

	@Override
	public BoardAttachmentVO getAttachment(Long no) {
		return mapper.getAttachment(no);
	}

	@Override
	public boolean removeAttachment(Long no) {
		// TODO Auto-generated method stub
		return mapper.removeAttachment(no) == 1;
	}

}
