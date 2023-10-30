<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.us_header {
		position: sticky;
	    z-index: 9;
	    top: 80px;
	    height: fit-content;
	    background-color: rgb(255, 255, 255);
	    transition: all 0.1s ease-in-out 0.3s;
	}
	.us_header2 {
	    background-color: rgb(255, 255, 255);
	}
	.us_header3 {
		display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    position: sticky;
	    z-index: 9;
	    top: 80px;
	    width: 100%;
	    height: 44px;
	    margin-top: 20px;
	    padding: 0px 0px 20px;
	    background-color: rgb(255, 255, 255);
	}
	.us_header4 {
	z-index: 9;
    box-sizing: border-box;
    width: 260px;
    height: 38px;
    padding: 0px 18px;
    background: rgba(0, 0, 0, 0);
	}	
	
	.us_header5{
	position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 6px;
    background-color: rgb(248, 248, 248);
    border-radius: 50px;
	}
	.us_header6 {
	    position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    border-radius: 50px;
	
	}
	.us_inner {
	    position: absolute;
    left: 0px;
    width: 50%;
    height: 34px;
    background-color: rgb(37, 37, 37);
    border-radius: 20px;
    box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 6px 0px;
	}
	.us_btn{
	    position: relative;
    box-sizing: border-box;
    width: 50%;
    height: 34px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 15px;
    font-weight: 500;
    color: rgb(255, 255, 255);
    border-radius: 20px;
    transition: color 0.1s ease-out 0.4s;
	}
	.us_img {
	    width: 16px;
    height: 16px;
    margin-right: 4px;
	}
	.schedule_btn{
	    position: relative;
    box-sizing: border-box;
    width: 50%;
    height: 34px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 15px;
    font-weight: 500;
    color: rgb(106, 106, 106);
    border-radius: 20px;
    transition: color 0.1s ease-out 0.4s;
	}
</style>
</head>
<body>
<div class="us_header">
    <div class="us_header2"></div>
    <div class="us_header3">
        <div class="us_header4">
            <div class="us_header5">
                <div class="us_header6">
                    <div class="us_inner" style="left: 0%;"></div>
                    <button class="us_btn">
                        <img src="/assets/img/women_holding_hands.png" alt="동행" class="us_img">동행
                    </button>
                    <button class="schedule_btn">
                        <img src="/assets/img/answer2_img02.png" alt="일정" class="us_img">일정
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>