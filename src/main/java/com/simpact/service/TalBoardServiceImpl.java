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
	public int regist(TalBoardVO vo) throws Exception {
		
		return dao.create(vo);
	}
	@Override
	public void createWant(TalDivVO talDivVO) throws Exception {
	         dao.createWant(talDivVO);
		
	}

	@Override
	public void createHave(TalDivVO talDivVO) throws Exception {
		dao.createHave(talDivVO);
		
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

	@Override
	public void talHavemodify(TalBoardVO vo) throws Exception {
		dao.talHaveUpdate(vo);

	}

	@Override
	public void talWantmodify(TalBoardVO vo) throws Exception {
		dao.talWantUpdate(vo);

	}

	@Override
	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception {

		return dao.listTalDivHave(cri);
	}

	@Override
	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception {

		return dao.readTalDivHave(talDocNO);
	}

	@Override
	public List<TalDivVO> listTalDivWant(SearchCriteria cri) throws Exception {

		return dao.listTalDivWant(cri);

	}
	
	@Override
	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception {
		return dao.selCateCallDiv(talCateDF);
	}

	@Override
	public List<TalDivVO> readTalDivWant(String talDocNO) throws Exception {
		return dao.readTalDivWant(talDocNO);
	}
	@Override
	public List<TalBoardVO> selBeforeTal(String memNO) throws Exception {

		return dao.selBeforeTal(memNO);
	}
	@Override
	public void removeTal(String talDocNO) throws Exception {
		 dao.deleteTal(talDocNO);
		
	}
	@Override
	public void removeDivHave(String talDocNO) throws Exception {
		dao.deleteDivHave(talDocNO);
		
	}
	@Override
	public void removeDivWant(String talDocNO) throws Exception {
		dao.deleteDivWant(talDocNO);
		
	}

	
}
