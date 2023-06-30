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
	// 게시글 상세
	public BbsDto getBbsBySeq(int seq) {
	    String sql = "SELECT seq, id, ref, step, depth, title, content, wdate, del, readcount "
	            + "FROM bbs "
	            + "WHERE seq = ?";
	    
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    
	    BbsDto dto = null;
	    
	    try {
	        conn = DBConnection.getConnection();
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, seq);
	        
	        rs = psmt.executeQuery();
	        
	        if (rs.next()) {
	            dto = new BbsDto(rs.getInt(1), 
	                            rs.getString(2), 
	                            rs.getInt(3), 
	                            rs.getInt(4), 
	                            rs.getInt(5), 
	                            rs.getString(6), 
	                            rs.getString(7), 
	                            rs.getString(8), 
	                            rs.getInt(9), 
	                            rs.getInt(10));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {            
	        DBClose.close(psmt, conn, rs);
	    }
	    
	    return dto;
	}
	  public void updateReadCount(int seq) {
	        String sql = "UPDATE bbs SET readcount = readcount + 1 WHERE seq = ?";
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        
	        try {
	            conn = DBConnection.getConnection();
	            psmt = conn.prepareStatement(sql);
	            psmt.setInt(1, seq);
	            
	            psmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBClose.close(psmt, conn,null);
	        }
	    }
	
	public boolean bbswrite(BbsDto bbs) {
		String sql = " 	insert into bbs(id, ref, step, depth, "
				+ "						title, content, wdate, del, readcount) "
				+ " 	values(?, (select ifnull(max(ref), 0)+1 from bbs b), 0, 0, "
				+ "						?, ?, now(), 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("bbswrite 1/3 success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bbs.getId());
			psmt.setString(2, bbs.getTitle());
			psmt.setString(3, bbs.getContent());
			System.out.println("bbswrite 2/3 success");
			
			count = psmt.executeUpdate();
			System.out.println("bbswrite 3/3 success");			
			
		} catch (SQLException e) {
			System.out.println("bbswrite fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}

}











