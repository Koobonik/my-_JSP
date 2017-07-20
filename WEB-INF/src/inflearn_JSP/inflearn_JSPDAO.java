package inflearn_JSP;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class inflearn_JSPDAO {

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
			String SQL = "SELECT inflearn_JSPID FROM inflearn_JSP ORDER BY inflearn_JSPIDDESC";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return rs.getInt(1)+1;
				}
				return 1;//첫번째 게시물인 경우
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;//데이터 베이스오류
		}
	
	public int write(String inflearn_JSPTitle, String userID, String inflearn_JSPContent){
		String SQL = "INSERT INTO inflearn_JSP VALUES(?, ?, ?, ?, ?, ?)";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, inflearn_JSPTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, inflearn_JSPContent);
				pstmt.setInt(6, 1);
				return pstmt.executeUpdate();
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;//데이터 베이스오류
		}
	public ArrayList<inflearn_JSP> getList(int pageNumber){
		String SQL = "SELECT * FROM inflearn_JSP WHERE inflearn_JSPID < ? AND inflearn_JSPIDAvailable = 1 ORDER BY inflearn_JSPIDDESC LIMIT 10";
		ArrayList<inflearn_JSP> list = new ArrayList<inflearn_JSP>();
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);
				rs = pstmt.executeQuery();
				while(rs.next()){
					inflearn_JSP Inflearn_JSP = new inflearn_JSP();
					Inflearn_JSP.setinflearn_JSPID(rs.getInt(1));
					Inflearn_JSP.setinflearn_JSPTitle(rs.getString(2));
					Inflearn_JSP.setUserID(rs.getString(3));
					Inflearn_JSP.setinflearn_JSPDate(rs.getString(4));
					Inflearn_JSP.setinflearn_JSPContent(rs.getString(5));
					Inflearn_JSP.setinflearn_JSPAvailable(rs.getInt(6));
					list.add(Inflearn_JSP);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
	}
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM inflearn_JSP WHERE inflearn_JSPID < ? AND inflearn_JSPIDAvailable = 1 ORDER BY inflearn_JSPIDDESC LIMIT 10";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return true;	
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return false;
	}
	public inflearn_JSP getinflearn_JSP(int inflearn_JSPID){
		String SQL = "SELECT * FROM BBS WHERE inflearn_JSPID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, inflearn_JSPID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				inflearn_JSP Inflearn_JSP = new inflearn_JSP();
				Inflearn_JSP.setinflearn_JSPID(rs.getInt(1));
				Inflearn_JSP.setinflearn_JSPTitle(rs.getString(2));
				Inflearn_JSP.setUserID(rs.getString(3));
				Inflearn_JSP.setinflearn_JSPDate(rs.getString(4));
				Inflearn_JSP.setinflearn_JSPContent(rs.getString(5));
				Inflearn_JSP.setinflearn_JSPAvailable(rs.getInt(6));
				return Inflearn_JSP;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public int update(int inflearn_JSPID, String inflearn_JSPTitle, String inflearn_JSPContent){
		String SQL = "UPDATE INFLEARN_JSP SET inflearn_JSPTitle = ?, inflearn_JSPContent = ? WHERE inflearn_JSPID = ?";
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, inflearn_JSPTitle);
				pstmt.setString(2, inflearn_JSPContent);
				pstmt.setInt(6, inflearn_JSPID);
				return pstmt.executeUpdate();
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;//데이터 베이스오류
	}
}