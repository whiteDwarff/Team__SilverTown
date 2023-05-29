/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 12.
* 파일명 : BoardDto.java
* 프로그램 설명 : 
**/
package Myeong.Hun;

import java.util.List;

/**
 * @author EAN21V12
 *
 */
public class BoardDto {
	
	
	
	private String id;
	private String title;
	private String content;
	private String author_id;
	private String created_at;
	
	private String comment_content;
	private String comment_post_id;
	private String comment_author_id;
	private String comment_created_at;
	
	private String update_Title;
	private String update_Content;
	
	private String name;
	
	private String author_name;
	private String created_date;
	
	private List<BoardDto> commentList;
	
	private int post_id;
	
	

	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the author_id
	 */
	public String getAuthor_id() {
		return author_id;
	}
	/**
	 * @param author_id the author_id to set
	 */
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	/**
	 * @return the created_at
	 */
	public String getCreated_at() {
		return created_at;
	}
	/**
	 * @param created_at the created_at to set
	 */
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	/**
	 * @return the comment_content
	 */
	public String getComment_content() {
		return comment_content;
	}
	/**
	 * @param comment_content the comment_content to set
	 */
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	/**
	 * @return the comment_post_id
	 */
	public String getComment_post_id() {
		return comment_post_id;
	}
	/**
	 * @param comment_post_id the comment_post_id to set
	 */
	public void setComment_post_id(String comment_post_id) {
		this.comment_post_id = comment_post_id;
	}
	/**
	 * @return the comment_author_id
	 */
	public String getComment_author_id() {
		return comment_author_id;
	}
	/**
	 * @param comment_author_id the comment_author_id to set
	 */
	public void setComment_author_id(String comment_author_id) {
		this.comment_author_id = comment_author_id;
	}
	/**
	 * @return the comment_created_at
	 */
	public String getComment_created_at() {
		return comment_created_at;
	}
	/**
	 * @param comment_created_at the comment_created_at to set
	 */
	public void setComment_created_at(String comment_created_at) {
		this.comment_created_at = comment_created_at;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	public void setCommentList(List<BoardDto> commentList) {
	    this.commentList = commentList;
	}
	/**
	 * @return the update_Title
	 */
	public String getUpdate_Title() {
		return update_Title;
	}
	/**
	 * @param update_Title the update_Title to set
	 */
	public void setUpdate_Title(String update_Title) {
		this.update_Title = update_Title;
	}
	/**
	 * @return the update_Content
	 */
	public String getUpdate_Content() {
		return update_Content;
	}
	/**
	 * @param update_Content the update_Content to set
	 */
	public void setUpdate_Content(String update_Content) {
		this.update_Content = update_Content;
	}
	/**
	 * @return the author_name
	 */
	public String getAuthor_name() {
		return author_name;
	}
	/**
	 * @param author_name the author_name to set
	 */
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	/**
	 * @return the created_date
	 */
	public String getCreated_date() {
		return created_date;
	}
	/**
	 * @param created_date the created_date to set
	 */
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	/**
	 * @return the post_id
	 */
	public int getPost_id() {
		return post_id;
	}
	/**
	 * @param post_id the post_id to set
	 */
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	

}
