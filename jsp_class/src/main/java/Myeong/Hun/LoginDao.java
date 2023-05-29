/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 10.
* 파일명 : LoginDao.java
* 프로그램 설명 : 
* 		- login 테이블에 접근하여 CRUD 기능 처리
**/
package Myeong.Hun;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDao {
	//DBCP로 데이터베이스에 접근하여 Connection이 얻어오는 메소드
	//1. 접근제어자 (Public or Private)
	//2. 반환 데이터 타입 
	//3. 입력 매개변수
	private Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/project01_db");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	//폼에서 가져온 데이터를 DB의 login 테이블에 저장
	public void insertLogin(LoginDto dto) {
		String sql = "insert into test values(?,?,?)";
		
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
=======
import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDao {
	//DBCP로 데이터베이스에 접근하여 Connection이 얻어오는 메소드
	//1. 접근제어자 (Public or Private)
	//2. 반환 데이터 타입 
	//3. 입력 매개변수
	private Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/silvertown");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	//로그인, 회원가입, 정보수정, 회원탈퇴
	public LoginDto memberFunction(LoginDto dto, String keyword) {
		PreparedStatement pstmt = null;
		LoginDto member = new LoginDto();
		
		try(Connection con = getConnection()){
			
			//L = 로그인
			if(keyword.equals("L")) {
				String sql = "SELECT * FROM member WHERE email=? AND password=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getPassword());
				ResultSet rs = pstmt.executeQuery();
				pstmt.close();
				
				if(rs.next()) {
					member.setEmail(rs.getString("email"));
					member.setName(rs.getString("name"));
					member.setCreated_at(rs.getString("Created_at"));
					member.setId(rs.getString("id"));
					member.setPassword(rs.getString("password"));
					member.setPhone_number(rs.getString("phone_number"));
				}
			}
			
			//I = 회원가입
			if(keyword.equals("I")) {
			    String sql = "INSERT INTO MEMBER (NAME, EMAIL, PASSWORD, PHONE_NUMBER) "
			            + "VALUES (?, ?, ?, ?)";
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, dto.getName());
			    pstmt.setString(2, dto.getEmail());
			    pstmt.setString(3, dto.getPassword());
			    pstmt.setString(4, dto.getPhone_number());
			    int result = pstmt.executeUpdate();
			    pstmt.close();
			    
			    if(result > 0) {
			        member.setEmail(dto.getEmail());
			        member.setName(dto.getName());
			        member.setPassword(dto.getPassword());
			        member.setPhone_number(dto.getPhone_number());
			    }
			}  
			
			//U = 정보수정
			if(keyword.equals("U")) {
				
			}
			
			//D = 회원탈퇴
			if(keyword.equals("D")) {
				
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
		}
}
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
