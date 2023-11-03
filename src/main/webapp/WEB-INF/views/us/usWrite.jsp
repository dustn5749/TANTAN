<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <title>Zay Shop - Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <!-- Google Fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap">
    <!-- Leaflet Map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
    <style>
     .nav-wrap {
	position:relative;
	margin: 50px auto 0;
	width: 1000px;
	height: 50px;
}
.nav-wrap:after {
	content: "";
	position: absolute;
	top: 50%;
	left: 0 ;
	margin-top: -15px;
	width: 6px;
	height: 30px;
	background-color: #0099FF;
}
.nav-wrap h2 {
	position: absolute;
	top: 0;
	left: 0;
	width : 100px;
	height: 30px;
	line-height: 50px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}
.nav-wrap .nav-ul {
	margin: 0 0 0 100px;
	padding: 0;
	width: 900px;
	list-style: none;
}
.nav-li {
	float: left;
	width: 100px;
	height: 50px;
}
.nav-li:hover a {
	color: #0099FF;
}
.nav-li a {
	display: block;
	line-height: 50px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 400;
	color: #999;
}

.btn-secondary {
    background-color: #ccc;
    color: #fff;
    border: none;
}
.btn-secondary:hover {
   background-color: #999;
}
.btn-primary {   
    background-color: #0099FF;
    color: #fff;
    border: none;
        }
        .btn-primary:hover {
            background-color: #0077cc;
        }

        .image-container {
            border: 2px dashed #0099FF;
        }
    </style>
</head>
<body>
    <div class="nav-wrap">
        <h2>한국</h2>
        <ul class="nav-ul">
            <li class="nav-li">
                <a class="nav-btn">
                    서울
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    강원도
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    제주
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    부산
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    경기도
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    충청도
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    경상도
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    전라도
                </a>
            </li>
            <li class="nav-li">
                <a href="javascript:void(0);">
                    울릉도
                </a>
            </li>
        </ul>
    </div>
 <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="container py-5">
                <form method="post" role="form">
                    <div class="form-group">
                        <label for="recruitment">모집인원 설정:</label>
                        <input type="range" min="1" max="50" value="1" class="form-control-range" id="recruitment" name="recruitment">
                        <p>모집인원: <span id="recruitmentValue">1</span></p>
                    </div>
                    <div class="cont_top">
                        <div class="schedule">
                            <em>날짜 선택</em>
                            <form class="schedule-form">
                                <input type="date" class="form-control mt-1" id="date_start" name="date_start" placeholder="시작 날짜">
                                <span> ~ </span>
                                <input type="date" class="form-control mt-1" id="date_end" name="date_end" placeholder="종료 날짜">
                            </form>
                        </div>
                    </div>
 <div class="form-group">
    <div class="d-flex align-items-center">
        <div class="image-container mr-3" id="imagePreview">
         이미지 추가   <span id="imageText">클릭하여 이미지를 업로드하세요</span>
        </div>
        <label class="btn btn-primary btn-file">
            업로드
            <input type="file" id="file" style="display: none;">
        </label>
    </div>
</div>
                    <div class="form-group">
                        <label for="title">제목:</label>
                        <input type="text" id="title" name="title" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="content">내용:</label>
                        <textarea id="content" name="content" class="form-control" rows="4"></textarea>
                    </div>

                    <div class="text-center">
                        <input type="button" value="취소" class="btn btn-secondary" onclick="window.location.href='/board/list'">
                        <input type="submit" value="작성완료" class="btn btn-primary" onclick="showConfirmation()">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <script>
        var slider = document.getElementById("recruitment");
        var output = document.getElementById("recruitmentValue");
        output.innerHTML = slider.value;
        slider.oninput = function() {
            output.innerHTML = this.value;
        };
        // Image preview functionality
        document.getElementById('file').onchange = function(evt) {
            var tgt = evt.target || window.event.srcElement,
                files = tgt.files;
            if (FileReader && files && files.length) {
                var fr = new FileReader();
                fr.onload = function() {
                    var img = document.createElement("img");
                    img.src = fr.result;
                    var preview = document.getElementById('imagePreview');
                    preview.innerHTML = '';
                    preview.appendChild(img);
                };
                fr.readAsDataURL(files[0]);
                document.getElementById('imageText').style.display = "none";
            }
        };
        function showConfirmation() {
            alert('작성이 완료되었습니다.');
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>