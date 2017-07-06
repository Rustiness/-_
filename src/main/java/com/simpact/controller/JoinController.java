package com.simpact.controller;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/j")
public class JoinController {

	@Inject
	MemberService service;

	/* 가입약관 */
	@RequestMapping("/terms")
	public String terms() {

		return "/client/join/terms";
	}

	/* 회원정보 등록 (입력폼) */
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String confirmGET(Model model,HttpSession session) throws Exception {
		List<MessengerVO> list = service.listmsg();
		model.addAttribute("list", list);
		return "/client/join/confirm";
	}
	
	//메신저 목록얻어오기
	@RequestMapping(value="/msgJson",method=RequestMethod.GET)
	public @ResponseBody List<MessengerVO> getmsgList() throws Exception{
		return service.listmsg();
	}
	
	/* 회원정보 등록 (진행) */
	@RequestMapping(value="/confirm",method=RequestMethod.POST)
	public @ResponseBody String confirmPOST(MemberVO vo, HttpSession session, String tel1, String tel2, String tel3, 
								MessengerVO msgvo, String pass2)throws Exception {
		
		int t;
		t = service.regist(vo); //회원정보등록(메신저빼고) //
		if(t==1){ //입력이 성공했다면
			return "success:"+vo.getMemNO(); 
		}
		return "fail:";
	}

	/* 회원정보 등록  (메신저)*/
	@RequestMapping("/confirm/messenger")
	public @ResponseBody String  msgPOST(MessengerVO vo) throws Exception{
		String count[] = vo.getMesDF().split(",");	//사이즈 측정용
		String mesDF[] = vo.getMesDF().split(",");
		String mesID[] = vo.getId().split(",");
		
		for(int i=0; i<count.length; i++){	// ,로 나눈 배열만큼 메세지테이블에 인설트
			vo.setMesDF(mesDF[i]);
			vo.setId(mesID[i]);
			 service.registMES(vo);
		}
		return "success";					//화면이 바뀌어야되는
	}
	
	//이메일 중복
	@RequestMapping("/id")
	public @ResponseBody String email(String email) throws Exception {
		System.out.println("email : " + email);
		int t = service.idCheck(email); //count()함수 갯수 - 일치하는 nickName
		if (t > 0) return "duplicate";
		return "use";
	}

	//닉네임 중복
	@RequestMapping("/nickName")
	public @ResponseBody String nickName(String nickName) throws Exception {
		System.out.println("NickName : " + nickName);
		int t = service.nickNameCheck(nickName); //count()함수 갯수 - 일치하는 nickName
		if (t > 0) return "duplicate";
		return "use";
	}
	
	
	/* 회원가입 완료 */
	@RequestMapping("/res")
	public String result() {

		return "/client/join/result";
	}

}
