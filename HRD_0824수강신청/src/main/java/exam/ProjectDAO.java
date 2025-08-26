package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DB 접속
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "system";
		String password = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 접속 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		
		return conn;
	}//getConn()
	
	//DB 접속 해제
	public void dbClose() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			System.out.println("DB 접속 해제!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}
	}//dbClose
	
	public List<Sub1DTO> selectSub1() {
		conn = getConn();
		String sql = "select course.c_id, course.c_name, course.credit, lecturer.l_name, course.week, course.start_hour, course.end_hour ";
		sql += "from tbl_course_202301 course, tbl_lecturer_202301 lecturer ";
		sql += "where course.l_id = lecturer.l_id ";
		sql += "order by course.c_id asc";
		
		List<Sub1DTO> list = new ArrayList<Sub1DTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub1DTO dto = new Sub1DTO();
				dto.setC_id(rs.getString(1));
				dto.setC_name(rs.getString(2));
				dto.setCredit(rs.getInt(3));
				dto.setL_name(rs.getString(4));
				dto.setWeek(rs.getInt(5));
				dto.setStart_hour(rs.getInt(6));
				dto.setEnd_hour(rs.getInt(7));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub1() Exception!!!");
		}finally {
			dbClose();
		}
		
		return list;
	}//selectSub1()
	
	//수정 교과목 검색 
	public Sub1UpdateDTO selectOneSub1(String c_id) {
		conn= getConn();
		String sql = "select * from tbl_course_202301 where c_id = ?";
		Sub1UpdateDTO dto = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, c_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new Sub1UpdateDTO();
				dto.setC_id(rs.getString(1));
				dto.setC_name(rs.getString(2));
				dto.setCredit(rs.getInt(3));
				dto.setL_id(rs.getString(4));
				dto.setWeek(rs.getInt(5));
				dto.setStart_hour(rs.getInt(6));
				dto.setEnd_hour(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOneSub1() Exception!!!");
		}finally {
			dbClose();
		}
		
		return dto;
	}//selectOneSub1()
	
	//교과목 수정
	public void updateSub1(Sub1UpdateDTO dto) {
		conn = getConn();
		String sql = "update tbl_course_202301 ";
		sql += "set c_name = ?, credit = ?, l_id = ?, week = ?, start_hour = ?, end_hour = ? ";
		sql += "where c_id = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getC_name());
			ps.setInt(2, dto.getCredit());
			ps.setString(3, dto.getL_id());
			ps.setInt(4, dto.getWeek());
			ps.setInt(5, dto.getStart_hour());
			ps.setInt(6, dto.getEnd_hour());
			ps.setString(7, dto.getC_id());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateSub1() Exception!!!");
		} finally {
			dbClose();
		}
	}//updateSub1()
	
	//삭제
	public void deleteSub1(String c_id) {
		conn= getConn();
		String sql = "delete from tbl_course_202301 where c_id = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, c_id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteSub1() Exception!!!");
		}finally {
			dbClose();
		}
	}//deleteSub1()
	
	public void insertSub2(Sub1UpdateDTO dto) {
		conn = getConn();
		String sql = "insert into tbl_course_202301 values(?, ?, ?, ?, 5, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getC_id());
			ps.setString(2, dto.getC_name());
			ps.setInt(3, dto.getCredit());
			ps.setString(4, dto.getL_id());
			ps.setInt(5, dto.getWeek());
			ps.setInt(6, dto.getStart_hour());
			ps.setInt(7, dto.getEnd_hour());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertSub2() Exception!!!");
		}finally {
			dbClose();
		}
	}//insertSub2()
	
	
	
	
	
	
	
	
	
	
	
}//class
