package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalExchangeVO;
import com.simpact.domain.TalExchangelistVO;
import com.simpact.persistence.TalExchangeDAO;

@Service
public class TalExchangeServiceImpl implements TalExchangeService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalExchangeDAO dao;

	@Override
	public void regist(TalExchangeVO vo) throws Exception {//입력
		dao.create(vo);
	}

	@Override
	public void modify(TalExchangeVO vo) throws Exception {//변경
		dao.update(vo);
	}

	@Override
	public void remove(String talExcNO) throws Exception {//삭제
		dao.delete(talExcNO);
	}

	@Override
	public TalExchangeVO read(String talExcNO) throws Exception {//상세보기
		return dao.read(talExcNO);
	}

	@Override
	public TalExchangeVO nickname(String talExcNO) throws Exception {
		return dao.nickread(talExcNO);
	}

	@Override
	public List<TalExchangeVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<TalExchangelistVO> listcate() throws Exception {
	return dao.catelist();
	}
	
	
}
