package com.lx.team6springboot.service;

import org.aspectj.lang.JoinPoint;

public interface TrafficService {

	public void trafficRequest(JoinPoint joinPoint) throws Exception;
	
}