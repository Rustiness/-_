package com.simpact.service;

import com.simpact.domain.*;
import com.simpact.persistence.TalExcConnDAO;
import com.simpact.persistence.TalExchangeDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TalExcConnServiceImpl implements TalExcConnService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalExcConnDAO dao;

	@Override
	public void regist(TalExcConnVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modify(TalExcConnVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String talExcConnNO) throws Exception {
		dao.delete(talExcConnNO);
	}

	@Override
	public TalExcConnVO read(String talExcConnNO) throws Exception {
		return dao.read(talExcConnNO);
	}

	@Override
	public TalExcConnVO nickname(String talExcConnNO) throws Exception {
		return dao.nickread(talExcConnNO);
	}

	@Override
	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception {
		return dao.listTalDivCn(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}


}
