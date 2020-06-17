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
public class streamInterceptor implements HandlerInterceptor {

	@Autowired
	streamService streamservice;
	private Logger logger = LoggerFactory.getLogger(streamInterceptor.class);
	
	// 컨트롤러 수행전에 가로챔.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// return 타입 boolean 
		// true반환시 : 컨트롤러를 정상적으로 호출
		// false 반환시 : 컨트롤러를 호출하지않음
		logger.info("[interceptor] : StreamInterceptor preHandle");

		HttpSession session = request.getSession();
		
		String[] splitString = request.getRequestURI().split("/");
		String midString = splitString[3];
		String streamId = midString.substring(0,midString.length()-3);
		
		// 스트림이 열려있는지 확인
		if(streamservice.get(streamId) != null) {	
			Map<String,Object> people = streamservice.get(streamId).getPeople();
			
			if(session.getAttribute("loginInfo") != null) {
				Member user = (Member) ((Map<String, Object>) session.getAttribute("loginInfo")).get("member");
				
				// 1. 들어올때마다 카운트 올려줌
				if(people.get(user.getM_id()) == null) {	// 현재 인원중 동일 아이디 존재 x
					people.put(user.getM_id() , user.getM_id());
					
					String[] streamSet = {streamId , user.getM_id()};
					session.setAttribute("inStreamState", streamSet);
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
