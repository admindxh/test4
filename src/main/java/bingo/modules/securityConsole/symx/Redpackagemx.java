package bingo.modules.securityConsole.symx;

import java.util.Date;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
@Table(name="hbdx_symx")
public class Redpackagemx extends BaseObject{
	
	private String symxdxdh;
	
	private Double ketimoney;//可提现金额
	
	private String yhdxdhfk;//用户对象代号外键
	
	private String llbhfk;//利率编号外键
	
	private Double withdrawal;//收益总金额
	
	private Double redcoins;//红包币
	
	private Double entrypoins;//报单积分
	
	private Date qsrq;//起始日期
	
	private Date jsrq;//结束日期
	
	private Double syje ;//收益金额
	
	private Double syll;//收益利率
	
	private String notes1;//备用字段
	
	private String notes2;//备用字段
	
	private Integer notes3;//自增变量
	
	
	public Double getKetimoney() {
		return ketimoney;
	}

	public void setKetimoney(Double ketimoney) {
		this.ketimoney = ketimoney;
	}

	public Double getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(Double withdrawal) {
		this.withdrawal = withdrawal;
	}

	public Double getRedcoins() {
		return redcoins;
	}

	public void setRedcoins(Double redcoins) {
		this.redcoins = redcoins;
	}

	public Double getEntrypoins() {
		return entrypoins;
	}

	public void setEntrypoins(Double entrypoins) {
		this.entrypoins = entrypoins;
	}

	public String getLlbhfk() {
		return llbhfk;
	}

	public void setLlbhfk(String llbhfk) {
		this.llbhfk = llbhfk;
	}

	public Integer getNotes3() {
		return notes3;
	}

	public void setNotes3(Integer notes3) {
		this.notes3 = notes3;
	}

	public String getSymxdxdh() {
		return symxdxdh;
	}

	public void setSymxdxdh(String symxdxdh) {
		this.symxdxdh = symxdxdh;
	}
	

	public String getYhdxdhfk() {
		return yhdxdhfk;
	}

	public void setYhdxdhfk(String yhdxdhfk) {
		this.yhdxdhfk = yhdxdhfk;
	}

	public Date getQsrq() {
		return qsrq;
	}

	public void setQsrq(Date qsrq) {
		this.qsrq = qsrq;
	}

	public Date getJsrq() {
		return jsrq;
	}

	public void setJsrq(Date jsrq) {
		this.jsrq = jsrq;
	}

	public Double getSyje() {
		return syje;
	}

	public void setSyje(Double syje) {
		this.syje = syje;
	}

	public Double getSyll() {
		return syll;
	}

	public void setSyll(Double syll) {
		this.syll = syll;
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
