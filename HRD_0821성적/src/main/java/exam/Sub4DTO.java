package exam;

public class Sub4DTO {
	//학번, 성명, 학과, 과목, 중간, 기말, 출석, 레포트, 기타, 총점, 학점
	private String stuid, sname, deptname, subname, grade;
	private int midscore, finalscore, attend, report, etc;
	private double total;
	
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getMidscore() {
		return midscore;
	}
	public void setMidscore(int midscore) {
		this.midscore = midscore;
	}
	public int getFinalscore() {
		return finalscore;
	}
	public void setFinalscore(int finalscore) {
		this.finalscore = finalscore;
	}
	public int getAttend() {
		return attend;
	}
	public void setAttend(int attend) {
		this.attend = attend;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	
	
}
