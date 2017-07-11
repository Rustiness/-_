package com.simpact.service;

import com.simpact.domain.*;
import com.simpact.persistence.TalExcConnDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TalExcConnServiceImpl implements TalExcConnService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalExcConnDAO dao;

	@Override
	public TalBoardVO infoTalBoard(String talDocNO) throws Exception {
		return dao.infoTalBoard(talDocNO);
	}

	@Override
	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception {
		return dao.readTalDivHave(talDocNO);
	}

	@Override
	public int createConn(TalExcConnVO talExcConnVO) throws Exception {
		return dao.createConn(talExcConnVO);
	}

	@Override
	public void createWantCn(TalDivVO talDivVO) throws Exception {
		dao.createWantCn(talDivVO);
	}

	@Override
	public void createHaveCn(TalDivVO talDivVO) throws Exception {
		dao.createHaveCn(talDivVO);
	}

	@Override
	public TalExcConnVO readReception(String talConnNO) throws Exception {
		return dao.readReception(talConnNO);
	}

	@Override
	public List<TalDivVO> listSenderWantDiv(String talConnNO) throws Exception {
		return dao.listSenderWantDiv(talConnNO);
	}

	@Override
	public List<TalDivVO> listSenderHaveDiv(String talConnNO) throws Exception {
		return dao.listSenderHaveDiv(talConnNO);
	}

	@Override
	public int updIsView(TalExcConnVO talExcConnVO) throws Exception {
		return dao.updIsView(talExcConnVO);
	}

	@Override
	public int updTecAccept(TalExcConnVO talExcConnVO) throws Exception {
		return dao.updTecAccept(talExcConnVO);
	}

	@Override
	public int updTecRefuse(TalExcConnVO talExcConnVO) throws Exception {
		return dao.updTecRefuse(talExcConnVO);
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

	@Override
	public List<TalDivVO> listUseCate() throws Exception {
		return dao.listUseCate();
	}

	@Override
	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception {
		return dao.selCateCallDiv(talCateDF);
	}

	@Override
	public List<TalDivVO> listAllCateDiv() throws Exception {
		return dao.listAllCateDiv();
	}
}
