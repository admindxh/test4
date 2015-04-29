package bingo.modules.securityConsole.employee;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.UUID;

public class Dept extends BaseObject {

	@UUID
	private String deptno;
	private String dname;
	private String loc;
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
