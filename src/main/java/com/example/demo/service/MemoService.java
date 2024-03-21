package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemoRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Memo;
import com.example.demo.vo.ResultData;

@Service
public class MemoService {

	@Autowired
	private MemoRepository memoRepository;

	public Memo getMemo(int memoId) {
		return memoRepository.getMemo(memoId);
	}

	public List<Memo> getMemoRepairs() {
		return memoRepository.getMemoRepairs();
	}
	
	public List<Memo> getMemoExpenses(int bldgId) {
		return memoRepository.getMemoExpenses(bldgId);
	}

	public ResultData<Integer> addMemo(int memberId, int bldgId, int roomId, int boardId, int tenantId, int contractId,
			String title, String body, String memoDate, int cost) {
		memoRepository.addMemo(memberId, bldgId, roomId, boardId, tenantId, contractId, title, body, memoDate,
				cost);

		int id = memoRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);

	}

	

}
