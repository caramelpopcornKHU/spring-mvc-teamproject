package com.lx.team6springboot.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lx.team6springboot.service.TrafficService;

@Aspect
@Component
public class TrafficLoggingAspect {

    @Autowired
    private TrafficService trafficService;

    // com.lx.team6springboot.controller 패키지 하위의 모든 public 메소드가 실행되기 전에 이 코드를 실행
    @Before("execution(public * com.lx.team6springboot.controller..*(..))")
    public void logTraffic(JoinPoint joinPoint) throws Exception {
        System.out.println("AOP logTraffic executed for: " + joinPoint.getSignature().getName());
        // Spring AOP가 자동으로 JoinPoint 객체를 생성하여 넘겨줍니다.
        trafficService.trafficRequest(joinPoint);
    }
}
