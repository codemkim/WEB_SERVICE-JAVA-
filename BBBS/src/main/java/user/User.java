package user;

public class User {

	private String userID;
	private String userPassword;
	private String userPrice;
	private String userGender;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPrice() {
		return userPrice;
	}
	public void setUserPrice(String userPrice) {
		this.userPrice = userPrice;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	
}
