package bit.com.a.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import bit.com.a.model.CGVDetailDto;

@Controller
public class CGVDetailController {
	private static Logger logger = LoggerFactory.getLogger(CGVDetailController.class);

	@ResponseBody
	@RequestMapping(value = "detailcrawling.do", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getCrawling(HttpServletRequest request, HttpServletResponse response) {
		logger.info("디테일 크롤링" + new Date());
		Document doc;
		String gson = "";
		HttpSession session = request.getSession();
		String midx = (String) session.getAttribute("midx");

		try {
			//String midx = "86058";

			doc = Jsoup.connect("http://www.cgv.co.kr/movies/detail-view/?midx=" + midx).get();
			/* Elements */
			System.out.println("http://www.cgv.co.kr/movies/detail-view/?midx=" + midx);
			
			Element eimg = doc.selectFirst("div.box-image img");
			// String img = doc.getElementsByTag("img").toString();
			// Elements imgs = doc.select(".thumb-image > img");
			logger.info("img" + eimg);

			Element emovieAge = doc.selectFirst(".cgvIcon");
			// String movieAge = doc.getElementsByTag("ico-grade").toString();
			// Elements movieAges = doc.select(".ico-grade");
			logger.info("cgvIcon" + emovieAge);

			Element emovieTitle = doc.selectFirst("div.title strong");
			// String movieTitle = doc.getElementsByTag("box-contents.title
			// strong").toString();
			// Elements movieTitles = doc.select(".box-contents.title strong");
			logger.info("title" + emovieTitle);

			Element enowShow = doc.selectFirst("div.title em");
			// String nowShow = doc.getElementsByTag("round lightblue span").toString();
			// Elements nowShowing = doc.select(".round lightblue span");
			logger.info("showing" + enowShow);

			Element eengTitle = doc.selectFirst("div.title p");
			// String engTitle = doc.getElementsByTag("box-contents.title p").toString();
			// Elements engTitles = doc.select(".box-contents.title p");
			logger.info("english" + eengTitle);

			Element emovieRate = doc.selectFirst("strong.percent span");
			// String movieRate = doc.getElementsByTag("percent span").toString();
			// Elements movieRates = doc.select(".percent span");
			logger.info("percents" + emovieRate);

			Element edetail = doc.selectFirst("div.spec");
			// String detail = doc.getElementsByTag("spec").toString();
			// Elements details = doc.select(".spec");
			logger.info("detail info" + edetail);

			Element estory = doc.selectFirst("div.sect-story-movie");
			// String story = doc.getElementsByTag("sect-story-movie").toString();
			// Elements stories = doc.select(".sect-story-movie");
			logger.info("story" + estory);

//			 Elements likes = doc.select(".count strong>i");
//			 logger.info("counts" + likes); 
			// List<CGVDetailDto> list = new ArrayList<CGVDetailDto>();

			String img = eimg.attr("src");
			String movieAge = emovieAge.text();
			String movieTitle = emovieTitle.text();
			String nowShow = enowShow.text();
			String engTitle = eengTitle.text();
			String movieRate = emovieRate.text();
			String detail = edetail.toString();
			String story = estory.toString();

			CGVDetailDto cgvDetailDto = new CGVDetailDto(img, movieAge, movieTitle, nowShow, engTitle, movieRate,
					detail, story);

			//logger.info(cgvDetailDto.toString());
			// list.add(cgvDetailDto);
			gson = new Gson().toJson(cgvDetailDto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return gson;
	}
}
