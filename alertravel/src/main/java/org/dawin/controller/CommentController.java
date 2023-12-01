package org.dawin.controller;

import java.util.List;

import org.dawin.domain.CommentVO;
import org.dawin.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/api/board/{postid}/comment") //("")로 할 경우 공통 url로 들어갈 부분
public class CommentController {
	@Autowired
	CommentMapper mapper;

	@GetMapping("")
	public List<CommentVO> readComments(@PathVariable Long postid) { // 글번호(게시글 보여줌)
		return mapper.readAll(postid); //경로변수에 있던 글번호
	}

	@GetMapping("/{no}") //자체적인 pathvariable List<>로 생성된 배열[] 뒤에 붙여라.
	public CommentVO readComment(@PathVariable Long postid, @PathVariable Long no) { //글번호(게시글) + 댓글 id(달린 댓글들)
		return mapper.get(no); //댓글 보는 거니 글번호 bno는 필요없으면 빼도 된다.
	}

	@PostMapping("")
	public CommentVO create(@RequestBody CommentVO vo) { // body 전달 (생성할 댓글내용)
		mapper.create(vo);
		return mapper.get(vo.getNo()); //생성한 댓글 다시 꺼내서 리턴(댓글 id = no)
	}

	@PutMapping("/{no}")
	public CommentVO update(@PathVariable Long no, @RequestBody CommentVO vo) { //댓글 id + body(수정할 댓글내용)
		System.out.println("==> " + vo); //수정한 댓글의 내용 body
		mapper.update(vo);
		return mapper.get(vo.getNo()); //올바른 방법 db 한 번 읽고 리턴
		//return vo; //그냥 받은 대로 바로 리턴
	}

	@DeleteMapping("/{no}")
	public String delete(@PathVariable Long no) { //댓글 id
		System.out.println("delete ==>" + no); // 댓글삭제 (댓글 id를 삭제했다고 알림)
		mapper.delete(no);
		return "OK";
	}
}
