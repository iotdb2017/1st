<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Startmin - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/js/startmin/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/js/startmin/css/metisMenu.min.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="/js/startmin/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/js/startmin/css/startmin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="/js/startmin/css/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/js/startmin/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<link class="include" rel="stylesheet" type="text/css"
	href="/js/jquery/jquery.jqplot.css" />
<script class="include" type="text/javascript"
	src="/js/jquery/jquery.js"></script>
<script class="include" type="text/javascript"
	src="/js/jquery/jquery.jqplot.js"> </script>
<!-- 막대그래프생성을 위한 추가 include JS파일 -->
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.barRenderer.js"></script>
<!-- 원형그래프 호출 스크립트코드 -->
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.dateAxisRenderer.js"></script>

<script type="text/javascript">
var plot;
var chartData = [[[0,0]]];    // 초기화를 []로 해주면 차트가 안그려짐. ㅠㅠ
 
$(document).ready(function() {
  //  renderChart();
   // update();
});
 
function renderChart() {
    plot = $.jqplot('real-chart', chartData, {
        title: 'Current User'
        , axes: {
            xaxis: {
               renderer:$.jqplot.DateAxisRenderer     // X축을 날짜로 표현할 것이다.
               , tickOptions: {
                   formatString: '%Y-%m-%d %H:%M:%S'   // 이건 다 아시는 dateformat임.
                //   , showLabel: false           // 데이터가 많아지면 X축이 보이지도 않을 정도가 되서 제거
                    //, showGridline: false        // 데이터 많아지면 세로라인때문에 눈이 아프더군.. 그래서 제거
                    ,angle : -90
               }
              , tickInterval:'5 minutes' // X축 간격을 5분 주기로 띄운다.    
           }
        }
        , series: [{
           color: '#5FAB78'
        }]
        , highlighter: {        // X축이 뭔지는 알아야 되니깐 마우스 오버 기능을 활용하기 위해 추가함
            show: true,
            sizeAdjust: 7.5          
        }
        , cursor: {
            show: false
        }
    });
}
 
function getChartData() {
    $.ajax({
       url: '/rtest/getrealMultidata.do'
       , type: 'POST'
       , success: function(data, textStatus, jqXHR) {
           chartData = eval(data);
           plot = $.jqplot('real-chart', chartData, {
             title: 'Current User'
             , axes: {
                 xaxis: {
                	label : '날 짜',
                    renderer:$.jqplot.DateAxisRenderer
                    , tickOptions: {
                        formatString: '%Y-%m-%d %H:%M:%S'
                        //, showLabel: false
                        //, showGridline: false
                        ,angle : -90
                    }
                    , tickInterval:'5 minutes'
                 }  
           
             }
             , series: [{
                 color: '#5FAB78'
             }]
             , highlighter:{
                 show: true,
                 sizeAdjust: 7.5          
             }
             , cursor: {
                 show: false
             }
           }).replot();    // 다시 그릴 땐 replot을 활용해야 함.
        }
        , error: function(e) {
           console.log(e);
        }
    });
}
 
function update() {
    getChartData();
    //setTimeout(update, 1000 * 60 * 1);      // 1분 주기로 갱신
    setTimeout(update, 1000 * 3);      // 3초 주기로 갱신
}

$(document).ready(function(){
// 	var chartData2=[['2016-10-30 23:59:00',1],['2016-10-30 23:58:00',4],['2016-10-30 23:57:00',5],['2016-10-30 23:56:00',1]];
//     plot = $.jqplot('morris-area-chart', [[['2016-10-30 23:59:00',1],['2016-10-30 23:58:00',4],['2016-10-30 23:57:00',5],['2016-10-30 23:56:00',1]]], {
//         title: 'Current User'
//         , axes: {
//             xaxis: {
//                renderer:$.jqplot.DateAxisRenderer     // X축을 날짜로 표현할 것이다.
//                , tickOptions: {
//                    formatString: '%Y-%m-%d %H:%M:%S'   // 이건 다 아시는 dateformat임.
//               }
//            }
//         }
//         , series: [{
//            color: '#5FAB78'
//         }]
//     }); 
//     var line1=[['2008-06-30 8:00AM',4], ['2008-7-14 8:00AM',6.5], ['2008-7-28 8:00AM',5.7], ['2008-8-11 8:00AM',9], ['2008-8-25 8:00AM',8.2]];
//     var plot2 = $.jqplot('chart2', [line1], {
//         title:'Customized Date Axis', 
//         axes:{
//           xaxis:{
//             renderer:$.jqplot.DateAxisRenderer, 
//             tickOptions:{formatString:'%b %#d, %#I %p'},
//             min:'June 16, 2008 8:00AM', 
//             tickInterval:'2 weeks'
//           }
//         },
//         series:[{lineWidth:4, markerOptions:{style:'square'}}]
//     });

//     $.jqplot('graph', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]], {
//         title: '막대형그래프',
//         series:[{renderer:$.jqplot.BarRenderer}],
//         axes: {
//           xaxis: {
//             renderer: $.jqplot.CategoryAxisRenderer,
//             label: "X 좌표제목"
//           },
//           yaxis: {
//             label: "Y 좌표제목"
//           }
//         }
//       });



// $.jqplot ('graph', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]],
//         {
//           seriesDefaults: {
//             //원형으로 렌더링
//             renderer: $.jqplot.PieRenderer,
//             //원형상단에 값보여주기(알아서 %형으로 변환)
//             rendererOptions: {
//               showDataLabels: true
//             }
//           },
//           //우측 색상별 타이틀 출력
//           legend: { show:true, location: 'e' }
//         }
// );
    // Script



});

</script>
</head>
<body>
	<div id="test">
		<input type="button" id="joinOk" name="Ajax" value="GET CALL" >
	</div>
	<div id="container"></div>
	<div id="morris-area-chart"></div>
    <div id="real-chart"></div>
        <div id="chart2"></div>
	<table>
		<thead>
			<tr>
				<th>Date</th>
				<th>Time</th>
				<th>value</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lists}" var="rd">
				<tr>
					<td>${rd.LOG_DT}</td>
					<td>${rd.LOG_TM}</td>
					<td>${rd.TAG_VALUE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
<form name="test" method="post" >
</form>
<script type="text/javascript">
	var chartRT=[[0,0]];
    $("#joinOk").click(function() {

    	       $.ajax({
    	           url : "/rtest/getLastdata.do",
   	             type: "get",
   	             data : { "id" : $("#id").val() },
   	             success : function(responseData){
   	                 var data = responseData;
   	                 $("#ajax").remove();
   	                 if(!data){
   	                     alert("수신된 데이타가 없습니다.");
   	                     return false;
   	                 }
   	                 chartData=data;	
   	                 $("#container").after(data);
   	             }
   	             , error: function(e) {
   	                 console.log(e);
   	              }
    	            	
   	         });
    	 
 
    });
 

 </script>
</html>