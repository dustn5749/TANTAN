//package com.team1.project.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.team1.project.service.ScheduleService;
//
//@Controller
//@RequestMapping("/ajax_page")
//public class AjaxListController {
//
//    @Autowired
//    private ScheduleService scheduleService;
//
//    @GetMapping
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String keyword = request.getParameter("keyword");
//        String order = request.getParameter("order");
//        if (keyword == null) keyword = "";
//        if (order == null) order = "";
//        int curPage = 1;
//        if (request.getParameter("pageNo") != null) {
//            curPage = Integer.parseInt(request.getParameter("pageNo"));
//        }
//
//        int count = scheduleService.getSearchCount(keyword);
//        Pager pager = new Pager(count, curPage);
//        int start = pager.getPageBegin();
//        int end = pager.getPageEnd();
//        int totPage = pager.getTotPage();
//
//        List<ContentsDTO> list = scheduleService.getSearchList(start, end, order, keyword);
//        request.setAttribute("list", list);
//        request.setAttribute("page", pager);
//        request.setAttribute("totPage", totPage);
//        request.setAttribute("count", count);
//        request.setAttribute("keyword", keyword);
//
//        String page = "/ajax_list.jsp";
//        RequestDispatcher rd = request.getRequestDispatcher(page);
//        rd.forward(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}
