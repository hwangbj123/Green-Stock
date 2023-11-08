package com.green.greenstock.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.NewsCrawlDTO;

@Service
public class CrawlService {

	/*
	 * public Map<String, String> indexCrawl() { try { // 아래 URL 은 삭제되었을 수 있으므로, 문제가
	 * 발생한다면 최신 기사의 URL 을 사용한다. //
	 * https://www.google.com/search?q=%EC%97%90%EC%BD%94%ED%94%84%EB%A1%9C&dpr=1
	 * Document doc = Jsoup.connect("https://finance.naver.com/").get(); Elements
	 * element2 = doc.select(".num"); System.out.println("실행됨"); Map<String, String>
	 * map = new HashMap<>(); map.put("cospivalue", element2.get(1).text());
	 * map.put("cosdaqvalue", element2.get(2).text()); map.put("cospi200value",
	 * element2.get(3).text()); return map; } catch (IOException e) { // e 에는 thumb
	 * 클래스와 a 가 있다. e.printStackTrace(); return null; } }
	 * 
	 * public List<NewsCrawlDTO> newsCrawl() { try { Document doc =
	 * Jsoup.connect("https://finance.naver.com/news/mainnews.naver").get(); //
	 * System.out.println(doc.select(".newsList")); // dl 을 다 모은다. Elements newsList
	 * = doc.select(".newsList"); Elements newsContents = newsList.select("dl");
	 * List<NewsCrawlDTO> newsCrawlList = new ArrayList<>(); newsContents.forEach(e
	 * -> { NewsCrawlDTO dto = new NewsCrawlDTO(); //
	 * dto.setThumb(e.select(".thumb img").attr("src"));
	 * dto.setAhref(e.select(".articleSubject a").attr("abs:href")); String imglink
	 * = e.select(".articleSubject a").attr("abs:href"); try { Document redirectdoc
	 * = Jsoup.connect(imglink).get(); Element scriptTag =
	 * redirectdoc.select("script").first(); String scriptContent =
	 * scriptTag.html(); // href 경로 추출 String href =
	 * scriptContent.replace("top.location.href='", "").replace("';", "");
	 * System.out.println(href); dto.setThumb(lazyLoadImg(href)); } catch
	 * (IOException e1) { // TODO Auto-generated catch block e1.printStackTrace(); }
	 * dto.setSubject(e.select(".articleSubject a").text());
	 * dto.setSummary(e.select(".articleSummary").text());
	 * dto.setCompany(e.select(".articleSummary .press").text());
	 * dto.setRegdate(e.select(".articleSummary .wdate").text());
	 * newsCrawlList.add(dto); }); System.out.println(newsCrawlList.size());
	 * System.out.println(newsCrawlList.toString()); return newsCrawlList; } catch
	 * (IOException e) { e.printStackTrace(); } return null; }
	 * 
	 * public String lazyLoadImg(String imgLink) {
	 * //C:\workspace\teamPrj\Green-Stock
	 * System.setProperty("webdriver.chrome.driver",
	 * "c:/workspace/teamPrj/Green-Stock/chromedriver.exe"); ChromeOptions options =
	 * new ChromeOptions(); options.addArguments("--remote-allow-origins=*");
	 * options.addArguments("--headless"); // Headless 모드 활성화 WebDriver driver = new
	 * ChromeDriver(options);
	 * 
	 * try { driver.get(imgLink); // 이미지 로딩을 위해 페이지를 불러옵니다.
	 * 
	 * // 이미지 URL 추출 WebElement imgElement =
	 * driver.findElement(By.cssSelector("#img1")); String imgSrc =
	 * imgElement.getAttribute("src"); System.out.println("이미지 URL: " + imgSrc);
	 * return imgSrc; // 이미지 URL을 반환 } catch (Exception e) { e.printStackTrace();
	 * return null; // 에러 발생 시 null 반환 } finally { driver.quit(); // WebDriver 종료 }
	 * }
	 */

}
