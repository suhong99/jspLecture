package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {
		public static MemberDao dao=null;

		private MemberDao() {
			DBConnection.initConnection();

		}
		public static MemberDao getInstance() {
			if(dao==null) {
				dao = new MemberDao();
			}
			return dao;
		}
		public boolean getId(String id) {
			String sql =   "    select count(*)"
						+ "     from member "
						+ "     where id=? ";
			Connection conn= null;
			PreparedStatement psmt = null;
			ResultSet rs= null;
			
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("getID 1/4 success");
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				System.out.println("getID 2/4 success");

				rs= psmt.executeQuery();
				System.out.println("getID 3/4 success");

				if(rs.next()) {
					count = rs.getInt(1);
				}
				System.out.println("getID 4/4 success");

			} catch (SQLException e) {
				System.out.println("getId fail");
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, rs);
			}
			return count>0?true : false;
			}
		
		public boolean addMember(MemberDto dto) {
			String sql= " insert into member(id, pwd, name, email,auth) "
					+ " values(?, ?, ?, ?, 3)";
			Connection conn =null;
			PreparedStatement psmt = null;
			
			int count =0;
			
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("addMember 1/3 success");

				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,dto.getId());
				psmt.setString(2, dto.getPwd());
				psmt.setString(3, dto.getName());
				psmt.setString(4,  dto.getEmail());
				System.out.println("addMember 2/3 success");
				
				count = psmt.executeUpdate();
				System.out.println("addMember 3/3 success");

			} catch (SQLException e) {
				System.out.println("addMember fail");
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, null);
			}
			
			return count >0;
//			return count >0?true:false;

		}
}
