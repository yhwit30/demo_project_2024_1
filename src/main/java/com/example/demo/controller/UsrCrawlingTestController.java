package com.example.demo.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.By.ByTagName;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;

@Controller
public class UsrCrawlingTestController {

	public void crawl() {
		// 크롬 드라이버 경로 설정 (크롬 드라이버 설치 필요)
		System.setProperty("webdriver.chrome.driver", "C:/work/chromedriver.exe");

		// 크롬 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless"); // 브라우저를 표시하지 않고 실행할 경우

		// 웹 드라이버 초기화
		WebDriver driver = new ChromeDriver(options);

		try {
			// 크롤링할 웹 페이지 URL
			String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%EB%B6%80%EB%8F%99%EC%82%B0";
			// 웹 페이지 열기
			driver.get(url);

			// 정보를 담고 있는 요소들 찾기
			List<WebElement> elements = driver.findElements(By.cssSelector(".news_tit"));

			// 결과를 파일에 저장
//			saveToFile(elements, "output.txt");

			// 결과를 콘솔에 출력
			for (WebElement element : elements) {
				String title = element.getText();
				System.out.println(title);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 웹 드라이버 종료
			driver.quit();
		}
	}

//	private void saveToFile(List<WebElement> elements, String fileName) throws IOException {
//		FileWriter writer = new FileWriter(fileName);
//		for (WebElement element : elements) {
//			String title = element.findElement(By.cssSelector(".ellipsis.rank01")).getText();
//			writer.write(title + "\n");
//		}
//		writer.close();
//		System.out.println("데이터를 파일에 저장했습니다.");
//	}

	public static void main(String[] args) {
		UsrCrawlingTestController webCrawler = new UsrCrawlingTestController();
		webCrawler.crawl();
	}
}
