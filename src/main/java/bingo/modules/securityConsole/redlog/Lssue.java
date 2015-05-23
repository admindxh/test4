package bingo.modules.securityConsole.redlog;

import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

/**
 * 发出去的红包
 * @author Administrator
 *
 */
@Table(name="hb_lssue")
public class Lssue {
	
	@UUID
	private String id;//主键|id
	private String userid;//用户id
	private String fromname;//红包来源名称
	private String lssuetime;//时间
	private Double monney;//金额
	public Lssue() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFromname() {
		return fromname;
	}
	public void setFromname(String fromname) {
		this.fromname = fromname;
	}
	public String getLssuetime() {
		return lssuetime;
	}
	public void setLssuetime(String lssuetime) {
		this.lssuetime = lssuetime;
	}
	public Double getMonney() {
		return monney;
	}
	public void setMonney(Double monney2) {
		this.monney = monney2;
	}
    
}
