<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment</title>
</head>
<body>
    <h1>Comments</h1>
    <hr>
    
    <%-- 여기서부터 댓글 작성 폼입니다. --%>
    <form action="comment_submit.jsp" method="post">
    		<label for="vid_id">영상번호 :</label>
        <input type="number" name="vid_id" id="vid_id" readonly>
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>
        <br>
        <label for="content">Comment:</label>
        <textarea name="content" id="content" rows="4" cols="50" required></textarea>
        <br>
        <button type="submit">Submit</button>
    </form>
    <hr>
    
    <%-- 여기서부터 댓글 목록입니다. --%>
    <h2>Comment List</h2>
    <%
        // DB 연결 코드입니다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3306/project01_db";
	String user = "seohyun";
	String password = "1111";
	
        Connection conn = DriverManager.getConnection(url,user,password);
        
        // 댓글 목록을 불러오는 SQL 쿼리입니다.
        String sql = "SELECT * FROM vid_comment";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        
        // 댓글을 하나씩 출력합니다.
        while(rs.next()) {
            int id = rs.getInt("video_id");
            String name = rs.getString("user_name");
            String content = rs.getString("content");
            String date = rs.getString("created_at");
            %>
            <div>
                <strong><%=name %></strong>
                <small><%=date %></small>
                <p><%=content %></p>
            </div>
            <hr>
            <%
        }
        
        // DB 연결을 종료합니다.
        rs.close();
        stmt.close();
        conn.close();
    %>
</body>
</html>
