package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBBS";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // .�α��� ����
				} else
					return 0;
			}
			return -1; // �Ƶ� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}

	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserPrice());
			pstmt.setString(4, user.getUserGender());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	public ArrayList<User> getCount() {
		ArrayList temp = new ArrayList();

		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice < 10000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 20000 AND userPrice >10000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 30000 AND userPrice >20000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 40000 AND userPrice >30000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 50000 AND userPrice >40000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 60000 AND userPrice >50000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice <= 70000 AND userPrice >60000");
		temp.add("SELECT COUNT(*) FROM USER WHERE userPrice > 70000");

		ArrayList list = new ArrayList();
		for (int i = 0; i <= temp.size(); i++) {

			try {
				PreparedStatement pstmt = conn.prepareStatement((String) temp.get(i));
				rs = pstmt.executeQuery();

				if (rs.next()) {
					list.add(rs.getInt(1));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return list;

	}

}
