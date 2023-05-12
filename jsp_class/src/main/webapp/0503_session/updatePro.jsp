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

	//1. DB 연동 드라이버 로드
	
	//2. 연결 객체 생성
	InitialContext initCtx = new InitialContext();
	
	Context ctx = (Context)initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/munho");
	
	Connection con = ds.getConnection();

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "UPDATE member SET NAME=?, PWD=? WHERE ID=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, id);
	
	//4. SQL 실행
	int i = pstmt.executeUpdate();
	
	//5. 객체 해제
	pstmt.close();
	con.close();
	%>

	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
	</script>



