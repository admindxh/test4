package bingo.modules.securityConsole.proble;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;
/**
 * 常见问题分类
 * @author Administrator
 *
 */
@Table(name="hbdx_proble")
public class Hbproble extends BaseObject{

	@UUID
	private String id;
	
	private String jbjs;//基本介绍
	
	private String czff;//操作方法
	
	private String txwt;//提现问题
	
	private String lxfs;//联系方式
	
	private String hbbresult;//红包币的未来
	
	private String notes;//如何发红包/红包币
	
	private String notes1;//如何收红包/红包币

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJbjs() {
		return jbjs;
	}

	public void setJbjs(String jbjs) {
		this.jbjs = jbjs;
	}

	public String getCzff() {
		return czff;
	}

	public void setCzff(String czff) {
		this.czff = czff;
	}

	public String getTxwt() {
		return txwt;
	}

	public void setTxwt(String txwt) {
		this.txwt = txwt;
	}

	public String getLxfs() {
		return lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getHbbresult() {
		return hbbresult;
	}

	public void setHbbresult(String hbbresult) {
		this.hbbresult = hbbresult;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getNotes1() {
		return notes1;
	}

	public void setNotes1(String notes1) {
		this.notes1 = notes1;
	}
    

}
