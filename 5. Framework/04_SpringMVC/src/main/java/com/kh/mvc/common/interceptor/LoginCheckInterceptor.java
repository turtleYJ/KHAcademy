package com.kh.mvc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/*
 * 인터셉터
 *  - 컨트롤러에 들어오는 요청(HttpRequest)과 응답(HttpResponse)을 가로채는 역할을 한다.
 *  - 인터셉터를 구현하기 위해서는 HandlerInterceptorAdapter 클래스를 상속하는 방법으로 구현해야 한다.
 *  
 * 필터와의 차이점
 *  - 필터는 Servlet 수행 전에 실행된다. Spring 자원을 이용할 수 없다. (web.xml에 설정)
 *  - 인터셉터는 DispatcherServlet 수행 후 컨트롤러에 요청을 넘기기 전에 실행된다. Spring 자원을 이용할 수 있다. (Servlet-context.xml에 설정)
 *  
 */

@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러가 실행되기 전에 필요한 작업을 할 수 있는 메소드이다.
		// 반환값이 false일 경우 컨트롤러를 실행하지 않는다.
		log.info("preHandle() call..");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 후 이용이 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 실행된 후에 필요한 작업을 할 수 있는 메소드이다.
		log.info("postHandle() call..");
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 컨트롤러의 처리가 끝나고 화면(View) 처리까지 모두 완료되면 실행되는 메소드이다.
		log.info("afterCompletion() call..");
		
		super.afterCompletion(request, response, handler, ex);
	}
	
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 비동기 요청 시 postHandle, afterCompletion이 수행되지 않고 afterConcurrentHandlingStarted 메소드가 실행된다.
		log.info("afterConcurrentHandlingStarted() call..");
		
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
