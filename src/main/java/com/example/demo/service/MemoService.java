package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemoRepository;
import com.example.demo.vo.Memo;

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

	public List<Memo> getMemoNotices(int bldgId) {
		return memoRepository.getMemoNotices(bldgId);
	}

}
