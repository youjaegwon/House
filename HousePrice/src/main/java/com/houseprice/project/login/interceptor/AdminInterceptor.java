package com.houseprice.project.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.houseprice.project.register.model.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
    
    // 페이지 요청 정보 저장
    private void saveDestination(HttpServletRequest request) {
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }

        if (request.getMethod().equals("GET")) {
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        MemberVO memberVO = (MemberVO)httpSession.getAttribute("login");
        if (memberVO.getAno() == 3) {
            logger.info("관리자 url 접근 제한");
            saveDestination(request);
            response.sendRedirect("/login/admin");
            return false;
        }

        return true;
    }
}
