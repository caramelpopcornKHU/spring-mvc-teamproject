package com.lx.team6springboot.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lx.team6springboot.repository.TrafficDAO;
import com.lx.team6springboot.vo.RequestLogVO;

@Service
public class TrafficServiceImpl implements TrafficService {

    @Autowired
    private TrafficDAO trafficDAO;

    @Override
    public void trafficRequest(JoinPoint joinPoint) throws Exception {
        RequestLogVO requestLogVO = new RequestLogVO();
        requestLogVO.setReqClass(joinPoint.getTarget().getClass().getName());
        requestLogVO.setReqMethod(joinPoint.getSignature().getName());
        

        trafficDAO.insertRequestLog(requestLogVO);
    }
}
