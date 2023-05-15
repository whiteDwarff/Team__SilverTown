/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 10.
* 파일명 : LoginDao.java
* 프로그램 설명 : 
* 		- login 테이블에 접근하여 CRUD 기능 처리
**/
package Myeong.Hun;

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
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/hunMyeong");
		
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
