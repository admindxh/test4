package bingo.modules.securityConsole.symx;

import java.util.Date;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

@Table(name="csb_ll")
public class CanShuLL extends BaseObject{
	@UUID
	private String llbh;//利率编号
	
    private String llfl;//利率分类
   
    private Date szrq;//设置日期
    
    private Double llbl;//利率比例
    
    private Integer activate;//是否启用
    
    private String notes1;//备用字段1
    private String notes2;//备用字段2
    private String notes3;//备用字段3

    
	public Integer getActivate() {
		return activate;
	}

	public void setActivate(Integer activate) {
		this.activate = activate;
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

	public String getLlbh() {
		return llbh;
	}

	public void setLlbh(String llbh) {
		this.llbh = llbh;
	}

	public String getLlfl() {
		return llfl;
	}

	public void setLlfl(String llfl) {
		this.llfl = llfl;
	}

	public Date getSzrq() {
		return szrq;
	}

	public void setSzrq(Date szrq) {
		this.szrq = szrq;
	}

	public Double getLlbl() {
		return llbl;
	}

	public void setLlbl(Double llbl) {
		this.llbl = llbl;
	}
    
    
}
