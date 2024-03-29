<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- FLOT CHARTS -->
<script src="admin/plugins/flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="admin/plugins/flot/plugins/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="admin/plugins/flot/plugins/jquery.flot.pie.js"></script>
<style>
</style>
</head>
<body>
  <!-- Content Wrapper. Contains page content body 부분-->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">대시보드</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">대시보드</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="row">
	    <div class="col-xl-3 col-md-6 mb-4">
	        <div class="card border-left-primary shadow h-100 py-2">
	            <div class="card-body">
	                <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
	                               가입자수</div>
	                        <div class="h5 mb-0 font-weight-bold text-gray-800">${todayRegister}</div>
	                    </div>
	                    <div class="col-auto">
	                        <i class="fas fa-users fa-2x text-gray-300"></i>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		<div class="col-xl-3 col-md-6 mb-4">
		    <div class="card border-left-success shadow h-100 py-2">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
		                           일정 게시글 작성</div>
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">${todaySchedule}</div>
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-plane fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">동행 게시글 작성
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${todayWrite}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-hands-helping fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                   신고(일일)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${todayReport }</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<div class="row">
		<div class="col-xl-6 col-lg-7">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">월간 이용</h6>
				</div>
				<div class="card-body">
					<div class="chart-area">
						<canvas id="monthMember"></canvas>
					</div>
				</div>
				<div class="card-footer">
					<div class="h5 mb-0 font-weight-bold text-gray-800 d-flex">
					    <span class="mr-auto">전체 회원 : ${totalMembers}</span>
					    <span class="ml-auto">전체 게시글 : ${totalPosts}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6 col-lg-7">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">여행지별 점수</h6>
				</div>
				<div class="card-body">
					<div class="chart-area">
						<canvas id="doeChart"></canvas>
					</div>
				</div>
				<div class="card-footer">
					<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">전체 리뷰 건수 : 987</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function () {
    const urlMonth = "/monthData";

    $.ajax({
        url: urlMonth,
        method: "GET",
        success: function (data) {
            console.log(data);

            const monthData = data.monthMember.map(function (item) {
                console.log(item.month);
                return item.month + "월";
            });

            const counts = data.monthMember.map(function (item) {
                console.log(item.signup_count);
                return item.signup_count;
            });

            const write_count = data.monthUs.map(function (item) {
                console.log(item.write_count);
                return item.write_count;
            });

            // 추가: 전체 회원 가입 수 및 전체 게시글 수
            const totalMembers = data.totalMembers;  // 전체 회원 수
            const totalPosts = data.totalPosts;  // 전체 게시글 수

         // 12월 데이터가 없는 경우 0으로 초기화
            const lastMonth = 12;  // 최대 월
            if (!monthData.includes(lastMonth + "월")) {
                monthData.push(lastMonth + "월");
                counts.push(0);
                write_count.push(0);
            }
            
            // 차트 데이터
            var stackedChartData = {
                labels: monthData,
                datasets: [
                    {
                        label: "월별 가입자 현황",
                        backgroundColor: "rgba(60,141,188,0.9)",
                        borderColor: "rgba(60,141,188,0.8)",
                        pointRadius: false,
                        pointColor: "#3b8bba",
                        pointStrokeColor: "rgba(60,141,188,1)",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(60,141,188,1)",
                        data: counts,
                        borderWidth: 10,
                    },
                    {
                        label: "월별 작성된 게시글",
                        backgroundColor: "rgba(92,184,92,0.9)",
                        borderColor: "rgba(92,184,92,0.8)",
                        pointRadius: false,
                        pointColor: "#5cb85c",
                        pointStrokeColor: "rgba(92,184,92,1)",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(92,184,92,1)",
                        data: write_count,
                        borderWidth: 10,
                    },
                ],
            };

            // 차트를 그리기 전에 텍스트로 전체 회원 가입 수 및 전체 게시글 수를 표시
            $("#totalMembersText").text("전체 회원 가입 수: " + totalMembers + "명");
            $("#totalPostsText").text("전체 게시글 수: " + totalPosts + "건");
            console.log("종합 인원 ->" + totalMembers);

            // 차트 그리기
            var barChartData = $.extend(true, {}, stackedChartData);
            var stackedBarChartCanvas = $("#monthMember")
                .get(0)
                .getContext("2d");
            var stackedBarChartData = $.extend(true, {}, barChartData);
            var stackedBarChartOptions = {
                responsive: true,
                maintainAspectRadio: false,
                scales: {
                    xAxes: [
                        {
                            type: 'time',
                            time: {
                                unit: 'month',
                                displayFormats: {
                                    month: 'MM'
                                }
                            },
                            distribution: 'series',
                            ticks: {
                                source: 'labels',
                            },
                        },
                    ],
                    yAxes: [
                        {
                            stacked: true,
                            position: 'left',
                            id: 'y-axis-0',
                        },
                    ],
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        title: function(tooltipItem, data) {
                            return '월: ' + tooltipItem[0].xLabel;
                        },
                        label: function(tooltipItem, data) {
                            var label = data.datasets[tooltipItem.datasetIndex].label || '';
                            var yLabel = tooltipItem.yLabel;
                            return label + ': ' + yLabel;
                        }
                    }
                },
            };

            new Chart(stackedBarChartCanvas, {
                type: "line",
                data: stackedBarChartData,
                options: stackedBarChartOptions,
            });
        },
        error: function (error) {
            console.error("Error", error);
        },
    });
});


$(function () {
    	    const urlDoeRank = "/doeRank";

    	    $.ajax({
    	        url: '/doeRank',
    	        method: "GET",
    	        success: function (data) {
    	        	// 데이터 가공
    	        	var labels = data.doeRank.map(function (item) {
    	        	    return item.doe_name;
    	        	});

    	        	var scores = data.doeRank.map(function (item) {
    	        	    return item.average;
    	        	});

    	        	var ranks = data.doeRank.map(function (item) {
    	        	    return item.score_rank;
    	        	});

    	        	var doeData = {
    	        	    labels: labels,
    	        	    scores: scores,
    	        	    ranks: ranks, // 추가: 각 항목의 순위 배열
    	        	};
    	            console.log(doeData);

    	            // 차트 그리기
    	            var ctx = document.getElementById('doeChart').getContext('2d');
    	            var doeChart = new Chart(ctx, {
    	                type: 'bar',  // 여기를 'bar'에서 'line'으로 변경
    	                data: {
    	                    labels: doeData.labels,
    	                    datasets: [{
    	                        label: '평균 점수',
    	                        data: doeData.scores,
    	                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
    	                        borderColor: 'rgba(75, 192, 192, 1)',
    	                        borderWidth: 1,
    	                    }]
    	                },
    	                options: {
    	                    scales: {
    	                        y: {
    	                            beginAtZero: true
    	                        }
    	                    }
    	                }
    	            });
    	        },
    	        error: function (error) {
    	            console.error("Error", error);
    	        },
    	    });
    	});
  /*
   * Custom Label formatter
   * ----------------------
   */
  function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
      + label
      + '<br>'
      + Math.round(series.percent) + '%</div>'
  }
</script>
</body>
</html>