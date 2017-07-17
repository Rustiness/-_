package com.simpact.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalReviewVO;
import com.simpact.persistence.TalReviewDAO;

@Service
public class TalReviewServiceImpl implements TalReviewService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalReviewDAO dao;

	@Override
	public void regist(TalReviewVO vo) throws Exception {//입력
		dao.create(vo);
	}

	@Override
	public void modify(TalReviewVO vo) throws Exception {//변경
		dao.update(vo);
	}

	@Override
	public void remove(String talReviewNO) throws Exception {//삭제
		dao.delete(talReviewNO);
	}

	@Override
	public TalReviewVO read(String talReviewNO) throws Exception {//상세보기
		return dao.read(talReviewNO);
	}

	@Override
	public TalReviewVO nickName(String talReviewNO) throws Exception {
		return dao.nickread(talReviewNO);
	}

	@Override
	public List<TalReviewVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<TalReviewVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<TalDivVO> talhave(Map<String, String> map) throws Exception {
		return dao.talDivVO(map);
	}

}
