package com.simpact.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.simpact.domain.CounselAnswerVO;
import com.simpact.domain.Criteria;
import com.simpact.domain.PageMaker;
import com.simpact.service.CounselAnswerService;


@RestController // Ajax요청에 대한 전용 컨트롤러
@RequestMapping("/ad/ca") //공통 URL요청
public class CounselAnswerController {

	@Inject
	private CounselAnswerService service;

	// 고객 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CounselAnswerVO vo) {//리턴: 문자열+서버의 상태
		System.out.println("입력 댓글: " + vo);
		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//register

	//(특정 고객문의게시물에 대한)전체 댓글 조회
	//클라이언트 URL요청 ----> http://localhost/ad/ca/all/101
	@RequestMapping(value = "/all/{csNO}")
	public ResponseEntity<List<CounselAnswerVO>> list(@PathVariable("csNO") String csNO) {
//		System.out.println("조회할 기준 게시물번호: " + csNO);
		ResponseEntity<List<CounselAnswerVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(csNO), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//list

	//댓글 수정 처리
	//클라이언트 URL요청 ----> http://localhost/ad/ca/2
	@RequestMapping(value = "/{answerNO}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("answerNO") String answerNO,
	                                     //ReplyVO vo)//http://localhost/ad/ca/2?content=수정내용
	                                     @RequestBody CounselAnswerVO vo)//http://localhost/ad/ca/2
	//+  {"content":"수정내용"}
	{
		ResponseEntity<String> entity = null; //리턴 : 데이터+서버상태
		try {
			vo.setAnswerNO(answerNO);
			service.modifyReply(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//update

	@RequestMapping(value = "/{answerNO}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("answerNO") String answerNO) {
		ResponseEntity<String> entity = null; //리턴 : 데이터+서버상태
		try {
			service.removeReply(answerNO);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//remove


	@RequestMapping(value = "/{csNO}/{page}", method = RequestMethod.GET) //URL요청  : URL에 {}사용!!----> URL에 파라미터를 사용하겠다!!
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("csNO") String csNO, //@PathVariable(URL변수명) 자료형 메소드내에서 사용할 변수명
			@PathVariable("page") int page) {
		//리턴데이터 : List<ReplyVO>, PageMaker ===> Map<Object>
		//            + 서버상태                          ===> ResponseEntity
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria(); //기본: 1페이지, 한 화면당 10개 출력
			cri.setPage(page);

			PageMaker maker = new PageMaker();
			//역할: 현재페이지 3페이지 가정 ---->  1~10
			maker.setCri(cri);

			int count = service.count(csNO);//특정 게시물에 대한 댓글들의 총 수
			maker.setTotalCount(count); //제한적인 넘버 추출

			List<CounselAnswerVO> list = service.listReplyPage(csNO, cri);
			//출력할 댓글 조회

			Map<String, Object> map = new HashMap<>();
			map.put("pageMaker", maker);
			map.put("list", list);

			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}//listPage

}//ReplyController  -----> RestController









