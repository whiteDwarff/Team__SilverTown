/**
* 작성자 : EAN21V12
* 작성일 : 2023. 5. 10.
* 파일명 : LoginDto.java
* 프로그램 설명 : DB의 login 테이블의 데이터를 처리하기 위한 클래스
* 			: 데이터베이스에서 검색해온 데이터를 넣어서 전달
**/
package Myeong.Hun;

/**
 * @author EAN21V12
 *
 */
public class LoginDto {
	/**
	 * @param id
	 * @param name
	 * @param pwd
	 */
//	public LoginDto() {};
<<<<<<< HEAD
	
	public LoginDto(String id, String name, String pwd) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}

	//Propertiy
	private String id;
	private String name;
	private String pwd;
	
	//setters and getters
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
=======
	private String id;
	private String name;
	private String email;
	private String password;
	private String phone_number;
	private String created_at;
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
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the phone_number
	 */
	public String getPhone_number() {
		return phone_number;
	}
	/**
	 * @param phone_number the phone_number to set
	 */
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
	}
	
	
}
