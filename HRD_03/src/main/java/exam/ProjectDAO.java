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
	public List<Sub3DTO> selectSub3() {
		conn = getConn();
		String sql = "select class.resist_month, member.c_no, member.c_name, teacher.class_name, class.class_area, class.tuition, member.grade ";
		sql += "from tbl_teacher_202201 teacher, tbl_member_202201 member, tbl_class_202201 class ";
		sql += "where teacher.teacher_code = class.teacher_code and member.c_no = class.c_no ";
		sql += "order by class.c_no asc";
		List<Sub3DTO> list = new ArrayList<Sub3DTO>();
				
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String resist_month = rs.getString(1);
				resist_month = resist_month.substring(0, 4) + "년" + resist_month.substring(4) + "월";
				dto.setResist_month(resist_month);
				
				dto.setC_no(rs.getString(2));
				dto.setC_name(rs.getString(3));
				dto.setClass_name(rs.getString(4));
				dto.setClass_area(rs.getString(5));
				dto.setTuition(6);
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub3() Exception!!!");
		} finally {
			dbClose();
		}
		
		return list;
	}//selectSub3()

	//강사매출현황(sub4.jsp)
	public List<Sub4DTO> selectSub4(){
		conn = getConn();
		String sql = "select class.teacher_code, teacher.class_name, teacher.teacher_name, sum(class.tuition) as total ";
		sql += "from tbl_teacher_202201 teacher, tbl_class_202201 class ";
		sql += "where teacher.teacher_code = class.teacher_code ";
		sql += "group by class.teacher_code, teacher.class_name, teacher.teacher_name ";
		sql += "order by class.teacher_code asc";
		List<Sub4DTO> list = new ArrayList<Sub4DTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub4DTO dto = new Sub4DTO();
				dto.setTeacher_code(rs.getString(1));
				dto.setClass_name(rs.getString(2));
				dto.setTeacher_name(rs.getString(3));
				dto.setTotal(rs.getInt(4));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub4() Exception!!!");
		} finally {
			dbClose();
		}
		
		return list;
	}//selectSub4()
	
	//수강신청입력(sub2.jsp)
	public void insertSub2(Sub2DTO dto) {
		conn = getConn();
		String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getResist_month());
			ps.setString(2, dto.getC_no());
			ps.setString(3, dto.getClass_area());
			ps.setInt(4, dto.getTuition());
			ps.setString(5, dto.getClass_name());
			ps.executeUpdate(); // insert, delete, update ▶ ps.executeUpdate(); //select ▶ ps.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertSub2() Exception!!!");
		}finally {
			dbClose();
		}
	}//insertSub2()

	//강사조회 삭제(sub1.jsp)
	public void deleteSub1(String teacher_code) {
		conn = getConn();
		String sql = "delete from tbl_teacher_202201 where teacher_code = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, teacher_code);
			ps.executeUpdate();
			//System.out.println("삭제");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteSub1() Exception!!!");
		} finally {
			dbClose();
		}
	}//deleteSub1()

	//수정할 강사코드 조회 (sub1.jsp)
	public Sub1DTO selectOneSub1(String teacher_code) {
		conn = getConn();
		String sql = "select * from tbl_teacher_202201 where teacher_code =?";
		Sub1DTO dto = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, teacher_code);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new Sub1DTO();
				dto.setTeacher_code(rs.getString(1)); // dto.setTeacher_code(rs.getString("teacher_code"));
				dto.setTeacher_name(rs.getString(2));
				dto.setClass_name(rs.getString(3));
				dto.setClass_price(rs.getInt(4));
				dto.setTeach_resist_date(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOneSub1() Exception!!!");
		}finally {
			dbClose();
		}
		
		return dto;
	}//selectOneSub1()
} //class
