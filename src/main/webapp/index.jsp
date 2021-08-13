<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대전광역시 코로나19 현황</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap');
h1{
font-family: 'Jua', sans-serif;
}
h5{
font-family: 'Jua', sans-serif;
font-size : 30px;
}
th{
font-family: 'Jua', sans-serif;
font-size : 2em;
}
div{
font-family: 'Jua', sans-serif;
}
td{
font-family: 'Jua', sans-serif;
font-size : 2em;
}
</style>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<!-- font-awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>

<body>

<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1"></div>
      <div class="col-4 text-center"></div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="btn btn-sm btn-outline-secondary" href="#">로그인</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2"></div>
</div>

<main class="container">
  <div style="height: 250px; border-radius: 20px; background: rgb(58, 83, 133);  color: white;">
  		<div>
  		<br>
  		 &nbsp; &nbsp;<img alt="" src="images/egovframework/corona/df.PNG" style="width: 150px; height: auto;">
  		</div>
  		<br><br>
  		<img alt="" src="images/egovframework/corona/peo2.png" style="width: 200px; height: auto; float: right; position:absolute; top: 148px; left: 350px;">
      <h1 style="text-align: center; font-family: 'Do Hyeon', sans-serif; font-size : 3em">대전광역시 코로나19 현황</h1>
      <img alt="" src="images/egovframework/corona/peo.png" style="width: 200px; height: auto; float: right; position:absolute; top: 155px; right: 320px;">
  </div>
</main>
<br><br>
<div style="width:800px; margin: 0 auto; display: block; text-align: center;">
<h1>확진 추이</h1><br>
<!-- 차트 canvas -->
    <canvas id="myChart"></canvas>
</div>
<br><br>
</body>

<script>

