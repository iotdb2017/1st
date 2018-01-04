<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link class="include" rel="stylesheet" type="text/css"
	href="/js/jquery/jquery.jqplot.css" />
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqplot.js"></script>

<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.barRenderer.js"></script>

<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/js/jquery/plugins/jqplot.dateAxisRenderer.js"></script>




<script type="text/javascript">
	var plot;
	var chartData = [ [ [ 0, 0 ] ] ];

	$(document).ready(function() {
		renderChart();
		update();
	});

	function renderChart() {

		plot = $.jqplot('morris-area-chart', chartData, {
			title : 'Realtime Monitoring',
			axes : {
				xaxis : {
					label : 'Date',
					renderer : $.jqplot.DateAxisRenderer,
					tickOptions : {
						formatString : '%Y-%m-%d %H:%M:%S',
						angle : -90
					},
					tickInterval : '30 seconds'
				},

			},
			series : [ {
				color : '#5FAB78'
			} ],
			highlighter : {
				show : true,
				sizeAdjust : 7.5
			},
			cursor : {
				show : false
			}
		});
	}

	function getChartData() {

		$.ajax({
			url : "/rtest/getLastdata.do",
			type : "get",
			data : {
				"id" : $("#id").val(),
				"SITE" : $("#graphSite").val()
			},
			success : function(responseData) {
				var data = JSON.parse(responseData);
				if (!data) {
					alert("수신된 데이타가 없습니다.");
					return false;
				}

				var str = '';

				for (var i = 0; i < data.length; i++) {
					str += '<tr>'
					str += '<td>' + data[i].TIME + '</td>';
					str += '<td>' + data[i].SITE + '</td>';
					str += '<td>' + data[i].BUILDING + '</td>';
					str += '<td>' + data[i].FLOOR + '</td>';
					str += '<td>' + data[i].SECTOR + '</td>';
					str += '<td>' + data[i].SENSOR + '</td>';
					str += '<td>' + data[i].VALUE_COL_1 + '</td>';
					str += '<td>' + data[i].VALUE_COL_2 + '</td>';
					str += '<td>' + data[i].VALUE_COL_3 + '</td>';
					str += '<td>' + data[i].VALUE_COL_4 + '</td>';
					str += '<td>' + data[i].VALUE_COL_5 + '</td>';
					str += '<td>' + data[i].VALUE_COL_6 + '</td>';
					str += '</tr>';

				}
				$("#bodyData").html(str);
			},
			error : function(e) {
				console.log(e);
			}

		});
				

		var minDate;
		var maxDate;
		$.ajax({
			url : "/rtest/getGraphLimit.do",
			type : "get",
			data : {
				"id" : $("#id").val()
			},
			success : function(responseData) {
				var data = JSON.parse(responseData);
				minDate = data.minDate;
				maxDate = data.maxDate;
			},
			error : function(e) {
				console.log(e);
			}

		});
				
		$.ajax({
			url : '/rtest/getrealMultidata.do',
			type : 'get',
			data : {
				"id" : $("#id").val(),
				"SITE" : $("#graphSite").val()
			},
			success : function(responseData)  {
				//var data = JSON.parse(responseData);
				chartData=eval(responseData);
				//chartData=data.graph;
		              //alert(chartData);
				plot = $.jqplot('morris-area-chart', chartData, {
					title : 'Realtime Monitoring',
					axes : {
						xaxis : {
							label : 'Date',
							renderer : $.jqplot.DateAxisRenderer,
							tickOptions : {
							//	formatString : '%Y-%m-%d %H:%M:%S'
								formatString : '%H:%M:%S',
								//, showLabel: false
								//, showGridline: false
											angle : -90
							}
							//numberTicks: 18
							,min : minDate
							,max : maxDate
							,tickInterval : '10 second'
							//,tickInterval : '5 minute'
										
						},
				
						yaxis : {
							
							tickOptions:{
								fontString : '%1f'
							}
						}

					},
					series : [ {
						color : 'red',
						label : '온도'
					},
					{
						color : 'orange',
						label : '습도'
					},
					{
						color : 'yellow',
						label : '조도'
					},
					{
						color : 'blue',
						label : '물'
					},
					{
						color : 'green',
						label : '가스'
					},
					{
						color : 'purple',
						label : '전기'
					},],
					highlighter : {
						show : true,
						sizeAdjust : 7.5,
					},
					cursor : {
						show : false
						,tooltipLocation:'sw'
					},
					
					legend : { // Legend 옵션  
					    renderer : $.jqplot.EnhancedLegendRenderer,
					    show : true, // Legend 표시 유무
					    placement : 'outside', // Legend 위치 (Default값은 inside)
					    textColor : 'black',  // Legend 내부 Text Color
					    rowSpacing : '0px',  // Legend 들간의 사이 공간
					    location : 'ne'  // Legend 위치 (e,w,s,n)(동,서,남,북) 조합가능
					}
				
				}).replot(); // 다시 그릴 땐 replot을 활용해야 함.

				//GRID UPDATE

			},
			error : function(e) {
				console.log(e);
			}
		});
	}
			
	function update() {
		getChartData();
		setTimeout(update, 1000 * 5 * 1); // 5초 주기로 갱신

	}
				

	

	
