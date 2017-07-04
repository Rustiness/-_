package com.simpact.controller;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String confirmGET(Model model, MessengerVO msgvo) throws Exception {

		List<MessengerVO> list = service.listmsg();
		model.addAttribute("list", list);

		System.out.println(list.toString());

		return "/client/join/confirm";
	}

	/* 회원정보 등록 (진행) */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String confirmPOST(MemberVO vo, HttpSession session, RedirectAttributes attr,
	                          String tel1, String tel2, String tel3, MessengerVO msgvo, 
	                          String pass2)
			throws Exception {
		System.out.println(">>> set confirm");
		//System.out.println("vo.getEmail:"+vo.getEmail());
		//System.out.println("vo.getNickName:"+vo.getNickName());
		//System.out.println("tel1,tel2,tel3:"+tel1+","+tel2+","+tel3);

		//System.out.println("vo.getTel():"+vo.getTel());
		/*System.out.println("email:"+vo.getEmail()+",no"+vo.getMemNo()+",name"+vo.getName()
				+",pass"+vo.getPass()+",sex"+vo.getSex()+",tel"+vo.getTel()+",birth"+vo.getBirth());*/

		String tel = tel1 + tel2 + tel3;
		vo.setTel(tel);
		String pass = pass2;
		vo.setPass(pass);

		service.regist(vo); //회원정보등록(메신저빼고)
		
/*		service.findMemNo(vo.getEmail());
		service.msgRegist(msgvo);
		service.findMesDF(msgvo.getMemNo());
		service.DFMsgRegist(msgvo);*/


		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/j/res";
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
