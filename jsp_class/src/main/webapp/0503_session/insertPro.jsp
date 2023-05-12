<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	InitialContext initCtx = new InitialContext();
	
	Context ctx = (Context)initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/munho");
	
	Connection con = ds.getConnection();

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "INSERT INTO member(id,name,pwd) VALUES(?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	
	//4. SQL 실행
	int i = pstmt.executeUpdate();
	if(i == 1) {
		session.setAttribute("id", id);
		session.setAttribute("password", pwd);
	}
	
	//5. 객체 해제
	pstmt.close();
	con.close();
	
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=i %>행이 입력되었습니다!
</body>
</html>