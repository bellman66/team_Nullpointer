package common.aop;

import org.aspectj.lang.JoinPoint; 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {

	public void before(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");

		logger.info("--------------LogAop Start--------------");
		Object[] args = join.getArgs();

		if (args != null) {
			logger.info("method : " + join.getSignature().getName());
			for (int i = 0; i < args.length; i++) {
				logger.info(i + "번째 : " + args[i]);
			}
		}
	}

	public void after(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("--------------LogAop End--------------");
	}

	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");

		logger.info("--------------Err log--------------");
		logger.info("ERROR : " + join.getArgs());
		logger.info("ERROR :  " + join.toString());
	}

}
