package bingo.modules.securityConsole.redpackge;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

@Table(name="hbdx_hbc")
public class RedPool extends BaseObject{
	
	@UUID
	private String hbcID;//红包池ID主键
	private Integer hbnumber;//红包个数
	private Double everyoneTotal;//单个红包金额
	private Double aggreate;//红包总额
	private String hblb;//红包分类（0-普通红包  1-群红包）
	private String notes1;//备注
	private String notes2;//备注
	private String notes3;
	
	public String getNotes3() {
		return notes3;
	}
	public void setNotes3(String notes3) {
		this.notes3 = notes3;
	}
	public String getNotes2() {
		return notes2;
	}
	public void setNotes2(String notes2) {
		this.notes2 = notes2;
	}
	public String getHbcID() {
		return hbcID;
	}
	public void setHbcID(String hbcID) {
		this.hbcID = hbcID;
	}
	public Integer getHbnumber() {
		return hbnumber;
	}
	public void setHbnumber(Integer hbnumber) {
		this.hbnumber = hbnumber;
	}
	public Double getEveryoneTotal() {
		return everyoneTotal;
	}
	public void setEveryoneTotal(Double everyoneTotal) {
		this.everyoneTotal = everyoneTotal;
	}
	
	public Double getAggreate() {
		return aggreate;
	}
	public void setAggreate(Double aggreate) {
		this.aggreate = aggreate;
	}
	
	public String getHblb() {
		return hblb;
	}
	public void setHblb(String hblb) {
		this.hblb = hblb;
	}
	public String getNotes1() {
		return notes1;
	}
	public void setNotes1(String notes1) {
		this.notes1 = notes1;
	}
    
	
}
