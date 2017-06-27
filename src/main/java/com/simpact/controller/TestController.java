package com.simpact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	
	@RequestMapping("/information_list")
	public String informationList(){
		
		return "test_LSY/councel/information_list";
	
	}
	@RequestMapping("/information_info")
	public String informationInfo(){
		
		return "test_LSY/councel/information_info";
	
	}
	@RequestMapping("/information_update")
	public String informationUpdate(){
		
		return "test_LSY/councel/information_update";
	
	}
	@RequestMapping("/information_upload")
	public String informationUpload(){
		
		return "test_LSY/councel/information_upload";
	
	}
	@RequestMapping("/review_board")
	public String reviewBoard(){
		
		return "test_LSY/review/review_board";
	
	}
	@RequestMapping("/review_info")
	public String reviewInfo(){
		
		return "test_LSY/review/review_info";
	
	}
	@RequestMapping("/review_upload")
	public String reviewUpload(){
		
		return "test_LSY/review/review_upload";
	
	}
	
	@RequestMapping("/review_update")
	public String reviewUpdate(){
		
		return "test_LSY/review/review_update";
	
	}
	
	@RequestMapping("/talconn_req")
	public String talConnReq(){
		
		return "client/talConn/talconn_req";
	
	}
	@RequestMapping("/talconn_reqconfirm")
	public String talConnReqconfirm(){
		
		return "client/talConn/talconn_reqconfirm";
	
	}
	
	
	

}
