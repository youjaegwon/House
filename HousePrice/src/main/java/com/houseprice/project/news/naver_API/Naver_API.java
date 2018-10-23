package com.houseprice.project.news.naver_API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.houseprice.project.news.data.API_INFO;
import com.houseprice.project.news.model.NewsVO;



public class Naver_API {

	static String removetag(String text) {
		text = text.replaceAll("<b>", "");
		text = text.replaceAll("</b>", "");
		text = text.replaceAll("\"", "");
		text = text.replaceAll(",", ".");
		text = text.replaceAll("&quot;", "'");
		return text;
	}
	
	public List<NewsVO> search(String keyWord) {
		List<NewsVO> resultList = null;
		String clientId = API_INFO.clientId;
        String clientSecret = API_INFO.clientSecret;//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(keyWord, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text +"&display=20&sort=date"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
//            System.out.println(response.toString());
            resultList = jsonParser(response);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return resultList;
	}
	
	// Tue, 23 Oct 2018 16:59:00 +0900 을 23 Oct 2018 로
	public String cutDate(String dayFormat) {
		dayFormat = dayFormat.substring(5, 16);
		
		return dayFormat;
	}
	
	// Tue, 23 Oct 2018 to 2018/10/23
	public String dateParsing(String dateText) {
		// 참고 페이지 https://stackoverflow.com/questions/27204034/how-to-parse-dd-mmm-yyyy
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd MMM yyyy", Locale.US);
		Date dateobject = null;
		String result = null;
		try {
			dateobject = (Date) dateFormatter.parse(dateText);
			dateFormatter.applyPattern("yyyy/MM/dd");
			result = dateFormatter.format(dateobject);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
	public List<NewsVO> jsonParser(StringBuffer response) {
		
		JsonParser parser = new JsonParser();
        JsonObject jsonObject = (JsonObject)parser.parse(response.toString());
        String target_tag = "items";
        JsonArray array = (JsonArray)jsonObject.get(target_tag);
        List<NewsVO> list = new ArrayList<NewsVO>();
        
        for(int i = 0; i < array.size(); i++) {
        	NewsVO vo = new NewsVO();
        	JsonObject obj = (JsonObject)array.get(i);
        	String title = obj.get("title").getAsString();
        	title = removetag(title);
        	String linkURL = obj.get("link").getAsString();
        	String pubDate = obj.get("pubDate").getAsString();
        	
        	String description = obj.get("description").getAsString();
        	description = removetag(description);
        	
//        	System.out.println("제목 : " + title);
        	String tmpdate = cutDate(pubDate);
        	pubDate = dateParsing(tmpdate);
//        	System.out.println("게시날짜 : " + pubDate);
//        	System.out.println("주소 : " + linkURL);
        	vo.setAno(i);
        	vo.setAtitle(title);
        	vo.setAoriginallink(linkURL);
        	vo.setApubDate(pubDate);
        	vo.setAyn('n');
        	vo.setDescription(description);
        	list.add(vo);
        	
        	
        }
        return list;
        
        
	}
}
