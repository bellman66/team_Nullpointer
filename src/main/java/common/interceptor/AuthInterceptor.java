package common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

// interceptor 
// DispatcherSerclet이 컨트롤러를 호출하기 전에
// 요청을 가로채서 원하는 작업을 진행 가능
// 순서 
// servletContainer -> filter(서블릿 호출하기 전에 요청을 가로챌수 있다.) -> servlet 
// -> interceptor(서블릿이 컨트롤러를 호출하기 전에 요청을 가로챌수 있다.) -> controller
// 이벤트 발생시 Listener가 호출
public class AuthInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	// 컨트롤러 수행전에 가로챔.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// return 타입 boolean 
		// true반환시 : 컨트롤러를 정상적으로 호출
		// false 반환시 : 컨트롤러를 호출하지않음
		logger.info("[interceptor] : preHandle");
		HttpSession session = request.getSession();
		
		if(request.getRequestURI().contains("book/") && session.getAttribute("logInInfo")==null) {
			request.setAttribute("msg", "로그인 이후 사용가능한 기능입니다.");
			request.setAttribute("back", "back");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			
			// 해당 forward 발생시오류남 
			// 오류 : 응답이 이미 커밋된 후에는 forward할 수 없습니다.
			dispatcher.forward(request, response);
		}
		
		return true;
	}

	// 컨트롤러가 수행되고 view를 호출하기 전
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	// view 호출이 완료된 후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		//HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
