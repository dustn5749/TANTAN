 	//검색시 pageNo를 1페이지로 전환
 	document.querySelector("#searchForm").addEventListener("submit", e => {
 		console.log(document.querySelector("#search_input").value);
 		document.querySelector("#searchForm > #pageNo2").value = "1";
 		return true;
 	});	
 	
 	//페이지 이동
 	function jsPageNo(pageNo) {
 		console.log("페이지 이동" + pageNo);
 		document.querySelector("#pageNo1").value = pageNo;
 		document.querySelector("#pageForm").submit(); 
 		 return false;
 	}
 	
 	//페이지 상세보기 
 	$(".inq_title").on("click", function(e){
 		console.log("페이지 상세보기")
		var tr = $(this).closest("tr");

    var inquiry_num = tr.find(".inquiry_input#inquiry_num").text().trim();
	
	
   
 	})
 	
 	// 글쓰기
 	$(".writeBtn").on("click", function(){
		 location.href = "/customer/write";
	 })