package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.simpact.domain.Criteria;
import com.simpact.domain.QuestionVO;
import com.simpact.persistence.CounselDAO;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.CounselVO;


@Service
public class CounselServiceImpl implements CounselService {

	@Inject
	private CounselDAO dao;

	@Override
	public void regist(CounselVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modify(CounselVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void remove(String csNO) throws Exception {
		dao.delete(csNO);

	}

	@Override
	public CounselVO read(String csNO) throws Exception {

		return dao.read(csNO);
	}

	@Override
	public List<CounselVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<CounselVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<CounselVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<QuestionVO> listcate() throws Exception {

		return dao.listcate();
	}



}
