<%@page import="Myeong.Hun.VideoListDto"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String title = request.getParameter("title");
ArrayList<String> list = (ArrayList) session.getAttribute("videoList");
String videoTitle = title;

if(list==null){
     list = new ArrayList<String>();
     session.setAttribute("videoList",list);
}

list.add(request.getParameter("title"));
%>