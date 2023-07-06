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
	
	public List<BbsDto> getBbsSearchList(String choice, String search) {
		
		String sql = " 	select seq, id, ref, step, depth, "
				+ "			title, content, wdate, del, readcount "
				+ "		from bbs ";
		
		if(choice.equals("title")) {
			sql += " where title like '%" + search + "%' ";
		}
		else if(choice.equals("content")) {
			sql += " where content like '%" + search + "%' ";
		}
		else if(choice.equals("writer")) {
			sql += " where id='" + search + "' ";
		}		
		
		sql +=  "		order by ref desc, step asc ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getBbsSearchList 1/4 success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("getBbsSearchList 2/4 success");
			
			rs = psmt.executeQuery();
			System.out.println("getBbsSearchList 3/4 success");
			
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
			System.out.println("getBbsSearchList 4/4 success");
			
		} catch (SQLException e) {
			System.out.println("getBbsSearchList fail");
			e.printStackTrace();
		} finally {			
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
		
	// 글의 총수
	public int getAllBbs(String choice, String search) {
		String sql = " select count(*) from bbs ";
		
		if(choice.equals("title")) {
			sql += " where title like '%" + search + "%' ";
		}
		else if(choice.equals("content")) {
			sql += " where content like '%" + search + "%' ";
		}
		else if(choice.equals("writer")) {
			sql += " where id='" + search + "' ";
		}		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
				
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}		
		
		return count;
	}
	
	
	public List<BbsDto> getBbsPageList(String choice, String search, int pageNumber) {
		
		String sql = " 	select seq, id, ref, step, depth, "
				+ "			title, content, wdate, del, readcount "
				+ "		from bbs ";
		
		if(choice.equals("title")) {
			sql += " where title like '%" + search + "%' ";
		}
		else if(choice.equals("content")) {
			sql += " where content like '%" + search + "%' ";
		}
		else if(choice.equals("writer")) {
			sql += " where id='" + search + "' ";
		}		
		
		sql += "		order by ref desc, step asc ";
		
		sql += " limit " + (pageNumber * 10) + ", 10 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getBbsSearchList 1/4 success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("getBbsSearchList 2/4 success");
			
			rs = psmt.executeQuery();
			System.out.println("getBbsSearchList 3/4 success");
			
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
			System.out.println("getBbsSearchList 4/4 success");
			
		} catch (SQLException e) {
			System.out.println("getBbsSearchList fail");
			e.printStackTrace();
		} finally {			
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	
	// 글 작성
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
	
	public BbsDto getBbs(int seq) {
		String sql = " 	select seq, id, ref, step, depth, "
				+ "			title, content, wdate, del, readcount "
				+ "		from bbs "
				+ "		where seq=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BbsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getBbs 1/4 success");	
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("getBbs 2/4 success");
			
			rs = psmt.executeQuery();
			System.out.println("getBbs 3/4 success");
			
			if(rs.next()) {
				dto = new BbsDto(	rs.getInt(1), 
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
			System.out.println("getBbs 4/4 success");
			
		} catch (SQLException e) {
			System.out.println("getBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return dto;		
	}
	
	public void readcount(int seq) {
		String sql = " 	update bbs "
				+ "		set readcount=readcount+1 "
				+ "		where seq=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.execute();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}		
	}
	
	public void answerUpdate(int seq) {
		
		String sql = " update bbs"
				+ " set step = step+1"
				+ " where ref=(select ref from(select ref from bbs a where seq=?) A) "
				+ "  and step>(select step from (select step from bbs b where seq=?) B)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			conn = DBConnection.getConnection();
			System.out.println("answerUpdate 1/6 success");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("answerUpdate 2/6 success");

			psmt.executeUpdate();
			System.out.println("answerUpdate 3/6 success");

		} catch (SQLException e) {
			System.out.println("answerUpdate fail");

			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			}
		}
	
	
	
	
	
	public boolean answerInsert(int seq,BbsDto dto) {
		String sql = " insert into bbs(id, ref, step, depth, "
				+ " title, content, wdate, del, readcount) "
				+ " values(?, "
				+ " (select ref from bbs a where seq=?), "
				+ " (select step from bbs b where seq=?)+1, "
				+ " (select depth from bbs c where seq=?)+1, "
				+ " ?, ?, now(), 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count= 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("answerInsert 4/6 success");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setInt(2, seq);
			psmt.setInt(3, seq);
			psmt.setInt(4, seq);
			psmt.setString(5, dto.getTitle());
			psmt.setString(6,dto.getContent());
			System.out.println("answerInsert 5/6 success");

			count = psmt.executeUpdate();
			System.out.println("answerInsert 6/6 success");

		} catch (SQLException e) {
			System.out.println("answerInsert fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0;
	}
	//삭제
	
		public boolean deleteBbs(int seq) {
			String sql = " update bbs"
					+ " set del = 1"
					+ "		where seq=? ";
			
			boolean process = false;
			Connection conn = null;
			PreparedStatement psmt = null;
			try {
				conn = DBConnection.getConnection();
				System.out.println("delete 1/3 success");
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				System.out.println("delete 2/3 success");

				psmt.executeUpdate();
				System.out.println("delete 3/3 success");
				
				process = true;
			} catch (SQLException e) {
				System.out.println("delete fail");

				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, null);
				}
			
			return process; 
			}
	
	// 글 수정
		public boolean bbsupdate(int seq,BbsDto bbs) {
			String sql = "UPDATE bbs "
					+ "SET title = ?, content = ? "
					+ "WHERE seq = ?";

			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("bbsupdate 1/3 success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, bbs.getTitle());
				psmt.setString(2, bbs.getContent());
				psmt.setInt(3, seq);

				System.out.println("bbsupdate 2/3 success");
				
				count = psmt.executeUpdate();
				System.out.println("bbsupdate 3/3 success");			
				
			} catch (SQLException e) {
				System.out.println("bbsupdate fail");
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
			}
			
			return count>0?true:false;
		}
		
}











