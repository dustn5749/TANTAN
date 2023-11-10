<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <title>동행작성</title>
    <meta charset="utf-8">

    <style>


 .container-fluid {
            margin: 30px auto 0; /* 페이지 위쪽 여백 30px */
            max-width: 1200px; /* 최대 너비 1200px */
        }

        .recruitment-section {
            display: flex;
            justify-content: space-between; /* 모집인원 설정들 간 간격 유지 */
            margin-bottom: 20px; /* 하단 여백 20px */
        }

        .recruitment-section label,
        .recruitment-section input,
        .recruitment-section p {
            margin-bottom: 10px; /* 각 요소별 하단 여백 10px */
        }

        .form-group {
            margin-bottom: 20px; /* 폼 그룹 간 여백 20px */
        }

        #root {
            margin-top: 30px; /* 상단 여백 30px */
            padding: 20px; /* 안쪽 여백 20px */
            border: 1px solid #ccc; /* 테두리 설정 */
            border-radius: 8px; /* 테두리 둥글게 처리 */
        }

        .contents {
            display: flex;
            justify-content: space-between; /* 콘텐츠 간 여백 유지 */
        }

        .contents .upload-box {
            flex: 1; /* 내용 콘텐츠를 공간을 가득 채우도록 설정 */
            margin-right: 20px; /* 우측 여백 20px */
        }

        .contents .upload-box .drag-file {
            height: 300px; /* 파일 드래그영역 높이 300px */
        }

        .text-center {
            margin-top: 30px; /* 상단 여백 30px */
        }
