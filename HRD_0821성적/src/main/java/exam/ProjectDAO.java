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
		String url ="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "system";
		String password ="1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 접속 완료");
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}
		
	}//dbClose
	
	//학생정보현황 조회
	public List<Sub1DTO> selectSub1() {
		conn = getConn();
		
		String sql = "select * from tbl_student_202210 order by stuid asc";
		List<Sub1DTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub1DTO dto = new Sub1DTO();
				dto.setStuid(rs.getString(1));
				dto.setSname(rs.getString(2));
				
				String jumin = rs.getString(4);
				jumin = jumin.substring(0, 6) + "-" + jumin.substring(6);
				dto.setJumin(jumin);
				
				dto.setDeptname(rs.getString(3));
				
				String gender = jumin.substring(7, 8);
				if(gender.equals("3")) gender ="남자";
				if(gender.equals("4")) gender ="여자";
				dto.setGender(gender);
				
				dto.setPhone(rs.getString(5));
				dto.setEmail(rs.getString(6));
				
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
	
	//성적입력(sub2.jsp)
	public void insertSub2(Sub2DTO dto) {
		conn = getConn();
		
		String sql = "insert into tbl_score_202210 values (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getStuid());
			ps.setString(2, dto.getSubcode());
			ps.setInt(3, dto.getMidscore());
			ps.setInt(4, dto.getFinalscore());
			ps.setInt(5, dto.getAttend());
			ps.setInt(6, dto.getReport());
			ps.setInt(7, dto.getEtc());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertSub2() Exception!!!");
		} finally {
			dbClose();
		}
	}//insertSub2()
	
	//성적현황 조회(sub3.jsp)
	public List<Sub3DTO> selectSub3() {
		conn = getConn();
		
		String sql = "select student.stuid, student.sname, ";
		sql += "subject.subname, subject.subcode, subject.proname, ";
		sql += "score.midscore, score.finalscore, score.attend, score.report, score.etc ";
		sql += "from tbl_student_202210 student, tbl_score_202210 score, tbl_subject_202210 subject ";
		sql += "where student.stuid = score.stuid and score.subcode = subject.subcode ";
		sql += "order by student.sname asc";
		
		List<Sub3DTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub3DTO dto = new Sub3DTO();
				dto.setStuid(rs.getString(1));
				dto.setSname(rs.getString(2));
				dto.setSubname(rs.getString(3));
				dto.setSubcode(rs.getString(4));
				dto.setProname(rs.getString(5));
				
				int midscore = rs.getInt(6);
				int finalscore = rs.getInt(7);
				int attend = rs.getInt(8);
				int report = rs.getInt(9);
				int etc = rs.getInt(10);
				
				dto.setMidscore(midscore);
				dto.setFinalscore(finalscore);
				dto.setAttend(attend);
				dto.setReport(report);
				dto.setEtc(etc);
				
				int avg = (midscore + finalscore + attend + report + etc) / 5;
				dto.setAvg(avg);
				
				double total = midscore * 0.3 + finalscore * 0.3 + attend * 0.2 + report * 0.1 + etc * 0.1;
				dto.setTotal(total);
				
				String grade = "";
				if(total >= 95) grade = "A+";
				else if (total >= 90) grade = "A";
				else if (total >= 85) grade = "B+";
				else if (total >= 80) grade = "B";
				else if (total >= 75) grade = "C+";
				else if (total >= 70) grade = "C";
				else if (total >= 65) grade = "D+";
				else if (total >= 60) grade = "D";
				else grade = "F";
				dto.setGrade(grade);
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub3() Exception!!!");
		}finally {
			dbClose();
		}
		
		return list;
	}//selectSub3()
	
	//과목별 성적조회(sub4.jsp)
	public List<Sub4DTO> selectSub4(String searchSubcode) {
		conn = getConn();
		String sql = "select student.stuid, student.sname, student.deptname, ";
		sql += "subject.subname, ";
		sql += "score.midscore, score.finalscore, score.attend, score.report, score.etc ";
		sql += "from tbl_student_202210 student, tbl_score_202210 score, tbl_subject_202210 subject ";
		sql += "where student.stuid = score.stuid and score.subcode = subject.subcode and subject.subcode = ? ";
		sql += "order by student.stuid asc";
		
		List<Sub4DTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, searchSubcode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Sub4DTO dto = new Sub4DTO();
				dto.setStuid(rs.getString(1));
				dto.setSname(rs.getString(2));
				dto.setDeptname(rs.getString(3));
				dto.setSubname(rs.getString(4));
				
				int midscore = rs.getInt(5);
				int finalscore = rs.getInt(6);
				int attend = rs.getInt(7);
				int report = rs.getInt(8);
				int etc = rs.getInt(9);
				
				dto.setMidscore(midscore);
				dto.setFinalscore(finalscore);
				dto.setAttend(attend);
				dto.setReport(report);
				dto.setEtc(etc);
				
				double total = (midscore * 0.3 + finalscore * 0.3 + attend * 0.2 + report * 0.1 + etc * 0.1);
				dto.setTotal(total);
				
				String grade = "";
				if(total >= 95) grade = "A+";
				else if(total >= 90) grade = "A";
				else if(total >= 85) grade = "B+";
				else if(total >= 80) grade = "B";
				else if(total >= 75) grade = "C+";
				else if(total >= 70) grade = "C";
				else if(total >= 65) grade = "D+";
				else if(total >= 60) grade = "D";
				else grade = "F";
				
				dto.setGrade(grade);
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSub4() Exception!!!");
		}finally {
			dbClose();
		}
		
		return list;
	}//selectSub4()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class

