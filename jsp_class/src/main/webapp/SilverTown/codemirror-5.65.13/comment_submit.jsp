<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Comment Submit</title>
</head>
<body>
	<%
	// DB 연결 정보
	String url = "jdbc:mariadb://localhost:3306/project01_db";
	String user = "seohyun";
	String password = "1111";
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 폼에서 입력받은 값 가져오기
	String name = request.getParameter("name");
	String content = request.getParameter("commentContent");
	
	try {
		// JDBC 드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		
		// DB 연결
		conn = DriverManager.getConnection(url, user, password);
		
		// SQL 쿼리 준비
		String sql = "INSERT INTO vid_comment (user_name,content, created_at) VALUES (?,?, NOW())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		
		// SQL 쿼리 실행
		pstmt.executeUpdate();
		
		// 작업 완료 후 다시 원래 페이지로 이동
		response.sendRedirect("comment.jsp");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		// DB 자원 반환
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	%>
</body>
</html>
