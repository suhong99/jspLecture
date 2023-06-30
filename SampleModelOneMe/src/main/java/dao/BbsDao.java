package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	
	private static BbsDao dao = null;
	
	private BbsDao() {
		DBConnection.initConnection();
	}
	
	public static BbsDao getInstance() {
		if(dao == null) {
			dao = new BbsDao();
		}
		return dao;
	}
	
	public List<BbsDto> getBbsList() {
		
		String sql = " 	select seq, id, ref, step, depth, "
				+ "			title, content, wdate, del, readcount "
				+ "		from bbs "
				+ "		order by ref desc, step asc ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getBbsList 1/4 success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("getBbsList 2/4 success");
			
			rs = psmt.executeQuery();
			System.out.println("getBbsList 3/4 success");
			
			while(rs.next()) {
			//	int seq = rs.getInt("seq");
			//	int seq = rs.getInt(1);
				
				BbsDto dto = new BbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getInt(3), 
										rs.getInt(4), 
										rs.getInt(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getString(8), 
										rs.getInt(9), 
										rs.getInt(10));
				list.add(dto);
			}
			System.out.println("getBbsList 4/4 success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {			
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	  public boolean writeBbs(String id, String title, String content) {
	        String sql = "INSERT INTO bbs (id, ref, step, depth, title, content, wdate, del, readcount) "
	                + "VALUES (?, (SELECT IFNULL(MAX(ref), 0) + 1 FROM bbs b), 0, 0, ?, ?, NOW(), 0, 0)";

	        Connection conn = null;
	        PreparedStatement psmt = null;
			ResultSet rs = null;

	        try {
	            conn = DBConnection.getConnection();
	            psmt = conn.prepareStatement(sql);
	            psmt.setString(1, id);
	            psmt.setString(2, title);
	            psmt.setString(3, content);
	            
	            int result = psmt.executeUpdate();
	            
	            return result > 0; // 작성 성공 여부 반환
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBClose.close(psmt, conn, rs);
	        }
	        
	        return false; // 작성 실패 시 false 반환
	    }
    
	    
	

}











