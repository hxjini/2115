package exam;

public class Sub3DTO {
	//학번, 성명, 교과목, 교과목코드, 담당교수, 중간, 기말, 출석, 레포트, 기타, 평균, 총점, 학점
	private String stuid, sname, subname, subcode, proname, grade;
	private int midscore, finalscore, attend, report, etc, avg;
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
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubcode() {
		return subcode;
	}
	public void setSubcode(String subcode) {
		this.subcode = subcode;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
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
	public int getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	
	
	
}
