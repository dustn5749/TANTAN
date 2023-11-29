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
#pop-board{
border:1px solid black;
}
#pop-us{
border:1px solid black;
}
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
		                    <i class="fas fa-edit fa-2x text-gray-300"></i>
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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <div class="col-12">
    	<div class="card card-primary card-outline card-tabs">
    		<div class="card-header p-0 pt-1 border-bottom-0">
    			<div class="card-body table-responsive p-0">
   					<div class="card-tools">
   						<div class="input-group input-group-sm" style="width:150px; float:right;"></div>
   					</div>
    			</div>
    		</div>
    		
    		<div class="card-body table-responsive p-0">
    		<div class="tab-content p-3" id="nav-tabContent">
    		<!-- 회원 탭 카드 -->
    		
              <div class="tab-pane fade show active" id="home-tab" role="tabpanel" aria-labelledby="custom-home-tab">
		          <div class="row">
			          <div class="col-12">
			                <div class="card-body">
<!-- 			                <div id="donut-chart" style="height: 338px;" class="full-width-chart"></div> -->
								<canvas id="monthMember"></canvas>
			                </div>
			                <hr>
			              </div>
			        </div>
		          </div>
              </div>
              <!-- 회원 탭 카드 종료 -->
              
            	</div>
    		</div>
    	</div>
    </div>
<script>
  $(function () {
    /* END LINE CHART */

    /*
     * FULL WIDTH STATIC AREA CHART
     * -----------------
     */
     const urlMonth = "/monthData";

     $.ajax({
         url: urlMonth,
         method: "GET",
         success: function (data) {
             console.log(data);
             const monthData = data.monthMember.map(function (item) {
                 console.log(item.month);
                 return item.month;
             });
             const counts = data.monthMember.map(function (item) {
                 console.log(item.signup_count);
                 return item.signup_count;
             });
             const write_count = data.monthUs.map(function (item) {
//             	 console.log(item.write_count);
            	 return item.write_count;
             })
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
                     },
                     {
                         label: "월별 작성된 게시글",
                         backgroundColor: "rgba(92,184,92,0.9)",  // 초록색
                         borderColor: "rgba(92,184,92,0.8)",     // 초록색
                         pointRadius: false,
                         pointColor: "#5cb85c",                  // 초록색
                         pointStrokeColor: "rgba(92,184,92,1)",  // 초록색
                         pointHighlightFill: "#fff",
                         pointHighlightStroke: "rgba(92,184,92,1)",  // 초록색
                         data: write_count,
                     }
                 ],
             };
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
                             distribution: 'series', // 추가 부분
                             ticks: {
                                 source: 'labels', // 추가 부분
                             },
                         },
                     ],
                     yAxes: [
                         {
                             stacked: true,
                             position:'left',
                             id: 'y-axis-0', // y축 식별자
                         },
                         {
                        	 stacked:false,
                        	 position: 'right',
                        	 id: 'y-axis-1', // y축 식별자
                         }
                     ],
                 },
             };
             new Chart(stackedBarChartCanvas, {
                 type: "bar",
                 data: stackedBarChartData,
                 options: stackedBarChartOptions,
             });
         },
         error: function (error) {
             console.error("Error", error);
         },
     });

     
//      const url = "/usReportList";
// //      const labels = [];

//      $.ajax({
//        url: url,
//        method: "GET",
//        success: function (data) {
//     	   const dayData = data.usReportList.map(function (item) {
//     		    return item.reportcnt;
//     		  });
//     	   const labels = data.usReportList.map(function (item) {
//     		    return item.regdate; // 날짜 데이터를 가져와서 레이블로 사용
//     		  });
//          var stackedChartData = {
// 			labels: labels,
//            datasets: [
//              {
//                label: "일자별 신고받은 게시글 수",
//                backgroundColor: "rgba(60,141,188,0.9)",
//                borderColor: "rgba(60,141,188,0.8)",
//                pointRadius: false,
//                pointColor: "#3b8bba",
//                pointStrokeColor: "rgba(60,141,188,1)",
//                pointHighlightFill: "#fff",
//                pointHighlightStroke: "rgba(60,141,188,1)",
//                data: dayData,
//              },
//            ],
//          };

//          var barChartData = $.extend(true, {}, stackedChartData);
//          var stackedBarChartCanvas = $("#reportChart")
//            .get(0)
//            .getContext("2d");
//          var stackedBarChartData = $.extend(true, {}, barChartData);
//          var stackedBarChartOptions = {
//            responsive: true,
//            maintainAspectRatio: false,
//            scales: {
//         	   xAxes: [
// 	        		      {
// 	        		        stacked: true,
// 	        		        type: 'time', // X축 스케일을 시간형식으로 설정
// 	        		        time: {
// 	        		          unit: 'day', // 날짜 간격을 일(day)로 설정
// 	        		          displayFormats: {
// 	        		            day: 'YYYY-MM-DD' // 날짜 형식을 지정
// 	        		          }
// 	        		        }
// 	        		      }
//        		    		],
//              yAxes: [
//                {
//                  stacked: true,
//                },
//              ],
//            },
//          };
//          new Chart(stackedBarChartCanvas, {
//            type: "bar",
//            data: stackedBarChartData,
//            options: stackedBarChartOptions,
//          });
//        },
//        error: function (error) {
//          // Handle the error here
//          console.error("Error:", error);
//        },
//      });

    /* END AREA CHART */

     /*
     * DONUT CHART
     * -----------
     */

    var donutData = [
      {
        label: 'Series2',
        data : 30,
        color: '#3c8dbc'
      },
      {
        label: 'Series3',
        data : 20,
        color: '#0073b7'
      },
      {
        label: 'Series4',
        data : 50,
        color: '#00c0ef'
      }
    ]
    $.plot('#donut-chart', donutData, {
      series: {
        pie: {
          show       : true,
          radius     : 1,
          innerRadius: 0.5,
          label      : {
            show     : true,
            radius   : 2 / 3,
            formatter: labelFormatter,
            threshold: 0.1
          }

        }
      },
      legend: {
        show: false
      }
    })
    /*
     * END DONUT CHART
     */
    
    /*
     * BAR CHART
     * ---------
     */

     const usReportList = [
    	  { regdate: '2023-11-06', reportcnt: 5 },
    	  { regdate: '2023-11-07', reportcnt: 8 },
    	  // 다른 데이터...
    	];
     
  // X축 레이블을 추출합니다.
     const labels = usReportList.map(item => item.regdate);

     // Y축 데이터를 추출합니다.
     const dataPoints = usReportList.map(item => item.reportcnt);

     var bar_data = {
       data: [dataPoints], // Y축 데이터를 설정합니다.
       bars: { show: true }
     };

     // 그래프를 그립니다.
     $.plot('#bar-chart', [bar_data], {
       grid: {
         borderWidth: 1,
         borderColor: '#f3f3f3',
         tickColor: '#f3f3f3'
       },
       series: {
         bars: {
           show: true,
           barWidth: 0.5,
           align: 'center'
         },
       },
       colors: ['#3c8dbc'],
       xaxis: {
         ticks: labels // X축 레이블을 설정합니다.
       },
     });
    /* END BAR CHART */

  })

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