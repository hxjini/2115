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
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; //127.0.0.1만 바꿔서!!
		String user = "system";
		String password = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver"); //그대로 입력!!
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 접속 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		
		return conn;
	}//getConn()
	
	//DB 접속 해제
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}
	}//dbClose()
	
	//강사조회(sub1)
	public List<Sub1DTO> selectSub1() {
		conn = getConn();
		String sql = "select * from tbl_teacher_202201 order by teacher_code asc";
		List<Sub1DTO> list = new ArrayList<Sub1DTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub1DTO dto = new Sub1DTO();
				dto.setTeacher_code(rs.getString(1)); // dto.setTeacher_code(rs.getString("teacher_code"));
				dto.setTeacher_name(rs.getString(2));
				dto.setClass_name(rs.getString(3));
				dto.setClass_price(rs.getInt(4));
				
				String teach_resist_date = rs.getString(5);
				
				/* teach_resist_date = teach_resist_date.substring(0, 4) + "년" + teach_resist_date.substring(4, 6) + "월" + teach_resist_date.substring(6) + "일";
				 * dto.setTeach_resist_date(teach_resist_date);
				 */
				String date = teach_resist_date.substring(0, 4) + "년";
				date += teach_resist_date.substring(4, 6) + "월";
				date += teach_resist_date.substring(6) + "일";
				dto.setTeach_resist_date(date);
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub1() Exception!!!");
		} finally {
			dbClose();
		}
		
		return list;
	}//selectSub1()
	
	
	//회원정보조회(sub3.jsp)
	public void selectSub3() {
		conn = getConn();
		String sql = "";
		sql += "";
		sql += "";
		sql += "";
		List<Sub3DTO> list = new ArrayList<Sub3DTO>();
				
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub3DTO dto = new Sub3DTO();
				dto.setResist_month(rs.getString(1));
				dto.setC_no(rs.getString(2));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}//selectSub3()
	
	
} //class
