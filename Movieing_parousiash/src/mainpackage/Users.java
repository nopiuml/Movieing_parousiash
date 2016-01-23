package mainpackage;

public class Users {
	private String username;
	private String password;
	private static int usersCounter=0;

	
	//getters & setters
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static void setUsersCounter(int usersCounter) {
		Users.usersCounter = usersCounter;
	}
	/**constructor for Users class*/
	public Users(String username, String password) {
	    super();
	    this.username = username;
	    this.password = password;
	    
	    usersCounter++;    
	}
}

