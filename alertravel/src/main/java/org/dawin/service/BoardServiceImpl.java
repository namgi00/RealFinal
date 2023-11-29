package org.dawin.service;

import java.security.Principal;
import java.util.List;

import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;
import org.dawin.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return mapper.getList(cri);
	}

	/*
	 * @Override public List<BoardVO> getList() { // 게시글 목록 조회 구현 return
	 * mapper.getListWithPaging(); }
	 */

    @Override
    public BoardVO get(Long postId) {
        // 게시글 상세 조회 구현
    	
    	return mapper.read(postId);
    	
        
    }

    @Override
    public void register(BoardVO board) {
        // 게시글 등록 구현
    	mapper.insert(board);
    }

    @Override
    public boolean modify(BoardVO board) {
        // 게시글 수정 구현
    	//영향받은 행의 개수 리턴, 1이면 성공한 것
    	return mapper.update(board) == 1;
    }

    @Override
    public boolean remove(Long postId) {
        // 게시글 삭제 구현
    	return mapper.delete(postId) == 1;
    }


}
