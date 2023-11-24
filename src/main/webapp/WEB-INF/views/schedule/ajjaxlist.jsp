<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />



<c:forEach var="dto" items="${result.scheduleList}}">
	<div class="items">
			<div class="thumb_img">
		            <ul id="schedulelist">
                <section id = ""list=wrap">
                    <c:forEach var="schedule" items="${result.scheduleList}">
                    <li>
                        <h2>${schedule.member_Id}</h2>
                                                             <p>${schedule.schedule_Num}</p>
                                            <p>지역:${schedule.doe_Name}</p>
                                            <p>여행시작:${schedule.start_Num != null ? schedule.start_Num : ""}</p>
                                            <p>여행끝:${schedule.end_Date != null ? schedule.end_Date : ""}</p>
                                            <p>게시일:${schedule.reg_Date != null ? schedule.reg_Date : ""}</p>
                                            <input type="hidden" value="${schedule.schedule_Num}" class="schedule_num">
                   
  <a href="/mobile/newsview.do?seq_no=${li.seq_no}"></a>
                    </li>
                  </c:forEach>
</c:forEach>