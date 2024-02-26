package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemoService;
import com.example.demo.service.TenantService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Memo;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Room;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Tenant;

@Controller
public class UsrMemoController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemoService memoService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/memoAdd")
	public String showMemoAdd(Model model) {

		return "usr/bg12343/memoAdd";
	}

	@RequestMapping("/usr/bg12343/doMemoAdd")
	@ResponseBody
	public String doMemoAdd(int boardId, String title, String body, String afterLoginUri) { // 매개변수 뭘 줄지
		// 로그인 체크 인터셉터에서

		// 제목 내용 빈 칸 확인
		if (Ut.isEmpty(boardId)) {
			return Ut.jsHistoryBack("F-1", "세입자이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-2", "세입자휴대폰번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "세입자차량번호를 입력해주세요");
		}

		// 게시글 작성 작업
		ResultData memoAddRd = memoService.addMemo(rq.getLoginedMemberId(), boardId, title, body);

		// 작성된 게시글 번호 가져오기
		int id = (int) memoAddRd.getData1();

		if (afterLoginUri.length() > 0) {
			return Ut.jsReplace(memoAddRd.getResultCode(), memoAddRd.getMsg(), afterLoginUri);
		}
		return Ut.jsReplace(memoAddRd.getResultCode(), memoAddRd.getMsg(), "../bg12343/dashboard");
	}

	@RequestMapping("/usr/bg12343/memoModify")
	public String showMemoModify(Model model) {

		List<Tenant> tenants = tenantService.getForPrintTenants();

		int tenantsCnt = tenants.size();

		model.addAttribute("tenantsCnt", tenantsCnt);
		model.addAttribute("tenants", tenants);
		return "usr/bg12343/memoModify";
	}

	@RequestMapping("/usr/bg12343/doMemoModify")
	@ResponseBody
	public String doMemoModify(int[] id, String[] tenantName, int[] tenantPhone, String[] tenantCarNum,
			String[] tenantMemo) {

		ResultData roomModifyRd = null;
		for (int i = 0; i < id.length; i++) {
			roomModifyRd = tenantService.modifyTenant(id[i], tenantName[i], tenantPhone[i], tenantCarNum[i],
					tenantMemo[i]);
		}

		return Ut.jsReplace(roomModifyRd.getResultCode(), roomModifyRd.getMsg(), "../bg12343/tenant");
	}

}
