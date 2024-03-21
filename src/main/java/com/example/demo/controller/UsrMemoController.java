package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BuildingService;
import com.example.demo.service.MemoService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Building;
import com.example.demo.vo.Memo;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

@Controller
public class UsrMemoController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemoService memoService;

	@Autowired
	private BuildingService buildingService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/memo/expenses")
	public String showExpenses(Model model) {
//		건물 변환 버튼용
		List<Building> buildings = buildingService.getForPrintBuildings();
		model.addAttribute("buildings", buildings);

		List<Memo> expenses = memoService.getMemoExpenses();

		model.addAttribute("expenses", expenses);
		return "usr/bg12343/memo/expenses";
	}

	@RequestMapping("/usr/bg12343/memo/memoAdd")
	public String showMemoAdd(Model model) {

//		건물 변환 버튼용
		List<Building> buildings = buildingService.getForPrintBuildings();
		model.addAttribute("buildings", buildings);

		return "usr/bg12343/memo/memoAdd";
	}

	@RequestMapping("/usr/bg12343/memo/doMemoAdd")
	@ResponseBody
	public String doMemoAdd(int boardId, String title, String body) {
		// 로그인 체크 인터셉터에서

		return null;
	}

	// ajax
	@RequestMapping("/usr/bg12343/memo/doMemoAddAjax")
	@ResponseBody
	public Memo doMemoAddAjax(@RequestParam(defaultValue = "0") int bldgId, int roomId, int boardId,
			@RequestParam(defaultValue = "0") int tenantId, @RequestParam(defaultValue = "0") int contractId,
			@RequestParam(defaultValue = "0") String title, String body,
			@RequestParam(defaultValue = "0") String memoDate, @RequestParam(defaultValue = "0") int cost) {
		// 로그인 체크 인터셉터에서

		System.out.println("roomId: " + roomId);
		System.out.println("boardId: " + boardId);
		System.out.println("title: " + title);
		System.out.println("body: " + body);

		// 현재는 회원은 시험모드로 관리자만
		int memberId = 1;

		// 메모 작성
		ResultData<Integer> addedMemoRd = memoService.addMemo(memberId, bldgId, roomId, boardId, tenantId, contractId,
				title, body, memoDate, cost);

		// 작성된 메모 번호 가져오기
		int id = (int) addedMemoRd.getData1();

		System.out.println("lastId: " + id);

		Memo addedMemo = memoService.getMemo(id);

		System.out.println("addedMemo: " + addedMemo.toString());

		return addedMemo;
	}

	@RequestMapping("/usr/bg12343/memo/memoModify")
	public String showMemoModify(Model model) {

		return "usr/bg12343/memo/memoModify";
	}

	@RequestMapping("/usr/bg12343/memo/doMemoModify")
	@ResponseBody
	public String doMemoModify(int[] id, String[] tenantName, int[] tenantPhone, String[] tenantCarNum,
			String[] tenantMemo) {

		return null;
//		return Ut.jsReplace(roomModifyRd.getResultCode(), roomModifyRd.getMsg(), "../bg12343/tenant");
	}

	@RequestMapping("/usr/bg12343/memo/repair")
	public String showRepair(Model model) {

		List<Memo> memoRepair = memoService.getMemoRepairs();
		int memoRepairCnt = memoRepair.size();

		model.addAttribute("memoRepair", memoRepair);
		model.addAttribute("memoRepairCnt", memoRepairCnt);
		return "usr/bg12343/memo/repair";
	}

	@RequestMapping("/usr/bg12343/memo/repairDetail")
	public String showRepairDetail(Model model, int memoId) {

		Memo memoRepairRd = memoService.getMemo(memoId);

		model.addAttribute("memoRepairRd", memoRepairRd);
		return "usr/bg12343/memo/repairDetail";
	}

	@RequestMapping("/usr/bg12343/memo/repairModify")
	public String showRepairModify(Model model) {

		return "usr/bg12343/memo/repairModify";
	}

}
