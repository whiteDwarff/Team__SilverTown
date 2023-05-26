<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ArrayList<String> list = (ArrayList<String>) session.getAttribute("videoList");
String title = request.getParameter("title");

// 아이템이 포함된 인덱스 찾기
int index = -1;
for (int i = 0; i < list.size(); i++) {
    if (list.get(i).equals(title)) {
        index = i;
        break;
    }
}

// 아이템 제거
if (index != -1) {
    list.remove(index);
}

// 수정된 리스트를 세션에 저장
session.setAttribute("videoList", list);
%>
<script>
  alert("삭제되었습니다.")
  location.href="wishList.jsp";
</script>