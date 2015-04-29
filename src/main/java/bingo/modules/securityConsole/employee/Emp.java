package bingo.modules.securityConsole.employee;

import java.util.Date;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Column;
import bingo.dao.orm.annotations.Sequence;
import bingo.dao.orm.annotations.UUID;

public class Emp extends BaseObject {
	@UUID
    @Sequence(name="s_emp")	
	private String empno;//编号
	private String ename;//员工姓名
	private String job;//职位
	private Integer mgr;
	private Date hiredate;//入职时间
	private Double sal;//薪水
	private Double comm;
	private Integer deptno;//部门编号
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Integer getMgr() {
		return mgr;
	}
	public void setMgr(Integer mgr) {
		this.mgr = mgr;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public Double getSal() {
		return sal;
	}
	public void setSal(Double sal) {
		this.sal = sal;
	}
	public Double getComm() {
		return comm;
	}
	public void setComm(Double comm) {
		this.comm = comm;
	}
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	
}
