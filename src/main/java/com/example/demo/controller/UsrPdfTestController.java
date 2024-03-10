package com.example.demo.controller;

import java.io.FileNotFoundException;

import org.springframework.stereotype.Controller;

import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

@Controller
public class UsrPdfTestController {

	public static void main(String[] args) throws FileNotFoundException {
		
		
		String path = "c:\\work\\sample2.pdf";
		PdfWriter pdfWriter = new PdfWriter(path);
		PdfDocument pdfDocument = new PdfDocument(pdfWriter);
		pdfDocument.setDefaultPageSize(PageSize.A4);
		Document document = new Document(pdfDocument);
		
		document.add(new Paragraph("Hello coding"));
		document.close();
		
		}
}