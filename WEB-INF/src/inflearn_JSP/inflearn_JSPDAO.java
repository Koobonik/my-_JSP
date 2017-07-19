package inflearn_JSP;
package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class inflearn_JSPAO {

	private Connection conn;
	private ResultSet rs;
	
	//mysql 접속
	public inflearn_JSPDAO(){
		try{
			String dbURL ="jdbc:mysql://http://kooworld.run.goorm.io/inflearn_JSP";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public String getDate(){
			String SQL = "SELECT NOW()";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return rs.getString(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return "";//데이터 베이스오류
		}
	
	public int getNext(){
			String SQL = "SELECT inflearn_JSPID FROM FROM inflearn_JSP ORDER BY inflearn_JSPIDDESC";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return rs.getString(1)+1;
				}
				return 1;//첫번째 게시물인 경우
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;//데이터 베이스오류
		}
	
	public int write(String inflearn_JSPTitle, String userID, String inflearn_JSPContent){
		String SQL = "INSERT INTO inflearn_JSP VALUE(?, ?, ?, ?, ?, ?)";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, inflearn_JSPTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, inflearn_JSPContent);
				pstmt.setString(6, 1);
				rs = pstmt.executeQuery();
				rs = pstmt.executeUpdate();
				return 1;//데이터 베이스 오류
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;//데이터 베이스오류
		}
	}
	
}