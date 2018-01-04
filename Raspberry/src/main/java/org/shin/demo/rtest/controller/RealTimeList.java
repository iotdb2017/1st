package org.shin.demo.rtest.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.shin.demo.rtest.dto.GraphLimit;
import org.shin.demo.rtest.service.RealTimeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RealTimeList {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="realTimeService")
	private RealTimeService rtService;
	
	
	@RequestMapping(value="/rtest/index.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/realtime/Dashboard");
    	return mv;
    }
	@RequestMapping(value= "/rtest/getLastdata.do")
	public void realLastAjax(HttpServletRequest request,  
	        HttpServletResponse response,Map<String,Object> commandMap) 
	        		throws Exception  {
		String site = request.getParameter("SITE");
		
    	log.info("getLastdata");
    	StringBuilder json=new StringBuilder();
    	commandMap.put("SITE_ID", site);
    	List<Map<String,Object>> list = rtService.selectGraphList("selectLast",commandMap);
       
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		
    		json.append( String.format("{\"TIME\":\"%s\",\"SITE\":\"%s\",\"BUILDING\":\"%s\",\"FLOOR\":\"%s\""
    				+ ",\"SECTOR\":\"%s\",\"SENSOR\":\"%s\",\"VALUE_COL_1\":\"%s\",\"VALUE_COL_2\":\"%s\",\"VALUE_COL_3\":\"%s\""
    				+ ",\"VALUE_COL_4\":\"%s\",\"VALUE_COL_5\":\"%s\",\"VALUE_COL_6\":\"%s\"}"
    				
    				
       				,list.get(i).get("TIME").toString()
      				,list.get(i).get("SITE").toString()
      				,list.get(i).get("BUILDING").toString()
    				,list.get(i).get("FLOOR").toString()
    				,list.get(i).get("SECTOR").toString() 
    				,list.get(i).get("SENSOR").toString() 
    				,list.get(i).get("VALUE_COL_1").toString()
    				,list.get(i).get("VALUE_COL_2").toString()
    				,list.get(i).get("VALUE_COL_3").toString()
    				,list.get(i).get("VALUE_COL_4").toString()
    				,list.get(i).get("VALUE_COL_5").toString()
    				,list.get(i).get("VALUE_COL_6").toString()
    				)
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}

	    try {
	        response.getWriter().print(json.toString());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	@RequestMapping(value= "/rtest/getrealdata.do", method=RequestMethod.POST)
	public ModelAndView AjaxView( Map<String,Object> commandMap) throws Exception{
	    ModelAndView mav= new ModelAndView();
    	List<Map<String,Object>> list = rtService.selectGraphList(commandMap);
    	List<List> result=new ArrayList<List>();
    	log.info("getrealdata");
      
    	int nDataLen=list.size();
    	for(int i=0;i<nDataLen;i++) {
    		List<Object> objList=new ArrayList<Object>();
    		objList.add(list.get(i).get("TIME_STAMP") );
    		log.info( list.get(i).get("TIME_STAMP").toString());
    		objList.add(list.get(i).get("SITE_ID") );
    		log.info( list.get(i).get("SITE_ID").toString());
    		result.add(objList);
    	}
    	
	    mav.addObject("graph",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	

	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/rtest/getrealdata1.do")
	public @ResponseBody 
	Object[] getJsonByMap(Map<String,Object> commandMap) throws Exception
	{

    	List<Map<String,Object>> list = rtService.selectGraphList(commandMap);
    	log.info("@ResponseBody ==========>"+list.size());
		Object[] rows = new Object[list.size()];
		int i = 0;
		for (Map<String,Object> table : list) {
			Object[] temp = new Object[2];
			temp[0] = table.get("TIME_STAMP");
			temp[1] = table.get("SITE_ID");
			rows[i] = temp;
     		i++;
		}
		Object[] object = new Object[1];
		object[0] = rows;
		return object;
    	
	}
	//Controller
	@RequestMapping(value= "/rtest/getrealdata2.do")
	public void AjaxView(  
	        HttpServletResponse response,Map<String,Object> commandMap) 
	        		throws Exception  {
    	List<Map<String,Object>> list = rtService.selectGraphList(commandMap);
    	log.info("getrealdata2");
    	StringBuilder json=new StringBuilder();
       
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("SITE_ID").toString()  )
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	//json.append("]");
	    try {
	        response.getWriter().print(json.toString());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
	}
	//Controller
	@RequestMapping(value= "/rtest/getrealMultidata.do")
	public void realDataView(HttpServletRequest request, 
	        HttpServletResponse response,Map<String,Object> commandMap) 
	        		throws Exception  {
    	log.info("getrealMultidata");
    	String site = request.getParameter("SITE");
    	StringBuilder json=new StringBuilder();
    	///기간 조회

    	json.append("[");
    	commandMap.put("SITE_ID", site);
    	getRealData1("selectGraphListParam1",commandMap,json);
    	json.append(",");
    	getRealData2("selectGraphListParam2",commandMap,json);
    	json.append(",");
    	getRealData3("selectGraphListParam3",commandMap,json);
    	json.append(",");
    	getRealData4("selectGraphListParam4",commandMap,json);
    	json.append(",");
    	getRealData5("selectGraphListParam5",commandMap,json);
    	json.append(",");
    	getRealData6("selectGraphListParam6",commandMap,json);
    	json.append("]");
    	
    	
	    try {
	        response.getWriter().print(json.toString());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
	}
	//Controller
	@RequestMapping(value= "/rtest/getGraphLimit.do")
	public void getGraphLimit(  
	        HttpServletResponse response,Map<String,Object> commandMap) 
	        		throws Exception  {

    	log.info("getGraphLimit");
    
    	StringBuilder json=new StringBuilder();
    	///기간 조회
    	GraphLimit limit = (org.shin.demo.rtest.dto.GraphLimit)rtService.selectGraphOne("selectTimeInterval");
    	log.info("list.get(0).get(\"minDate\")"+ limit.getMaxDate());
    	json.append("{");
    	json.append(String.format("\"%s\":\"%s\",","minDate",limit.getMinDate()));
    	json.append(String.format("\"%s\":\"%s\"","maxDate",limit.getMaxDate()));
    	json.append("}");
	    try {
	        response.getWriter().print(json.toString());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
	}
	public void getRealData1(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_1").toString())
    		);
    		if(nDataLen==(i+1)) {
    			log.info("Last Date"+list.get(i).get("TIME_STAMP").toString());
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	public void getRealData2(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_2").toString())
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	public void getRealData3(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_3").toString())
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	public void getRealData4(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_4").toString())
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	public void getRealData5(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_5").toString())
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	public void getRealData6(String sqlParam,Map<String,Object> commandMap,StringBuilder json)
			throws Exception {
	 	List<Map<String,Object>> list = rtService.selectGraphList(sqlParam,commandMap);
    	
      
    	int nDataLen=list.size();
    	//json.append("[");
    	for(int i=0;i<nDataLen;i++) {
    		//log.info(i+":"+list.get(i).get("LOG_DATE"));
    		if(0==i) json.append("[");
    		json.append( String.format("['%s',%s]"
    				,list.get(i).get("TIME_STAMP").toString()
    				,list.get(i).get("VALUE_COL_6").toString())
    		);
    		if(nDataLen==(i+1)) {
    			json.append("]");
    		}else {
    			json.append(",");
    		}
    	}
    	
	}
	
	
}


