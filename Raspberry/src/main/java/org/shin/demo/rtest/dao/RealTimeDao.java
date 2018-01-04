package org.shin.demo.rtest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("realTimeDAO")
public class RealTimeDao extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("realtime.selectList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGraphList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("realtime.selectGraphList", map);
	}   
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectParamList(String mybatisId,Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList(mybatisId, map);
	}

	
	

}
