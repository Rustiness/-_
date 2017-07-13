package com.simpact.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.simpact.domain.Criteria;
import com.simpact.domain.PageMaker;
import com.simpact.domain.TalReviewReplyVO;
import com.simpact.service.TalReviewReplyService;

@RestController
@RequestMapping("/tr/replies") // 공통 URL요청
public class TalReviewReplyController {

	@Inject
	private TalReviewReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody TalReviewReplyVO vo, HttpServletRequest req) {// 리턴:
																				// 문자열+서버의
		req.getSession().getAttribute("clientMemberVO");//댓글 작성자 닉네임받기											// 상태
		System.out.println("입력 댓글: " + vo);
		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			// new ResponseEntity<String>("무조건좋아~!!", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// register

	// (특정 게시물에 대한)전체 댓글 조회
	// 클라이언트 URL요청 ----> http://localhost/replies/all/6
	@RequestMapping(value = "/all/{talReviewNO}")
	public ResponseEntity<List<TalReviewReplyVO>> list(@PathVariable("talReviewNO") String talReviewNO) {
		System.out.println("조회할 기준 게시물번호: " + talReviewNO);
		ResponseEntity<List<TalReviewReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(service.listReply(talReviewNO), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// list

	// 댓글 수정 처리
	// 클라이언트 URL요청 ----> http://localhost/replies/2
	@RequestMapping(value = "/{commExNO}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("commExNO") String commExNO,
			// ReplyVO vo)//http://localhost/replies/2?replycontent=수정내용
			@RequestBody TalReviewReplyVO vo)// http://localhost/replies/2
	// + {"replycontent":"수정내용"}
	{
		ResponseEntity<String> entity = null; // 리턴 : 데이터+서버상태
		try {
			vo.setCommExNO(commExNO);
			service.modifyReply(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// update

	@RequestMapping(value = "/{commExNO}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("commExNO") String commExNO) {
		ResponseEntity<String> entity = null; // 리턴 : 데이터+서버상태
		try {
			int t = service.removeReply(commExNO);
			if(t==1){
			  System.out.println("삭제성공: "+ commExNO);
			  entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}else{
			  System.out.println("삭제실패: "+ commExNO);
			  entity = new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// remove

	@RequestMapping(value = "/{commExNO}/{page}", method = RequestMethod.GET)
	// URL요청 : URL에 {}사용!!----> URL에 파라미터를 사용하겠다!!
	public ResponseEntity<Map<String, Object>> listPage(
			// @PathVariable(URL변수명) 자료형 메소드내에서 사용할 변수명
			@PathVariable("commExNO") String commExNO, @PathVariable("page") int page) {
		// 리턴데이터 : List<ReplyVO>, PageMaker ===> Map<Object>
		// + 서버상태 ===> ResponseEntity
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria(); // 기본: 1페이지, 한 화면당 10개 출력
			cri.setPage(page);

			PageMaker maker = new PageMaker();
			// 역할: 현재페이지 3페이지 가정 ----> 1~10
			maker.setCri(cri);

			// 특정 게시물에 대한 댓글들의 총 수
			maker.setTotalCount(service.count(commExNO)); // 제한적인 넘버 추출

			List<TalReviewReplyVO> list = service.listReplyPage(commExNO, cri);
			// 출력할 댓글 조회

			Map<String, Object> map = new HashMap<>();
			map.put("pageMaker", maker);
			map.put("list", list);

			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}// listPage
	
	@RequestMapping("/replymod")
	public String replymod(){
		return "/client/talReview/replymod";
	}

}
