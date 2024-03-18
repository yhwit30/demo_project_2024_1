package com.example.demo.service;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.vo.Dashboard;
import com.example.demo.vo.MaintenanceFee;
import com.lowagie.text.DocumentException;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class CsvService {

	// 관리비 고지서
	public void exportMaintenanceFee(HttpServletResponse response, MaintenanceFee maintenanceFee, String month)
			throws DocumentException, IOException {

		BufferedWriter bw = null;

		try {

			// csv 만들기
			bw = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()));
			// 한글깨짐 해결하는 한 줄 코드
			bw.write("\uFEFF");

			writeMaintenanceFeeTable(bw, maintenanceFee);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// BufferedWriter 닫기
			if (bw != null) {
				bw.close();
			}

		}
	}

	private void writeMaintenanceFeeTable(BufferedWriter bw, MaintenanceFee maintenanceFee) throws IOException {

		String newline = System.lineSeparator();

		// 헤더용 셀
		bw.write("건물, 호실, 이름");
		bw.write(newline);
		bw.write("" + maintenanceFee.getBldgName() + ", " + maintenanceFee.getRoomNum() + ", "
				+ maintenanceFee.getTenantName());

		bw.write(newline);
		bw.write(newline);
		bw.write("항목, 세부금액");
		bw.write(newline);

		bw.write("엘리베이터,");
		bw.write("" + maintenanceFee.getElevater());
		bw.newLine();
		bw.write("소방안전,");
		bw.write("" + maintenanceFee.getFireSafety());
		bw.write(newline);

		bw.write("인터넷TV,");
		bw.write("" + maintenanceFee.getInternetTV());
		bw.write(newline);

		bw.write("공용전기,");
		bw.write("" + maintenanceFee.getCommonElec());
		bw.write(newline);

		bw.write("사용전기,");
		bw.write("" + maintenanceFee.getElecUse());
		bw.write(newline);

		bw.write("전기비용,");
		bw.write("" + maintenanceFee.getElecBill());
		bw.write(newline);

		bw.write("공용수도,");
		bw.write("" + maintenanceFee.getCommonWater());
		bw.write(newline);

		bw.write("사용수도,");
		bw.write("" + maintenanceFee.getWaterUse());
		bw.write(newline);

		bw.write("수도비용,");
		bw.write("" + maintenanceFee.getWaterBill());
		bw.write(newline);

		bw.write("가스사용,");
		bw.write("" + maintenanceFee.getGasUse());
		bw.write(newline);

		bw.write("가스비용,");
		bw.write("" + maintenanceFee.getGasBill());
		bw.write(newline);

		bw.write(newline);
		bw.write("당월계,");
		bw.write("" + maintenanceFee.getMonthlyMaintenanceFee());
		bw.write(newline);
		bw.write("연체료,");
		bw.write("" + maintenanceFee.getLateFee());
		bw.write(newline);
		bw.write("납기 후 금액,");
		bw.write("" + maintenanceFee.getLateMaintenanceFee());

	}

	// 사업장 현황보고
	public void exportReportBusiness(HttpServletResponse response, List<Dashboard> rentStatus) throws DocumentException, IOException {

		BufferedWriter bw = null;

		try {

			// csv 만들기
			bw = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()));
			// 한글깨짐 해결하는 한 줄 코드
			bw.write("\uFEFF");

			writeReportBusinessTable(bw);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// BufferedWriter 닫기
			if (bw != null) {
				bw.close();
			}

		}
	}

	private void writeReportBusinessTable(BufferedWriter bw) throws IOException {

		String newline = System.lineSeparator();

		// 헤더용 셀
		bw.write("건물, 호실, 이름");
		bw.write(newline);

		bw.write(newline);
		bw.write(newline);
		bw.write("항목, 세부금액");
		bw.write(newline);

		bw.write("엘리베이터,");
		bw.newLine();
		bw.write("소방안전,");
		bw.write(newline);

		bw.write("인터넷TV,");
		bw.write(newline);

		bw.write("공용전기,");
		bw.write(newline);

		bw.write("사용전기,");
		bw.write(newline);

		bw.write("전기비용,");
		bw.write(newline);

		bw.write("공용수도,");
		bw.write(newline);

		bw.write("사용수도,");
		bw.write(newline);

		bw.write("수도비용,");
		bw.write(newline);

		bw.write(newline);

		bw.write("가스비용,");
		bw.write(newline);

		bw.write(newline);
		bw.write("당월계,");
		bw.write(newline);
		bw.write("연체료,");
		bw.write(newline);
		bw.write("납기 후 금액,");

	}

}
