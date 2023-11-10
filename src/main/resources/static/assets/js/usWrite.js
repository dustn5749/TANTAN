/* 드랍 다운 메뉴 이벤트 처리 */
const dropdownBtn = document.querySelector('.dropdown_btn');
const dropdownMenu = document.querySelector('.dropdown-menu');

let isMenuVisible = false;

dropdownBtn.addEventListener('click', function() {
    isMenuVisible = !isMenuVisible;
    if (isMenuVisible) {
        dropdownMenu.style.display = "block";
    } else {
        dropdownMenu.style.display = "none";
    }
});


/* 지역 선택 */
 function select_area(area){
	$("#us_city_input").val(area);
}


    const recruitmentSlider = document.getElementById('recruitmentSlider');
    const recruitmentText = document.getElementById('recruitmentText');

    recruitmentSlider.addEventListener('input', () => {
        recruitmentText.value = recruitmentSlider.value + '명';
    });

    //이미지 등록 스크립트
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

    	  dropArea.addEventListener("dragenter", highlight, false);
    	  dropArea.addEventListener("dragover", highlight, false);
    	  dropArea.addEventListener("dragleave", unhighlight, false);
    	  dropArea.addEventListener("drop", handleDrop, false);

    	  return {
    	    handleFiles
    	  };
    	}
    
    

    	const dropFile = new DropFile("drop-file", "files");
    	
// 동행 생성하기 
$("#submitbtn").on("click", function() {
    var result = confirm("동행을 생성하시겠습니까?");
    if (result) {
		var form = $("#us_wirte_form")[0]; // jQuery 객체 대신 DOM 엘리먼트를 사용합니다.
		var formData = new FormData(form);
			 var option = {
			    method: 'POST',
			    body: formData
			}
		fetch("/us/writeInsert", option)
        .then(response => response.json())
        .then(json => {
            if (json.result) {
				alert("글 생성에 성공하였습니다.");
                location.href = "/us/list";
            }else {
				alert("글 생성에 실패하였습니다.");
			}
        })
        .catch(error => {
            console.error("오류 발생:", error);
        });
    }
})