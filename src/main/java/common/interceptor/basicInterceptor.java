package common.interceptor;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.stream.service.streamService;
import com.khfinal.project.stream.vo.streamVo;

// interceptor 
// DispatcherSerclet이 컨트롤러를 호출하기 전에
// 요청을 가로채서 원하는 작업을 진행 가능
// 순서 
// servletContainer -> filter(서블릿 호출하기 전에 요청을 가로챌수 있다.) -> servlet 
// -> interceptor(서블릿이 컨트롤러를 호출하기 전에 요청을 가로챌수 있다.) -> controller
// 이벤트 발생시 Listener가 호출
public class basicInterceptor implements HandlerInterceptor {

	@Autowired
	streamService streamservice;
	private Logger logger = LoggerFactory.getLogger(basicInterceptor.class);
	
	// 컨트롤러 수행전에 가로챔.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// return 타입 boolean 
		// true반환시 : 컨트롤러를 정상적으로 호출
		// false 반환시 : 컨트롤러를 호출하지않음
		logger.info("[interceptor] : basicInterceptor preHandle");
		
		HttpSession session = request.getSession();
		
		// 현재 스트리밍 상태를 가진 session 값 인경우 처리 - 스트리밍에서 나왔다고 판단.
		if(session.getAttribute("inStreamState") != null) {
			// 현재스트림의 인원
			String[] streamSet = (String[]) session.getAttribute("inStreamState");
			if(streamservice.get(streamSet[0]) != null) {
				Map<String,Object> people = streamservice.get(streamSet[0]).getPeople();	// 1. 인원체크 
				String userid = streamSet[1];
				
				if(people.get(userid) != null) {	// 현재 인원중 동일 아이디 존재함
					people.remove(userid);
				}
			}
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
