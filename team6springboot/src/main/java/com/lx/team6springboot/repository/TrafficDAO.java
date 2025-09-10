package com.lx.team6springboot.repository;

import org.apache.ibatis.annotations.Mapper;
import com.lx.team6springboot.vo.RequestLogVO;

@Mapper
public interface TrafficDAO {
    void insertRequestLog(RequestLogVO requestLogVO);
}
