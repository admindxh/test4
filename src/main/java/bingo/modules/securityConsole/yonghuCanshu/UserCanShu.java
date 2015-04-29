package bingo.modules.securityConsole.yonghuCanshu;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

@Table(name="csb_yh")
public class UserCanShu extends BaseObject{
	@UUID
	private String yhbh;//用户编号
	
	private String yhjb;//用户级别
	
	private String tcbl;//提成比例
	
	private String fzrs;//发展人数
	
	private String status;//状态
	
	private String ztms;//状态描述
	
	private String notes1;//备用字段
	
	private String notes2;//备用字段

	public String getYhbh() {
		return yhbh;
	}

	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}

	public String getYhjb() {
		return yhjb;
	}

	public void setYhjb(String yhjb) {
		this.yhjb = yhjb;
	}

	public String getTcbl() {
		return tcbl;
	}

	public void setTcbl(String tcbl) {
		this.tcbl = tcbl;
	}

	public String getFzrs() {
		return fzrs;
	}

	public void setFzrs(String fzrs) {
		this.fzrs = fzrs;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getZtms() {
		return ztms;
	}

	public void setZtms(String ztms) {
		this.ztms = ztms;
	}

	public String getNotes1() {
		return notes1;
	}

	public void setNotes1(String notes1) {
		this.notes1 = notes1;
	}

	public String getNotes2() {
		return notes2;
	}

	public void setNotes2(String notes2) {
		this.notes2 = notes2;
	}

}
