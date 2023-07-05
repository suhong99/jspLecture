package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;

public class CalendarDao {

	private static CalendarDao dao = null;
	
	private CalendarDao() {
	}
	
	public static CalendarDao getInstance() {
		if(dao == null) {
			dao = new CalendarDao();
		}
		return dao;
	}
	
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		
		String sql = "	select seq, id, title, content, rdate, wdate "
				+ "		from "
				+ "			(	select row_number()over(partition by substr(rdate, 1, 8) order by rdate asc) as rnum, "
				+ "					seq, id, title, content, rdate, wdate "
				+ "				from calendar "
				+ "				where id=? and substr(rdate, 1, 6)=?) a "
				+ "		where rnum between 1 and 5 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getCalendarList 1/4 success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, yyyyMM);
			System.out.println("getCalendarList 2/4 success");
			
			rs = psmt.executeQuery();
			System.out.println("getCalendarList 3/4 success");
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto(	rs.getInt(1), 
													rs.getString(2), 
													rs.getString(3), 
													rs.getString(4), 
													rs.getString(5), 
													rs.getString(6) );
				list.add(dto);
			}
			System.out.println("getCalendarList 4/4 success");
			
		} catch (SQLException e) {
			System.out.println("getCalendarList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public boolean addCalendar(CalendarDto dto) {
		
		String sql = " 	insert into calendar(id, title, content, rdate, wdate) "
				+ "		values(?, ?, ?, ?, now()) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("addCalendar 1/3 success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getRdate());
			System.out.println("addCalendar 2/3 success");
			
			count = psmt.executeUpdate();	
			System.out.println("addCalendar 3/3 success");
			
		} catch (SQLException e) {		
			System.out.println("addCalendar fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
	}
	
}