</script>
</head>

<div>
	<%@ include file="../header.jsp"%>
</div>
<body>


	<div id="page-wrapper">
		<br /> <br />
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-comments fa-5x"></i>
							</div>
							<div class="col-xs-9 text-center">
								<div class="huge">Monitoring</div>
							</div>

						</div>
					</div>
					<a href="/rtest/index.do">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>

		</div>
		<!-- /.row -->

		<div class="row">
			<form action="" method="get">
				<div class="col-lg-12">
					<div class="panel panel-default col-lg-12">
						<div class="panel-heading">
							<i class="fa fa-check fa-fw"></i> SITE 선택
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" style="min-height: 120px;">
							<select class="form-control" name="SITE" id="graphSite">
								<option selected value=1>ALTIBASE</option>
								<option value=2>DATABRICK</option>
								<option value=3>MIRANET</option>
							</select>

						</div>
						<!-- /.panel-body -->
						<center>
							<input id="btnSite" type="button" value="조회">
						</center>

					</div>
					<!-- /.panel -->
				</div>

			</form>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default col-lg-12">

					<div class="panel-body ">
						<div id="morris-area-chart"></div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->

			</div>
			<!-- /.col-lg-12 -->

		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default col-lg-12">

					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>TIMESTAMP</th>
										<th>SITE</th>
										<th>BUILDING</th>
										<th>FLOOR</th>
										<th>SECTOR</th>
										<th>SENSOR</th>
										<th>온도</th>
										<th>습도</th>
										<th>조도</th>
										<th>물</th>
										<th>가스</th>
										<th>전기</th>
									</tr>
								</thead>
								<tbody id="bodyData">
									<c:forEach items="${lists}" var="rd">
										<tr>
											<td>${rd.TIME}</td>
											<td>${rd.SITE}</td>
											<td>${rd.BUILDING}</td>
											<td>${rd.FLOOR}</td>
											<td>${rd.SECTOR}</td>
											<td>${rd.SENSOR}</td>
											<td>${rd.VALUE_COL_1}</td>
											<td>${rd.VALUE_COL_2}</td>
											<td>${rd.VALUE_COL_3}</td>
											<td>${rd.VALUE_COL_4}</td>
											<td>${rd.VALUE_COL_5}</td>
											<td>${rd.VALUE_COL_6}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.table-responsive -->
						
						
					</div>
					<!-- /.col-lg-4 (nested) -->
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->

	<script type="text/javascript">

		$("#btnSite").click(getChartData);
	</script>


	<!-- Bootstrap Core JavaScript -->
	<script src="/js/startmin/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/js/startmin/js/metisMenu.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="/js/startmin/js/startmin.js"></script>



</body>
</html>