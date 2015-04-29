package bingo.modules.securityConsole.yhdl;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;
@Table(name="yhdx_dl")
public class YhdxDL extends BaseObject{
	
	@UUID
	private String dldxbh;//代理对象编号
	
	private String yhdxdhfk;//用户对象代号外键
	
	private String tgslj;//推广式连接
	
	private String dljhm;//激活码
	
	private String statues;//状态
	
	private String notes1;//备用字段
	
	private String notes2;//备用字段
	
	private String notes3;//备用字段

	
	public String getStatues() {
		return statues;
	}

	public void setStatues(String statues) {
		this.statues = statues;
	}

	public String getDldxbh() {
		return dldxbh;
	}

	public void setDldxbh(String dldxbh) {
		this.dldxbh = dldxbh;
	}

	public String getYhdxdhfk() {
		return yhdxdhfk;
	}

	public void setYhdxdhfk(String yhdxdhfk) {
		this.yhdxdhfk = yhdxdhfk;
	}

	public String getDljhm() {
		return dljhm;
	}

	public void setDljhm(String dljhm) {
		this.dljhm = dljhm;
	}

	public String getTgslj() {
		return tgslj;
	}

	public void setTgslj(String tgslj) {
		this.tgslj = tgslj;
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

	public String getNotes3() {
		return notes3;
	}

	public void setNotes3(String notes3) {
		this.notes3 = notes3;
	}

	
}
