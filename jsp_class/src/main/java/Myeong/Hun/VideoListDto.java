/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 13.
* 파일명 : VideoListDto.java
* 프로그램 설명 : 
**/
package Myeong.Hun;

/**
 * @author EAN21V12
 *
 */
public class VideoListDto {

	/**
	 * @param args
	 */
	
	private String id;
	private String title;
	private String description;
	private String url;
	private String uploader_id;
	private String uploaded_at;
	private String category_id;
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * @return the uploader_id
	 */
	public String getUploader_id() {
		return uploader_id;
	}
	/**
	 * @param uploader_id the uploader_id to set
	 */
	public void setUploader_id(String uploader_id) {
		this.uploader_id = uploader_id;
	}
	/**
	 * @return the uploaded_at
	 */
	public String getUploaded_at() {
		return uploaded_at;
	}
	/**
	 * @param uploaded_at the uploaded_at to set
	 */
	public void setUploaded_at(String uploaded_at) {
		this.uploaded_at = uploaded_at;
	}
	/**
	 * @return the category_id
	 */
	public String getCategory_id() {
		return category_id;
	}
	/**
	 * @param category_id the category_id to set
	 */
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

}
