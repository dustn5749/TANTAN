<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


#tempaltemo_footer {
    background-color: #000; /* 배경색 설정 */
    bottom: 0; /* 화면 아래에 고정 */
    left: 0;
    right: 0;
}

.footer_container {
    padding: 10px; /* 원하는 여백 값으로 설정 */
   
}

/* 아이콘 리스트의 스타일 설정 */
.footer-icons {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-icons li {
    display: inline;
    margin-right: 10px; /* 아이콘 간격 설정 */
}

/* 로고 이미지 스타일 설정 */
#tempaltemo_footer img {
    width: 180px; /* 원하는 이미지 너비 설정 */
}


</style>
</head>
<body>
  <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="footer_container">
            

            <div class="row text-light mb-4" >
                 <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div> 
			     <img src="/assets/img/logo.png" style="width: 180px;">
			
            </div>

        <div class="w-100 bg-black py-3">
           
        </div>
        </div>
    </footer>
    <!-- End Footer -->
</body>
</html>