/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 13.
* 파일명 : VideoListDao.java
* 프로그램 설명 : 
**/
package Myeong.Hun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author EAN21V12
 *
 */
public class VideoListDao {
	
	private Connection getConnection() throws Exception{
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/silvertown");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public ArrayList<VideoListDto> list(String categoryId){
		String sql = "select * from video where category_id = ?";
		ArrayList<VideoListDto> vldtos = new ArrayList<VideoListDto>();
	
	
	try(Connection con = getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);)
	{
		pstmt.setString(1, categoryId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			VideoListDto vldto = new VideoListDto();
			vldto.setCategory_id(rs.getString("category_id"));
			vldto.setDescription(rs.getString("description"));
			vldto.setId(rs.getString("id"));
			vldto.setTitle(rs.getString("title"));
			vldto.setUploaded_at(rs.getString("uploaded_at"));
			vldto.setUploader_id(rs.getString("uploader_id"));
			vldto.setUrl(rs.getString("url"));
			
			vldtos.add(vldto);
		}
	}
		catch (Exception e) {
			e.printStackTrace();
		}
		return vldtos;
	}

}
