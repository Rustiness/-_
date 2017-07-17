package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PersonDFVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.persistence.AdMemberDAO;

@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Inject
	AdMemberDAO dao;

	@Override
	public int modify(MemberVO vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public void modifyTOEMP(String memNO) throws Exception {
		dao.modifyTOEMP(memNO);
	}

	@Override
	public MemberVO read(String memNO) throws Exception {
		return dao.read(memNO);
	}

	@Override
	public List<PersonDFVO> getGrade() throws Exception {
		return dao.getGrade();
	}

	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {
		return dao.readmsg(memNO);
	}

	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}


}
