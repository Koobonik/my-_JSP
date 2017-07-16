package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try{
			String dbURL ="jdbc:mysql://http://kooworld.run.goorm.io/inflearn_JSP/login.jsp";
			String dbID = "root";
			String dbPassword = "qhsdlr21!!";
			class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnetion(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public in login(String userID, String userPassword){
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try{
			pstmt = conn.PreparedStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;//로그인성공
				}
				else
					return 0;//비밀번호 불일치
			}
			return -1;//아이디가 없음
		}catch(Exception e){
			e.printStackTrace();
	}
		return -2;//데이터 베이스 오류
	

}
