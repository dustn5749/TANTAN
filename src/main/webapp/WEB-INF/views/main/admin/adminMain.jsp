<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="col-12">
    	<div class="card card-primary card-outline card-tabs">
    		<div class="card-header p-0 pt-1 border-bottom-0">
    			<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
    				<li class="nav-item">
    					<a class="nav-link" id="custom-home-tab" data-toggle="pill" href="#home-tab" role="tab" aria-controls="home-tab" > 회원</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link" id="custom-board-tab" data-toggle="pill" href="#board-tab" role="tab" aria-controls="board-tab"> 게시글</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link" id="custom-like-tab" data-toggle="pill" href="#like-tab" role="tab" aria-controls="like-tab"> 여행지</a>
    				</li>
    			</ul>
    			<div class="card-body table-responsive p-0">
   					<div class="card-tools">
   						<div class="input-group input-group-sm" style="width:150px; float:right;">
						<input type="text" name="table_search" class="form-control float-right" placeholder="Search">
							<div class="input-group-append">
								<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
								</button>
							</div>
   						</div>
   					</div>
    			</div>
    		</div>
    		<div class="card-body table-responsive p-0">
    		<div class="tab-content p-3" id="nav-tabContent">
    		<!-- 회원 탭 카드 -->
              <div class="tab-pane fade show active" id="home-tab" role="tabpanel" aria-labelledby="custom-home-tab">
	              <hr>
		          <div class="row">
			          <div class="col-12">
			            <!-- interactive chart -->
			              <div class="card-header">
			                <h3 class="card-title">
			                  <i class="far fa-chart-bar"></i>
			                  Interactive Area Chart
			                </h3>
			                <div class="card-tools">
			                  Real time
			                  <div class="btn-group" id="realtime" data-toggle="btn-toggle">
			                    <button type="button" class="btn btn-default btn-sm active" data-toggle="on">On</button>
			                    <button type="button" class="btn btn-default btn-sm" data-toggle="off">Off</button>
			                  </div>
			                </div>
			              </div>
			              <div class="card-body">
			                <div id="interactive" style="height: 300px;"></div>
			              </div>
			              <!-- /.card-body-->
			            <!-- /.card -->
			        </div>
		          <!-- /.col -->
		          </div>
              </div>
              <!-- 회원 탭 카드 종료 -->
              
              <!-- 게시글 탭 카드 -->
	              <div class="tab-pane fade" id="board-tab" role="tabpanel" aria-labelledby="custom-board-tab">
		              <div class="row">
			              <div class="col-md-6">
			                  <div >
			                      <div class="card-header" id="pop-board">
			                          <h3 class="card-title">
			                          <i class="far fa-chart-bar"></i>
			                          인기 게시글
			                          </h3>
				                      <div class="card-body">
				                      <hr>
				                      <div id="area-chart" style="height: 338px;" class="full-width-chart"></div>
				                      </div>
				                  </div>
			              <!-- /.card-body-->
			                  </div>
			              </div>
			              <div class="col-md-6">
			                  <div>
			                      <div class="card-header" id="pop-us">
		   	                          <h3 class="card-title">
			                          <i class="far fa-chart-bar"></i>
			                          인기 동행글
			                          </h3>
				                      <div class="card-body">
				                      <hr>
				                      <div id="donut-chart" style="height: 338px;" class="full-width-chart"></div>
				                      </div>
			                      </div>
			                  </div>
			              </div>
		              </div>
	              </div>
               <!-- 게시글 탭 카드 종료 -->
               
	              	<div class="tab-pane fade" id="like-tab" role="tabpanel" aria-labelledby="custom-like-tab">
		            <!-- Bar chart -->
			            <div>
			              <div class="card-header">
			                <h3 class="card-title">
			                  <i class="far fa-chart-bar"></i>
			                  인기 여행지
			                </h3>
			              </div>
			              <div class="card-body">
