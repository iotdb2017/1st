<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">





</head>

<div>
	<%@ include file="header.jsp"%>
</div>

<body>


	<div id="page-wrapper">
		<br /> <br />

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-6 col-md-6">
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
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-center">
								<div class="huge">Analytic</div>
							</div>
						</div>
					</div>
					<a href="/rtest/analytic.do">
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
			<ul class="nav nav-pills nav-justified" id="myTab">
				<li class="active"><a data-toggle="tab" href="#twoGraph">이중축
						그래프</a></li>
				<li><a data-toggle="tab" href="#corrplot">상관분석</a></li>
				<li><a data-toggle="tab" href="#boxplot">Boxplot</a></li>
				<li><a data-toggle="tab" href="#plot">산점도</a></li>
			</ul>
			<br>



			<div class="tab-content">
				<div id="twoGraph" class="tab-pane fade in active">

					<div class="col-lg-12">

						<form action="" method="post">
							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> 날짜 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body" style="min-height: 120px;">
									<select class="form-control" name="graphDate" id="graphDate">
										
										<option selected>2016-10-29</option>
										<option>2016-10-30</option>
									</select>

								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->

							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> Tag 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body" style="min-height: 120px;">

									<select class="form-control" name="graphTag1" id="graphTag1">

										<option selected>Defect_Count</option>
										<option>Icu_SpnADrv.ActualVelocity</option>
										<option>HMI_Icu_SpnARPMSpdFbk</option>
										<option>Icu_SpnBDrv.AverageVelocity</option>
										<option>Icu_DanPosFbk</option>
										<option>Icu_SpnB.RunRef.RpmRef</option>
										<option>CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</option>
										<option>HMI_Icu_RegNipData.GearRatio</option>
										<option>ICU_RepLenAdj</option>
										<option>Icu_SpnBDrv.ActualVelocity</option>
										<option>Icu_SpnADrv.AverageVelocity</option>
										<option>INS_RegGrapData.Phs_Amt_L31</option>


									</select> <br> <select class="form-control" name="graphTag2"
										id="graphTag2">

										<option>Defect_Count</option>
										<option selected>Icu_SpnADrv.ActualVelocity</option>
										<option>HMI_Icu_SpnARPMSpdFbk</option>
										<option>Icu_SpnBDrv.AverageVelocity</option>
										<option>Icu_DanPosFbk</option>
										<option>Icu_SpnB.RunRef.RpmRef</option>
										<option>CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</option>
										<option>HMI_Icu_RegNipData.GearRatio</option>
										<option>ICU_RepLenAdj</option>
										<option>Icu_SpnBDrv.ActualVelocity</option>
										<option>Icu_SpnADrv.AverageVelocity</option>
										<option>INS_RegGrapData.Phs_Amt_L31</option>
									</select>

								</div>
								<!-- /.panel-body -->


							</div>
							<!-- /.panel -->

							<center>
								<input id="btnGraph" type="button" value="조회">
							</center>

						</form>
						<br>
						<div class="panel panel-default col-lg-12">
							<div class="panel-body">
								<div class="table-responsive">
								<center>
									<div id="rimagegraph"></div>
								</center>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.col-lg-4 (nested) -->
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->

					</div>
					<!-- /.col-lg-12 -->
				</div>

				<div id="corrplot" class="tab-pane fade">

					<div class="col-lg-12">

						<form action="" method="post">
							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> 날짜 선택 / Tag 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body" style="min-height: 465px;">
									<select class="form-control" name="Date" id="corrplotDate">
										
										<option selected>2016-10-29</option>
										<option>2016-10-30</option>
									</select>
									<br />
									<input type="checkbox" id="inlineCheckbox1"
										name="inlineCheckbox1" value="Defect_Count"> <label
										for="inlineCheckbox1">Defect_Count</label> <br /> <input
										type="checkbox" id="inlineCheckbox2" name="inlineCheckbox2"
										value="Icu_SpnADrv.ActualVelocity"> <label
										for="inlineCheckbox2">Icu_SpnADrv.ActualVelocity</label> <br />

									<input type="checkbox" id="inlineCheckbox3"
										name="inlineCheckbox3" value="HMI_Icu_SpnARPMSpdFbk">
									<label for="inlineCheckbox3">HMI_Icu_SpnARPMSpdFbk</label> <br />

									<input type="checkbox" id="inlineCheckbox4"
										name="inlineCheckbox4" value="Icu_SpnBDrv.AverageVelocity">
									<label for="inlineCheckbox4">Icu_SpnBDrv.AverageVelocity</label>
									<br /> <input type="checkbox" id="inlineCheckbox5"
										name="inlineCheckbox5" value="Icu_DanPosFbk"> <label
										for="inlineCheckbox5">Icu_DanPosFbk</label> <br /> <input
										type="checkbox" id="inlineCheckbox6" name="inlineCheckbox6"
										value="Icu_SpnB.RunRef.RpmRef"> <label
										for="inlineCheckbox6">Icu_SpnB.RunRef.RpmRef</label> <br /> <input
										type="checkbox" id="inlineCheckbox7" name="inlineCheckbox7"
										value="CMP3_IcuRegGrapFbk.Icu_RegNipGearRat"> <label
										for="inlineCheckbox7">CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</label>
									<br /> <input type="checkbox" id="inlineCheckbox8"
										name="inlineCheckbox8" value="HMI_Icu_RegNipData.GearRatio">
									<label for="inlineCheckbox8">HMI_Icu_RegNipData.GearRatio</label>
									<br /> <input type="checkbox" id="inlineCheckbox9"
										name="inlineCheckbox9" value="ICU_RepLenAdj"> <label
										for="inlineCheckbox9">ICU_RepLenAdj</label> <br /> <input
										type="checkbox" id="inlineCheckbox10" name="inlineCheckbox10"
										value="Icu_SpnBDrv.ActualVelocity"> <label
										for="inlineCheckbox10">Icu_SpnBDrv.ActualVelocity</label><br />
									<input type="checkbox" id="inlineCheckbox11"
										name="inlineCheckbox11" value="Icu_SpnADrv.AverageVelocity">
									<label for="inlineCheckbox11">Icu_SpnADrv.AverageVelocity</label>
									<br />
									<input type="checkbox" id="inlineCheckbox12"
										name="inlineCheckbox12" value="INS_RegGrapData.Phs_Amt_L31">
									<label for="inlineCheckbox12">INS_RegGrapData.Phs_Amt_L31</label>



								</div>
								<!-- /.panel-body -->


								<center>
									<input id="btnCorrplot" type="button" value="조회">
								</center>
							</div>
							<!-- /.panel -->

						</form>
						<div class="panel panel-default col-lg-6">
							<div class="panel-body" style="min-height: 400px;">
								<div class="table-responsive">
									<div id="rimagecorrplot"></div>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.col-lg-4 (nested) -->
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->

					</div>
					<!-- /.col-lg-12 -->
				</div>

				<div id="boxplot" class="tab-pane fade">
					<div class="col-lg-12">

						<form action="" method="post">
							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> 날짜 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body ">
									<select class="form-control" name="Date" id="boxplotDate">
									
										<option selected>2016-10-29</option>
										<option>2016-10-30</option>
									</select>


								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->

							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> Tag 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">

									<select class="form-control" name="Tag" id="boxplotTag">

										<option selected>Defect_Count</option>
										<option>Icu_SpnADrv.ActualVelocity</option>
										<option>HMI_Icu_SpnARPMSpdFbk</option>
										<option>Icu_SpnBDrv.AverageVelocity</option>
										<option>Icu_DanPosFbk</option>
										<option>Icu_SpnB.RunRef.RpmRef</option>
										<option>CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</option>
										<option>HMI_Icu_RegNipData.GearRatio</option>
										<option>ICU_RepLenAdj</option>
										<option>Icu_SpnBDrv.ActualVelocity</option>
										<option>Icu_SpnADrv.AverageVelocity</option>
										<option>INS_RegGrapData.Phs_Amt_L31</option>
									</select>

								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
							<center>
								<input id="btnBoxplot" type="button" value="조회">
							</center>
						</form>
						<br>
						<div class="panel panel-default col-lg-12">
							<div class="panel-body">
								<div class="table-responsive">
								<center>
									<div id="rimageboxplot"></div>
								</center>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.col-lg-4 (nested) -->
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->

					</div>
					<!-- /.col-lg-12 -->
				</div>

				<div id="plot" class="tab-pane fade">

					<div class="col-lg-12">

						<form action="" method="post">
							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> 날짜 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body" style="min-height: 120px;">
									<select class="form-control" name="Date" id="plotDate">
										
										<option selected>2016-10-29</option>
										<option>2016-10-30</option>
									</select>

								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->

							<div class="panel panel-default col-lg-6">
								<div class="panel-heading">
									<i class="fa fa-check fa-fw"></i> Tag 선택
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body" style="min-height: 120px;">

									<select class="form-control" name="Tag1" id="plotTag1">

										<option selected>Defect_Count</option>
										<option>Icu_SpnADrv.ActualVelocity</option>
										<option>HMI_Icu_SpnARPMSpdFbk</option>
										<option>Icu_SpnBDrv.AverageVelocity</option>
										<option>Icu_DanPosFbk</option>
										<option>Icu_SpnB.RunRef.RpmRef</option>
										<option>CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</option>
										<option>HMI_Icu_RegNipData.GearRatio</option>
										<option>ICU_RepLenAdj</option>
										<option>Icu_SpnBDrv.ActualVelocity</option>
										<option>Icu_SpnADrv.AverageVelocity</option>
										<option>INS_RegGrapData.Phs_Amt_L31</option>


									</select> <br> <select class="form-control" name="Tag2"
										id="plotTag2">

										<option>Defect_Count</option>
										<option selected>Icu_SpnADrv.ActualVelocity</option>
										<option>HMI_Icu_SpnARPMSpdFbk</option>
										<option>Icu_SpnBDrv.AverageVelocity</option>
										<option>Icu_DanPosFbk</option>
										<option>Icu_SpnB.RunRef.RpmRef</option>
										<option>CMP3_IcuRegGrapFbk.Icu_RegNipGearRat</option>
										<option>HMI_Icu_RegNipData.GearRatio</option>
										<option>ICU_RepLenAdj</option>
										<option>Icu_SpnBDrv.ActualVelocity</option>
										<option>Icu_SpnADrv.AverageVelocity</option>
										<option>INS_RegGrapData.Phs_Amt_L31</option>
									</select>

								</div>
								<!-- /.panel-body -->


							</div>
							<!-- /.panel -->

							<center>
								<input id="btnPlot" type="button" value="조회">
							</center>

						</form>
						<br>
						<div class="panel panel-default col-lg-12">
							<div class="panel-body">
								<div class="table-responsive">
								<center>
									<div id="rimageplot"></div>
								</center>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.col-lg-4 (nested) -->
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->

					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
		</div>
		<!-- /#row -->
	</div>
	<!-- /#page-wrapper -->

	<!-- /#wrapper -->

	<!-- jQuery -->
	<!--         <script src="/js/startmin/js/jquery.min.js"></script> -->



	<script type="text/javascript">
		function callGraph() {
			$.ajax({

						url : "/rscript/graph.do",
						type : "post",
						data : {
							"Date" : $("#graphDate").val(),
							"Tag1" : $("#graphTag1").val(),
							"Tag2" : $("#graphTag2").val()
						},
						success : function(responseData) {
							//alert(responseData);
							var data = JSON.parse(responseData);
							//$("#ajax").remove();
							if (!data) {
								alert("수신된 데이타가 없습니다.");
								return false;
							}
							str = "<img src=\""+data.image+"\">";
							$("#rimagegraph").html(str);
						},
						error : function(e) {
							console.log(e);
						}

					});
		}
		
		function callCorrplot() {
			$.ajax({
						url : "/rscript/corrplot.do",
						type : "post",
						data : {
							"Date" : $("#corrplotDate").val(),
							"inlineCheckbox1" : $("input[name='inlineCheckbox1']:checked").val(),
							"inlineCheckbox2" : $("input[name='inlineCheckbox2']:checked").val(),
							"inlineCheckbox3" : $("input[name='inlineCheckbox3']:checked").val(),
							"inlineCheckbox4" : $("input[name='inlineCheckbox4']:checked").val(),
							"inlineCheckbox5" : $("input[name='inlineCheckbox5']:checked").val(),
							"inlineCheckbox6" : $("input[name='inlineCheckbox6']:checked").val(),
							"inlineCheckbox7" : $("input[name='inlineCheckbox7']:checked").val(),
							"inlineCheckbox8" : $("input[name='inlineCheckbox8']:checked").val(),
							"inlineCheckbox9" : $("input[name='inlineCheckbox9']:checked").val(),
							"inlineCheckbox10" : $("input[name='inlineCheckbox10']:checked").val(),
							"inlineCheckbox11" : $("input[name='inlineCheckbox11']:checked").val(),
							"inlineCheckbox12" : $("input[name='inlineCheckbox12']:checked").val()
						},
						success : function(responseData) {
							//alert(responseData);
							var data = JSON.parse(responseData);
							//$("#ajax").remove();
							if (!data) {
								alert("수신된 데이타가 없습니다.");
								return false;
							}
							str = "<img src=\""+data.image+"\">";
							$("#rimagecorrplot").html(str);
						},
						error : function(e) {
							console.log(e);
						}

					});
		}
		
		function callBoxplot() {
			$.ajax({

						url : "/rscript/boxplot.do",
						type : "post",
						data : {
							"Date" : $("#boxplotDate").val(),
							"Tag" : $("#boxplotTag").val()
						},
						success : function(responseData) {
							//alert(responseData);
							var data = JSON.parse(responseData);
							//$("#ajax").remove();
							if (!data) {
								alert("수신된 데이타가 없습니다.");
								return false;
							}
							str = "<img src=\""+data.image+"\">";
							$("#rimageboxplot").html(str);
						},
						error : function(e) {
							console.log(e);
						}

					});
		}
		
		function callPlot() {
			$.ajax({

						url : "/rscript/plot.do",
						type : "post",
						data : {
							"Date" : $("#plotDate").val(),
							"Tag1" : $("#plotTag1").val(),
							"Tag2" : $("#plotTag2").val()
						},
						success : function(responseData) {
							//alert(responseData);
							var data = JSON.parse(responseData);
							
							if (!data) {
								alert("수신된 데이타가 없습니다.");
								return false;
							}
							str = "<img src=\""+data.image+"\">";
							$("#rimageplot").html(str);
						},
						error : function(e) {
							console.log(e);
						}

					});
		}
		
		
		$("#btnGraph").click(callGraph);
		$("#btnCorrplot").click(callCorrplot);
		$("#btnBoxplot").click(callBoxplot);
		$("#btnPlot").click(callPlot);
</script>

	<!-- 
		Tab 새로고침시  Tab이 유지 되도록 하는 코드
	 -->

	<script type="text/javascript">
		$(document).ready(function() {
			if (location.hash) {
				$("a[href='" + location.hash + "']").tab("show");
			}
			$(document.body).on("click", "a[data-toggle]", function(event) {
				location.hash = this.getAttribute("href");
			});
		});
		$(window).on(
				"popstate",
				function() {
					var anchor = location.hash
							|| $("a[data-toggle='tab']").first().attr("href");
					$("a[href='" + anchor + "']").tab("show");
				});
		
	</script>





	<!-- Bootstrap Core JavaScript -->
	<script src="/js/startmin/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/js/startmin/js/metisMenu.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="/js/startmin/js/startmin.js"></script>


</body>
</html>
