/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 12.
* 파일명 : BoardDao.java
* 프로그램 설명 : 
**/
package Myeong.Hun;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;


import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author EAN21V12
 *
 */
public class BoardDao {
	
	private Connection getConnection() throws Exception{
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/project01_db");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	
	//게시판 수정하기
	public void boardUpdate1(BoardDto dto) {
		String sql = "Update BOARD SET CONTENT = ? WHERE TITLE = ?";
		
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getUpdate_Content());
			pstmt.setString(2, dto.getUpdate_Title());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 제거 + 댓글까지 삭제
	public void boardDelete(int boardId) {
		String sql1 = "DELETE FROM COMMENT WHERE POST_ID = ?";
		String sql2 = "DELETE FROM BOARD WHERE ID = ?";
		
		try (
			Connection con = getConnection();
				PreparedStatement pstmt1 = con.prepareStatement(sql1);
				PreparedStatement pstmt2 = con.prepareStatement(sql2);
				)
		{
			pstmt1.setInt(1, boardId);
			pstmt2.setInt(1, boardId);
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글의 데이터를 가져옴
	public BoardDto boardView1(String title) {
	    String sql = "SELECT * FROM board WHERE title = ?";
	    BoardDto dto = null;
	    
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, title);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            dto = new BoardDto();
	            dto.setId(rs.getString("id"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setAuthor_id(rs.getString("author_id"));
	            dto.setCreated_at(rs.getString("created_at"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return dto;
	}
	
	
	//게시판 수정하기
	public void boardUpdate(BoardDto dto) {
		String sql = "Update BOARD SET TITLE = ?, CONTENT = ? WHERE TITLE = ?";
		
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getUpdate_Title());
			pstmt.setString(2, dto.getUpdate_Content());
			pstmt.setString(3, dto.getTitle());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 제거 + 댓글까지 삭제
	public void boardDelete(String boardId) {
		String sql1 = "DELETE FROM COMMENT WHERE POST_ID = ?";
		String sql2 = "DELETE FROM BOARD WHERE ID = ?";
		
		try (
			Connection con = getConnection();
				PreparedStatement pstmt1 = con.prepareStatement(sql1);
				PreparedStatement pstmt2 = con.prepareStatement(sql2);
				)
		{
			pstmt1.setString(1, boardId);
			pstmt2.setString(1, boardId);
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글의 데이터를 가져옴
	public BoardDto boardView(String title) {
	    String sql = "SELECT * FROM board WHERE title = ?";
	    BoardDto dto = null;
	    
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, title);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            dto = new BoardDto();
	            dto.setId(rs.getString("id"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setAuthor_id(rs.getString("author_id"));
	            dto.setCreated_at(rs.getString("created_at"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return dto;
	}
	
	//게시판 작성자의 NAME를 가져옴.
	public BoardDto Writer(String authorid) {
		String sql = "SELECT NAME FROM MEMBER WHERE ID = ?";
		BoardDto dto = null;
		
		try (Connection con = getConnection();
		        PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, authorid);
		        ResultSet rs = pstmt.executeQuery();

		        if (rs.next()) {
		            dto = new BoardDto();
		            dto.setName(rs.getString("name"));
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return dto;
	}
	
	//게시판 게시글의 댓글내용, 작성시간, 작성자를 가져옴
	public BoardDto comment(String boardId) {
		String sql = "SELECT C.CONTENT, C.CREATED_AT, M.NAME"
				+ "FROM COMMENT C"
				+ "JOIN MEMBER M ON C.AUTHOR_ID = M.ID"
				+ "WHERE C.POST_ID = ?";
		BoardDto dto = new BoardDto();

	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, boardId);
	        ResultSet rs = pstmt.executeQuery();

	        List<BoardDto> commentList = new ArrayList<>();
	        while (rs.next()) {
	            BoardDto commentDto = new BoardDto();
	            commentDto.setContent(rs.getString("CONTENT"));
	            commentDto.setCreated_at(rs.getString("CREATED_AT"));
	            commentDto.setName(rs.getString("NAME"));
	            commentList.add(commentDto);
	        }
	        
	        dto.setCommentList(commentList);
	        




		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		return dto;
	}
	
	//모든 게시글을 가져오기
	public ArrayList<BoardDto> boardList(){
		String sql = "SELECT board.*, DATE(board.created_at) as created_date, member.name as author_name "
				+ "FROM board INNER JOIN member ON board.author_id = member.id ORDER BY 1 Desc;";
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
	
	
	try(Connection con = getConnection();
		Statement stmt = con.createStatement();)
	
	{ ResultSet rs = stmt.executeQuery(sql);
		
		
		while (rs.next()) {
			BoardDto dto = new BoardDto();
			dto.setTitle(rs.getString("title"));
			dto.setAuthor_name(rs.getString("author_name"));
			dto.setCreated_date(rs.getString("created_date"));
			dtos.add(dto);
		}
	}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	//댓글 작성 수정 삭제
public void commentFunction(BoardDto dto,String keyword) {
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try (Connection con = getConnection();){
			if(keyword.equals("I")) {
				sql = "INSERT INTO COMMENT (author_id, post_id, content) VALUES ((SELECT ID FROM MEMBER WHERE NAME = ?), ?, ?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getName());
				pstmt.setInt(2, dto.getPost_id());
				pstmt.setString(3, dto.getComment_content());
				
				pstmt.executeUpdate();
				
			} else if(keyword.equals("U")) {
				sql = "update member set  password = ?, phone_number = ? where email = ?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getAuthor_id());
				pstmt.setString(2, dto.getAuthor_id());
				pstmt.setString(3, dto.getAuthor_id());
				
				pstmt.executeUpdate();
				
			} else if(keyword.equals("D")) {
				sql = "delete from member where email = ?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getAuthor_id());

				pstmt.executeUpdate();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	
	

}
