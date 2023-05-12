/***********************************
  * 작성자 : munhokang
  * 작성일 : 2023. 5. 10.
  * 파일명 : LoginDao.java
  * comment : 
  * 	login table에 접근하여 CRUD 기능 처리
  * 	
***********************************/
package dit.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;
/**
 * @author munhokang
 *
 */
public class LoginDao {
	
	// DBCP로 DB에 접근하여 Connection을 얻어오는 method
	// 1. 접근제어자 (public, private)
	// 2. 반환 데이터타입 유무
	// 3. 입력 매개변수 유무
	private	Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp//env/jdbc/munho");
		
		Connection con = ds.getConnection();
		return con;
	}
	// form에서 가져온 데이터를 DB의 login table에 저장
	public void insertLogin(LoginDto dto) {
		String sql = "insert into member values(?,?,?)";
		// 1. Connection 가져오기
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);	
			) {
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPwd());
				
				pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		// 2. Connection을 통해
	}
	
}
