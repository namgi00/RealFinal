package org.dawin.mapper;

import java.util.List;

import org.dawin.domain.CommentVO;

public interface CommentMapper {
	
	List<CommentVO> readAll(Long postid);
	CommentVO get(Long no);
	
	void create(CommentVO vo);
	void update(CommentVO vo);
	void delete(Long no);

}