// 전국현황 시작
	$.ajax({
	      url: 'PublicData.do',
	      type: 'get',
	      dataType: 'json',
	      success: function(data){
	    	  //console.log(data);
 	          //console.log(data.response.body.items.item[0]);
	          var myItem = data.response.body.items.item[0];

	          //날짜 자르기
			  var date = myItem.stateDt.toString();
			  //console.log(date);
			  var year = date.substring(2,4);
			  //console.log(year);
			  var month = date.substring(4,6);
			  //console.log(month);
			  var day = date.substring(6,8);
			  //console.log(day);

	              var output = '';
	              output += '<hr>'
					output += '<div class="row" style="text-align: center; vertical-align: middle">'
	      			output += '<h1>전국 현황</h1><br>';

					output += '<h6>' +year + '.' + month + '.' + day + '. ' +'00시 기준' + '</h6><br><br>';
					output += '<div class="col-sm-3"></div>'

					output += '<div class="col-sm-2">'
					output += '<div class="card border-warning mb-3" style="max-width: 18rem;">'
					output += '<div class="card-header" style="background: rgb(250, 243, 149);"><h3>확진환자<h3></div>'
					output += '<div class="card-body">'
					output += '<h5 class="card-title">'+ myItem.decideCnt+'명' +'</h5>'
					output += '</div>'
					output += '</div>'
					output += '</div>'

					output += '<div class="col-sm-2">'
					output += '<div class="card border-success mb-3" style="max-width: 18rem;">'
					output += '<div class="card-header" style="background: rgb(146, 236, 158);"><h3>격리해제자<h3></div>'
					output += '<div class="card-body">'
					output += '<h5 class="card-title">' + myItem.clearCnt +'명' + '</h5>'
					output += '</div>'
					output += '</div>'
					output += '</div>'

					output += '<div class="col-sm-2">'
					output += '<div class="card border-danger mb-3" style="max-width: 18rem;">'
					output += '<div class="card-header"style="background: rgb(253, 141, 141);"><h3>사망자<h3></div>'
					output += '<div class="card-body">'
					output += '<h5 class="card-title">' + myItem.deathCnt +'명'+'</h5>'
					output += '</div>'
					output += '</div>'
					output += '</div>'

					output += '<div class="col-sm-3"></div>'

					output += '</div><br>'

					document.body.innerHTML += output;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("Status: " + textStatus);
					alert("Error: " + errorThrown);
				}
			});
	// 전국현황 끝


	// 대전현황 시작
	$.ajax({
		url : 'RegionCorona.do',
		type : 'get',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			console.log(data.response.body.items.item);
			var total = data.response.body.items.item[12];
			var yesterday = data.response.body.items.item[31];

			  var date = total.stdDay;
			  //console.log(date);
			  var year = date.substring(2,4);
			  //console.log(year);
			  var month = date.substring(6,8);
			  //console.log(month);
			  var day = date.substring(10,12);
			  //console.log(day);
			  var time = date.substring(14,16);
			  //console.log(time);

	var output = '';
					output += '<hr>'
					output += '<div class="row" id="id_div">'
					output += '<div class="col-sm-3"></div>'
					output += '<div class="col-sm-6">'

					output += '<table class="table table-bordered" style="text-align: center;">'
					output += '<h1 style="text-align:center;">대전 현황</h1>'
					output += '<h6 style="text-align:center;">' +year + '.' + month + '.' + day + '. ' + time +'시 기준</h6><br>';

					output += '<thead>'

					output += '<tr>'
					output += '<th style="background: rgb(255, 167, 35);" scope="col" rowspan="2">구분</th>'
					output += '<th style="background: rgb(255, 167, 35);" scope="col" colspan="4">확진환자</th>'
					output += '</tr>'

					output += '<tr>'
					output += '<th style="background: rgb(255, 207, 135);" scope="col">총계</th>'
					output += '<th style="background: rgb(255, 207, 135);" scope="col">격리해제</th>'
					output += '<th style="background: rgb(255, 207, 135);" scope="col">격리중</th>'
					output += '<th style="background: rgb(255, 207, 135);" scope="col">사망</th>'
					output += '</tr>'

					output += '</thead>'

					output += '<tbody>'

					output += '<tr>'
					output += '<th scope="row">누계</th>'
					output += '<td>'+ total.defCnt +'명</td>'
					output += '<td>'+ total.isolClearCnt +'명</td>'
					output += '<td>'+ total.isolIngCnt +'명</td>'
					output += '<td>'+ total.deathCnt +'명</td>'
					output += '</tr>'

					output += '<tr>'
					output += '<th scope="row">전일대비 증감</th>'

					//총계
						if((parseInt(total.defCnt) - parseInt(yesterday.defCnt)) > 0){
							output +='<td><span style="color:Green"><i class="fa fa-arrow-up" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.defCnt) - parseInt(yesterday.defCnt)) +'명</td>'
						}else if((parseInt(total.defCnt) - parseInt(yesterday.defCnt)) == 0){
							output +='<td><span style="color:LightSlateGray"><i class="fa fa-minus" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.defCnt) - parseInt(yesterday.defCnt)) +'명</td>'
						}else{
							output +='<td><span style="color:FireBrick"><i class="fa fa-arrow-down" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.defCnt) - parseInt(yesterday.defCnt)) +'명</td>'
						}
					//output += '<td><span style="color:Green"><i class="fa fa-arrow-up" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.defCnt) - parseInt(yesterday.defCnt)) +'명</td>'
					//console.log(parseInt(total.defCnt) - parseInt(yesterday.defCnt) );

					//격리해제
					if((parseInt(total.isolClearCnt) - parseInt(yesterday.isolClearCnt)) > 0){
						output +='<td><span style="color:Green"><i class="fa fa-arrow-up" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolClearCnt) - parseInt(yesterday.isolClearCnt)) +'명</td>'
					}else if((parseInt(total.defCnt) - parseInt(yesterday.defCnt)) == 0){
						output +='<td><span style="color:LightSlateGray"><i class="fa fa-minus" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolClearCnt) - parseInt(yesterday.isolClearCnt)) +'명</td>'
					}else{
						output +='<td><span style="color:FireBrick"><i class="fa fa-arrow-down" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolClearCnt) - parseInt(yesterday.isolClearCnt)) +'명</td>'
					}

					//격리중
					if((parseInt(total.isolIngCnt) - parseInt(yesterday.isolIngCnt)) > 0){
						output +='<td><span style="color:Green"><i class="fa fa-arrow-up" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolIngCnt) - parseInt(yesterday.isolIngCnt)) +'명</td>'
					}else if((parseInt(total.defCnt) - parseInt(yesterday.defCnt)) == 0){
						output +='<td><span style="color:LightSlateGray"><i class="fa fa-minus" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolIngCnt) - parseInt(yesterday.isolIngCnt)) +'명</td>'
					}else{
						output +='<td><span style="color:FireBrick"><i class="fa fa-arrow-down" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.isolIngCnt) - parseInt(yesterday.isolIngCnt)) +'명</td>'
					}

					//사망
					if((parseInt(total.deathCnt) - parseInt(yesterday.deathCnt)) > 0){
						output +='<td><span style="color:Green"><i class="fa fa-arrow-up" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.deathCnt) - parseInt(yesterday.deathCnt)) +'명</td>'
					}else if((parseInt(total.deathCnt) - parseInt(yesterday.deathCnt)) == 0){
						output +='<td><span style="color:LightSlateGray"><i class="fa fa-minus" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.deathCnt) - parseInt(yesterday.deathCnt)) +'명</td>'
					}else{
						output +='<td><span style="color:FireBrick"><i class="fa fa-arrow-down" aria-hidden="true" ></i></span>&nbsp;'+ (parseInt(total.deathCnt) - parseInt(yesterday.deathCnt)) +'명</td>'
					}

					output += '</tr>'
					output += '</tbody>'
					output += '</table>'
					output += '</div>'

					output += '<div class="col-sm-3"></div>'
					output += '</div>'

					document.body.innerHTML += output;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("Status: " + textStatus);
					alert("Error: " + errorThrown);
				}
			});
	// 대전현황 끝


	// 차트 부분
	$.ajax({
	      url: 'PublicData.do',
	      type: 'get',
	      dataType: 'json',
	      success: function(data){
	    	  //console.log(data);

 	         var ctx = document.getElementById("myChart").getContext('2d');

			//일별 총 확진자 수
			var decideCnt1 = data.response.body.items.item[0].decideCnt;
			var decideCnt2 = data.response.body.items.item[1].decideCnt;
			var decideCnt3 = data.response.body.items.item[2].decideCnt;
			var decideCnt4 = data.response.body.items.item[3].decideCnt;
			var decideCnt5 = data.response.body.items.item[4].decideCnt;
			var decideCnt6 = data.response.body.items.item[5].decideCnt;
			var decideCnt7 = data.response.body.items.item[6].decideCnt;
			var decideCnt8 = data.response.body.items.item[7].decideCnt;
			var decideCnt9 = data.response.body.items.item[8].decideCnt;
			var decideCnt10 = data.response.body.items.item[9].decideCnt;
			var decideCnt11 = data.response.body.items.item[10].decideCnt;
			var decideCnt12 = data.response.body.items.item[11].decideCnt;
			var decideCnt13 = data.response.body.items.item[12].decideCnt;
			var decideCnt14 = data.response.body.items.item[13].decideCnt;
			var decideCnt15 = data.response.body.items.item[14].decideCnt;

			//일일 확진자 수
			var day1 = decideCnt1 - decideCnt2
			var day2 = decideCnt2 - decideCnt3
			var day3 = decideCnt3 - decideCnt4
			var day4 = decideCnt4 - decideCnt5
			var day5 = decideCnt5 - decideCnt6
			var day6 = decideCnt6 - decideCnt7
			var day7 = decideCnt7 - decideCnt8
			var day8 = decideCnt8 - decideCnt9
			var day9 = decideCnt9 - decideCnt10
			var day10 = decideCnt10 - decideCnt11
			var day11 = decideCnt11 - decideCnt12
			var day12 = decideCnt12 - decideCnt13
			var day13 = decideCnt13 - decideCnt14
			var day14 = decideCnt14 - decideCnt15


			//날짜 자르기 시작
			var date1 = data.response.body.items.item[0].stateDt
			var reDate1 = String(date1).substr(4,4);
			//console.log(reDate1);

			var date2 = data.response.body.items.item[1].stateDt
			var reDate2 = String(date2).substr(4,4);
			//console.log(reDate2);

			var date3 = data.response.body.items.item[2].stateDt
			var reDate3 = String(date3).substr(4,4);
			//console.log(reDate3);

			var date4 = data.response.body.items.item[3].stateDt
			var reDate4 = String(date4).substr(4,4);
			//console.log(reDate4);

			var date5 = data.response.body.items.item[4].stateDt
			var reDate5 = String(date5).substr(4,4);
			//console.log(reDate5);

			var date6 = data.response.body.items.item[5].stateDt
			var reDate6 = String(date6).substr(4,4);
			//console.log(reDate6);

			var date7 = data.response.body.items.item[6].stateDt
			var reDate7 = String(date7).substr(4,4);
			//console.log(reDate7);

			var date8 = data.response.body.items.item[7].stateDt
			var reDate8 = String(date8).substr(4,4);
			//console.log(reDate8);

			var date9 = data.response.body.items.item[8].stateDt
			var reDate9 = String(date9).substr(4,4);
			//console.log(reDate9);

			var date10 = data.response.body.items.item[9].stateDt
			var reDate10 = String(date10).substr(4,4);
			//console.log(reDate10);

			var date11 = data.response.body.items.item[10].stateDt
			var reDate11 = String(date11).substr(4,4);
			//console.log(reDate11);

			var date12 = data.response.body.items.item[11].stateDt
			var reDate12 = String(date12).substr(4,4);
			//console.log(reDate12);

			var date13 = data.response.body.items.item[12].stateDt
			var reDate13 = String(date13).substr(4,4);
			//console.log(reDate13);

			var date14 = data.response.body.items.item[13].stateDt
			var reDate14 = String(date14).substr(4,4);
			//console.log(reDate14);
			//날짜 자르기 끝

			//차트 시작
			var data = [ day14, day13, day12, day11, day10, day9, day8, day7, day6, day5, day4, day3, day2, day1 ];
			var colors = [];

			$.each(data, function(index, value) {
								if (value > 2200) {
									colors[index] = "rgba(236, 7, 7, 0.9)";
								}else if(value > 2000) {
									colors[index] = "rgba(226, 45, 45, 1)";
								}else if(value > 1800) {
									colors[index] = "rgba(223, 76, 76, 0.8)";
								}else if(value > 1600) {
									colors[index] = "rgba(236, 105, 105, 0.7)";
								}else if(value > 1400) {
									colors[index] = "rgba(255, 156, 156, 0.7)";
								}else{
									colors[index] = "rgba(255, 191, 191, 0.7)";
								}
							});

					var myChart = new Chart(
							ctx,
							{
								type : 'bar',
								data : {
									labels : [ reDate14, reDate13, reDate12,
											reDate11, reDate10, reDate9,
											reDate8, reDate7, reDate6, reDate5,
											reDate4, reDate3, reDate2, reDate1 ],
									datasets : [ {
										label : '확진 추이',
										data : data,
										backgroundColor : colors,

									} ]
								},
								options : {
									tooltips : {
										enabled : false
									},
									hover : {
										animationDuration : 0
									},
									animation : {
										duration : 1,
										onComplete : function() {
											var chartInstance = this.chart, ctx = chartInstance.ctx;
											ctx.font = Chart.helpers
													.fontString(
															Chart.defaults.global.defaultFontSize,
															Chart.defaults.global.defaultFontStyle,
															Chart.defaults.global.defaultFontFamily);
											ctx.fillStyle = 'black';
											ctx.textAlign = 'center';
											ctx.textBaseline = 'bottom';

											this.data.datasets
													.forEach(function(dataset,
															i) {
														var meta = chartInstance.controller
																.getDatasetMeta(i);
														meta.data
																.forEach(function(
																		bar,
																		index) {
																	var data = dataset.data[index];
																	ctx
																			.fillText(
																					data,
																					bar._model.x,
																					bar._model.y - 5);
																});
													});
										}
									},
									scales : {
										yAxes : [ {
											ticks : {
												beginAtZero : true,
												display : false
											}
										} ]
									}
								}
							});

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("Status: " + textStatus);
					alert("Error: " + errorThrown);
				}
			});

	// 차트 끝
</script>

</html>