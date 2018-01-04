package org.shin.demo.rtest.service;

import java.util.List;
import java.util.Map;

public interface RealTimeService {
   public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception;
   public List<Map<String, Object>> selectGraphList(Map<String, Object> map) throws Exception;
   public List<Map<String, Object>> selectGraphList(String sqlParam ,Map<String, Object> map) throws Exception;
   public org.shin.demo.rtest.dto.GraphLimit selectGraphOne(String sqlParam) throws Exception;
}
