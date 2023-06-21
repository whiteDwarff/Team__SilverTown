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

	private Connection getConnection() throws Exception {
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/project01_db");

		Connection con = ds.getConnection();

		return con;
	}

	// index페이지 카테고리별 영상 뽑아오는 메소드
	public ArrayList<VideoListDto> list(String categoryId) {
		String sql = "select * from video where category_id = ?";
		ArrayList<VideoListDto> dto = new ArrayList<VideoListDto>();

		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
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

				dto.add(vldto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//검색 내용 뽑아오는 메소드
	public ArrayList<VideoListDto> search(String title) {
		String sql = "SELECT * FROM video WHERE title LIKE ?";
		ArrayList<VideoListDto> dto = new ArrayList<VideoListDto>();

		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1,"%"+title+"%");
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

				dto.add(vldto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public VideoListDto getVideoByTitle(String title){
	      String sql = "select * from video where title = ?";
	      VideoListDto dto = new VideoListDto();
	   
	   
	   try(Connection con = getConnection();
	      PreparedStatement pstmt = con.prepareStatement(sql);)
	   {
	      pstmt.setString(1, title);
	      ResultSet rs = pstmt.executeQuery();
	      
	      while (rs.next()) {
	         dto.setCategory_id(rs.getString("category_id"));
	         dto.setDescription(rs.getString("description"));
	         dto.setId(rs.getString("id"));
	         dto.setTitle(rs.getString("title"));
	         dto.setUploaded_at(rs.getString("uploaded_at"));
	         dto.setUploader_id(rs.getString("uploader_id"));
	         dto.setUrl(rs.getString("url"));
	      }
	   }
	      catch (Exception e) {
	         e.printStackTrace();
	      }
	      return dto;
	   }

}
