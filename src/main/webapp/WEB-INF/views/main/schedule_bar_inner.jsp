<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="usSearchForm" method="post" action="<c:url value='/us/list'/>">
            <div class="schedule_bar_inner">
                <div class="schedule_menu">출발일</div>
                <div class="schedule_menu_input"><input type="date" class="start_date" name="start_Date"></div>
            </div>
            <div class="schedule_bar_inner">
                <div class="schedule_menu">마감일</div>
                <div class="schedule_menu_input"><input type="date" class="end_date" name="end_Date"></div>
            </div>
            <div class="search_btn_div">
            <input type="submit" value="검색" class="search_button">
            </div>
 </form>
</body>
</html>