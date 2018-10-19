package com.houseprice.project.news.naver_API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.houseprice.project.news.data.API_INFO;



public class Naver_API {

	static String removetag(String text) {
		text = text.replaceAll("<b>", "");
		text = text.replaceAll("</b>", "");
		text = text.replaceAll("\"", "");
		text = text.replaceAll(",", ".");
		return text;
	}
	
	private void init(String keyWord) {
		
		String clientId = API_INFO.clientId;
        String clientSecret = API_INFO.clientSecret;//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(keyWord, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text; // json 결과
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
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
	}
	
	private void jsonParser(StringBuffer response) {
		
		JsonParser parser = new JsonParser();
        JsonObject jsonObject = (JsonObject)parser.parse(response.toString());
        String target_tag = "";
        JsonArray array = (JsonArray)jsonObject.get(target_tag);
        
        for(int i = 0; i < array.size(); i++) {
        	JsonObject obj = (JsonObject)array.get(i);
//        	String title = obj.get("title").getAsString();
//        	title = removetag(title);
//        	vo.setAtitle(title);
        }
        
        
	}
}