.contents {
  display: flex;
  flex-direction: row;
  margin-top: 30px;
}
.contents .upload-box {
  width: 100%;
  margin-right: 30px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.contents .upload-box .drag-file {
  position: relative;
  width: 100%;
  height: 360px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border: 3px dashed #dbdbdb;
}
.contents .upload-box .drag-file.highlight {
  border: 3px dashed red;
}
.contents .upload-box .drag-file .image {
  width: 40px;
}
.contents .upload-box .drag-file .message {
  margin-bottom: 0;
}
.contents .upload-box .drag-file .preview {
  display: none;
  position: absolute;
  left: 0;
  height: 0;
  width: 100%;
  height: 100%;
}
.contents .upload-box .file-label {
  margin-top: 30px;
  background-color: #0d6efd;
  color: #fff;
  text-align: center;
  padding: 10px 0;
  width: 65%;
  border-radius: 6px;
  cursor: pointer;
}
.contents .upload-box .file {
  display: none;
}

@media (max-width: 700px) {
  .contents {
    display: flex;
    flex-direction: column;
    margin-top: 30px;
  }
  .contents .upload-box {
    width: 100%;
    box-sizing: border-box;
    margin-right: 0;
  }
  .contents .upload-box .drag-file {
    height: 150px;
  }
  .contents .files {
    width: 100%;
    box-sizing: border-box;
    margin-right: 0;
    overflow: initial;
  }
}
#root {
    margin-left: 350px; /* 왼쪽 여백 설정 */
    margin-right: 350px; /* 오른쪽 여백 설정 */
}
 
 .dropdown-menu {
            right: 0; /* 오른쪽 정렬 */
            left: auto; /* 기본 왼쪽 위치 제거 */
            display: none;
            position: absolute;
            background-color: white;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .nav-li a {
            display: block;
            text-decoration: none;
            color: black;
            padding: 10px;
        }

        .nav-li a:hover {
            background-color: #f9f9f9;
        }
        
     

 
    </style>
    
</head>

  
<body>
    <div class="container mt-5">
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                한국
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <ul class="nav-ul">
                    <li class="nav-li"><a href="javascript:void(0);">서울</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">부산</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">대구</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">인천</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">광주</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">대전</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">울산</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">세종</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">경기</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">강원</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">충북</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">충남</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">전북</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">전남</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">경북</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">경남</a></li>
                    <li class="nav-li"><a href="javascript:void(0);">제주</a></li>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <form role="form" name="writeForm">
                <div class="row mb-4">
                    <div class="col-md-4 text-end">
                        <label for="recruitment">모집인원:</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="recruitmentText" name="recruitmentText" readonly>
                    </div>
                    <div class="col-md-4">
                        <input type="range" min="1" max="10" class="form-range" id="recruitmentSlider" name="recruitmentSlider">
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-3 text-end">
                        <label for="date_start">시작 날짜:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control" id="date_start" name="date_start">
                    </div>
                    <div class="col-md-3 text-end">
                        <label for="date_end">종료 날짜:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control" id="date_end" name="date_end">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const recruitmentSlider = document.getElementById('recruitmentSlider');
    const recruitmentText = document.getElementById('recruitmentText');

    recruitmentSlider.addEventListener('input', () => {
        recruitmentText.value = recruitmentSlider.value + '명';
    });
</script>

                
                <div id="root" class="my-4">
                    <h2 class="title">파일 업로드</h2>
                    <hr>
                    <div class="contents row">
                        <div class="col-md-6">
                            <div class="upload-box">
                                <div id="drop-file" class="drag-file text-center">
                                    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
                                    <p class="message">Drag files to upload</p>
                                    <img src="" alt="미리보기 이미지" class="preview">
                                </div>
                                <label class="file-label mt-3" for="chooseFile">사진 선택하기</label>
                                <input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/*">
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="title">제목:</label>
                                <input type="text" id="title" name="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="content">내용:</label>
                                <textarea id="content" name="content" class="form-control" rows="11"></textarea>
                            </div>
                            <div class="text-center my-4">
                                <input type="button" value="취소" class="btn btn-secondary mx-2" onclick="window.location.href='/us/list'">
                                <input type="button" value="작성완료" class="btn btn-primary mx-2" onclick="submitForm()">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


   
    <script>
    
 // 파일 업로드 및 미리보기 기능을 담당하는 JavaScript
    const dropFile = {
        handleFiles: function (files) {
            const dropFile = document.getElementById('drop-file');
            const preview = dropFile.querySelector('.preview');

            if (files.length === 0) {
                return;
            }

            const file = files[0];

            // 이미지 파일인지 확인
            if (file.type.startsWith('image/')) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    preview.src = e.target.result;
                };

                reader.readAsDataURL(file);
            } else {
                // 선택한 파일이 이미지가 아닌 경우
                alert('이미지 파일을 선택하세요.');
            }
        }
    };

    
    function DropFile(dropAreaId, fileListId) {
    	  let dropArea = document.getElementById(dropAreaId);
    	  let fileList = document.getElementById(fileListId);

    	  function preventDefaults(e) {
    	    e.preventDefault();
    	    e.stopPropagation();
    	  }

    	  function highlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.add("highlight");
    	  }

    	  function unhighlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.remove("highlight");
    	  }

    	  function handleDrop(e) {
    	    unhighlight(e);
    	    let dt = e.dataTransfer;
    	    let files = dt.files;

    	    handleFiles(files);

    	    const fileList = document.getElementById(fileListId);
    	    if (fileList) {
    	      fileList.scrollTo({ top: fileList.scrollHeight });
    	    }
    	  }

    	  function handleFiles(files) {
    	    files = [...files];
    	    // files.forEach(uploadFile);
    	    files.forEach(previewFile);
    	  }

    	  function previewFile(file) {
    	    console.log(file);
    	    renderFile(file);
    	  }

    	  function renderFile(file) {
    	    let reader = new FileReader();
    	    reader.readAsDataURL(file);
    	    reader.onloadend = function () {
    	      let img = dropArea.getElementsByClassName("preview")[0];
    	      img.src = reader.result;
    	      img.style.display = "block";
    	    };
    	  }

/*     	  dropArea.addEventListener("dragenter", highlight, false);
    	  dropArea.addEventListener("dragover", highlight, false);
    	  dropArea.addEventListener("dragleave", unhighlight, false);
    	  dropArea.addEventListener("drop", handleDrop, false); */

    	  return {
    	    handleFiles
    	  };
    	}

    	const dropFile = new DropFile("drop-file", "files");
    	
    // range input 값 변경 시, text input 업데이트
    document.getElementById("recruitment").addEventListener("input", function() {
        var rangeValue = document.getElementById("recruitment").value;
        document.getElementById("recruitmentValue").innerText = rangeValue;
        // range input 값을 text input에 반영
        document.getElementById("recruitmentText").value = rangeValue;
    });
    
    // text input 값 변경 시, range input 업데이트
    document.getElementById("recruitmentText").addEventListener("input", function() {
        var textValue = document.getElementById("recruitmentText").value;
        if (textValue >= 1 && textValue <= 10) { // 범위 확인
            document.getElementById("recruitment").value = textValue;
            document.getElementById("recruitmentValue").innerText = textValue;
        } else {
            // 범위를 벗어난 경우 예외 처리(여기서는 1로 설정)
            document.getElementById("recruitment").value = 1;
            document.getElementById("recruitmentValue").innerText = 1;
        }
    });
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
        
 	// 동행 게시글 등록 
	function submitForm() {
	    const writer = "7012"; // 작성자를 가정하여 설정
	    const title = document.getElementById("title").value;
	    const contents = $("#content").val();
	    const start_Date = document.getElementById("date_start").value;
	    const end_Date = document.getElementById("date_end").value;
	    const us_num = 108; // 게시글 번호를 가정하여 설정
	    const us_cnt = 5; // 동행 수를 가정하여 설정
	
	    const param = {
	        us_num: us_num,
	        city_name : "수원시",
	        writer: writer,
	        us_cnt: us_cnt,
	        start_Date: start_Date,
	        end_Date: end_Date,
	        title: title,
	        content: contents
	    };
	
	    console.log("param"+param)
	    fetch("/us/writeInsert", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param)
	    })
	    .then(response => response.json())
	    .then(json => {
	    	
	        alert(json.message);
	        location.href = "/us/list";
	    })
	    .catch(error => {
	        console.error("오류 발생:", error);
	    });
	}

    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>