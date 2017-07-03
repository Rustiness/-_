package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalCategoryVO;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalBoardVO;
import com.simpact.persistence.TalBoardDAO;

@Service
public class TalBoardServiceImpl implements TalBoardService {
	@Inject
	private TalBoardDAO dao;

	@Override
	public void regist(TalBoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modify(TalBoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public TalBoardVO read(String talDocNO) throws Exception {

		return dao.read(talDocNO);
	}

	@Override
	public List<TalBoardVO> listAll() throws Exception {

		return dao.listAll();
	}

	@Override
	public List<TalBoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {

		return dao.countPaging();
	}

	@Override
	public List<TalBoardVO> listSearch(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	@Override
	public List<TalCategoryVO> categoryList() throws Exception {

		return dao.categoryList();
	}

	@Override
	public List<TalDivVO> divList() throws Exception {

		return dao.divList();
	}

}