<!-- 			              	<div id="bar-chart" style="height: 300px;"></div> -->
							<canvas id="stackedBarChart"></canvas>
			              </div>
			              <!-- /.card-body-->
            			</div>
    				</div>
            	</div>
    		</div>
    	</div>
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<script>
  $(function () {
    /*
     * Flot Interactive Chart
     * -----------------------
     */
    // We use an inline data source in the example, usually data would
    // be fetched from a server
    var data        = [],
        totalPoints = 100

    function getRandomData() {

      if (data.length > 0) {
        data = data.slice(1)
      }

      // Do a random walk
      while (data.length < totalPoints) {

        var prev = data.length > 0 ? data[data.length - 1] : 50,
            y    = prev + Math.random() * 10 - 5

        if (y < 0) {
          y = 0
        } else if (y > 100) {
          y = 100
        }

        data.push(y)
      }

      // Zip the generated y values with the x values
      var res = []
      for (var i = 0; i < data.length; ++i) {
        res.push([i, data[i]])
      }

      return res
    }

    var interactive_plot = $.plot('#interactive', [
        {
          data: getRandomData(),
        }
      ],
      {
        grid: {
          borderColor: '#f3f3f3',
          borderWidth: 1,
          tickColor: '#f3f3f3'
        },
        series: {
          color: '#3c8dbc',
          lines: {
            lineWidth: 2,
            show: true,
            fill: true,
          },
        },
        yaxis: {
          min: 0,
          max: 100,
          show: true
        },
        xaxis: {
          show: true
        }
      }
    )

    var updateInterval = 500 //Fetch data ever x milliseconds
    var realtime       = 'on' //If == to on then fetch data every x seconds. else stop fetching
    function update() {

      interactive_plot.setData([getRandomData()])

      // Since the axes don't change, we don't need to call plot.setupGrid()
      interactive_plot.draw()
      if (realtime === 'on') {
        setTimeout(update, updateInterval)
      }
    }

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
      update()
    }
    //REALTIME TOGGLE
    $('#realtime .btn').click(function () {
      if ($(this).data('toggle') === 'on') {
        realtime = 'on'
      }
      else {
        realtime = 'off'
      }
      update()
    })
    /*
     * END INTERACTIVE CHART
     */


    /*
     * LINE CHART
     * ----------
     */
    //LINE randomly generated data

//     var sin = [],
//         cos = []
//     for (var i = 0; i < 14; i += 0.5) {
//       sin.push([i, Math.sin(i)])
//       cos.push([i, Math.cos(i)])
//     }
//     var line_data1 = {
//       data : sin,
//       color: '#3c8dbc'
//     }
//     var line_data2 = {
//       data : cos,
//       color: '#00c0ef'
//     }
//     $.plot('#line-chart', [line_data1, line_data2], {
//       grid  : {
//         hoverable  : true,
//         borderColor: '#f3f3f3',
//         borderWidth: 1,
//         tickColor  : '#f3f3f3'
//       },
//       series: {
//         shadowSize: 0,
//         lines     : {
//           show: true
//         },
//         points    : {
//           show: true
//         }
//       },
//       lines : {
//         fill : false,
//         color: ['#3c8dbc', '#f56954']
//       },
//       yaxis : {
//         show: true
//       },
//       xaxis : {
//         show: true
//       }
//     })
    //Initialize tooltip on hover
//     $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
//       position: 'absolute',
//       display : 'none',
//       opacity : 0.8
//     }).appendTo('body')
//     $('#line-chart').bind('plothover', function (event, pos, item) {

//       if (item) {
//         var x = item.datapoint[0].toFixed(2),
//             y = item.datapoint[1].toFixed(2)

//         $('#line-chart-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
//           .css({
//             top : item.pageY + 5,
//             left: item.pageX + 5
//           })
//           .fadeIn(200)
//       } else {
//         $('#line-chart-tooltip').hide()
//       }

//     })
    /* END LINE CHART */

    /*
     * FULL WIDTH STATIC AREA CHART
     * -----------------
     */
     const url = "/usReportList";
//      const labels = [];

     $.ajax({
       url: url,
       method: "GET",
       success: function (data) {
    	   const dayData = data.usReportList.map(function (item) {
    		    return item.reportcnt;
    		  });
    	   const labels = data.usReportList.map(function (item) {
    		    return item.regdate; // 날짜 데이터를 가져와서 레이블로 사용
    		  });
         var stackedChartData = {
			labels: labels,
           datasets: [
             {
               label: "일자별 신고받은 게시글 수",
               backgroundColor: "rgba(60,141,188,0.9)",
               borderColor: "rgba(60,141,188,0.8)",
               pointRadius: false,
               pointColor: "#3b8bba",
               pointStrokeColor: "rgba(60,141,188,1)",
               pointHighlightFill: "#fff",
               pointHighlightStroke: "rgba(60,141,188,1)",
               data: dayData,
             },
           ],
         };

         var barChartData = $.extend(true, {}, stackedChartData);
         var stackedBarChartCanvas = $("#stackedBarChart")
           .get(0)
           .getContext("2d");
         var stackedBarChartData = $.extend(true, {}, barChartData);
         var stackedBarChartOptions = {
           responsive: true,
           maintainAspectRatio: false,
           scales: {
        	   xAxes: [
        		      {
        		        stacked: true,
        		        type: 'time', // X축 스케일을 시간형식으로 설정
        		        time: {
        		          unit: 'day', // 날짜 간격을 일(day)로 설정
        		          displayFormats: {
        		            day: 'YYYY-MM-DD' // 날짜 형식을 지정
        		          }
        		        }
        		      }
        		    ],
             yAxes: [
               {
                 stacked: true,
               },
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
         // Handle the error here
         console.error("Error:", error);
       },
     });

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