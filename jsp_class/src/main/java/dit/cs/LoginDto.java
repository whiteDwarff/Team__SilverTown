/***********************************
  * 작성자 : munhokang
  * 작성일 : 2023. 5. 10.
  * 파일명 : LoginDto.java
  * comment : 
  * 	DB의 login table data를 처리하기 위한 class
  * 	DB에서 검색해온 데이터를 넣어서 전달
***********************************/
package dit.cs;

/**
 * @author munhokang
 *
 */
public class LoginDto {
	// Propertiy
	private String id;
	private String name;
	private String pwd;
	
	// setters, getters
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	// 생성자 
	public LoginDto(String id, String name, String pwd) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}
	
}
