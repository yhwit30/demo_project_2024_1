package com.example.demo.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MaintenanceFeeRepository;
import com.example.demo.vo.MaintenanceFee;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class PdfService {

	@Autowired
	private MaintenanceFeeRepository maintenanceFeeRepository;

	public void export(HttpServletResponse response, int tenantId, int bldgId, Integer year, String month)
			throws DocumentException, IOException {

		// 관리비 데이터 가져오기
		MaintenanceFee maintenanceFee = maintenanceFeeRepository.getMaintenanceFee(tenantId, bldgId, 2024, month);

		// pdf 파일 만들기
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();

		// 폰트설정
		Font fontTitle = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		fontTitle.setSize(18);
		Font fontParagraph = FontFactory.getFont(FontFactory.HELVETICA);
		fontParagraph.setSize(12);
		// 한글은 추가로 폰트 넣어줘야함
		BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(baseFont, 12);

		// 내용설정
		Paragraph paragraph = new Paragraph("This is a title", fontTitle);
		paragraph.setAlignment(Paragraph.ALIGN_CENTER);

		Paragraph paragraph2 = new Paragraph("This is a paragraph", fontParagraph);
		paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

		Paragraph paragraph3 = new Paragraph("한글은 나오려나", font);
		paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

		Paragraph paragraph4 = new Paragraph(maintenanceFee.getTenantName(), font);
		paragraph2.setAlignment(Paragraph.ALIGN_LEFT);
		
		Paragraph paragraph5 = new Paragraph(maintenanceFee.getLeaseType(), font);
		paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

		// pdf파일 그리기
		document.add(paragraph);
		document.add(paragraph2);
		document.add(paragraph3);
		document.add(paragraph4);
		document.add(paragraph5);

		document.close();
		System.out.println();

	}

}
