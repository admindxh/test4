package bingo.modules.securityConsole.redpackge;

import java.util.Date;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;
/**
 * 
 * 红包对象
 * @author Administrator
 */
@Table(name="hbdx_hb")
public class RedPackge extends BaseObject{
	
	@UUID
	private String hbdxdh;//红包对象编号
	private String hbbdxdhfk;//红包币对象外键
	private String yhdhfk; //用户代号外键
	private String hbcfk;//红包池外键
	private Double hbjj;//红包基金
	private String zhstatus;//账户状态
	private Double crje;//存入金额
	private Double zhye ;//账户余额
	private Double syje;//收益金额
	private Double hbzcje;//红包支出金额
	private Date czrq;//充值日期
	private Date qxrq;//起息日期
	private Date dqrq;//到期日期
	private String hblb;//红包类别（主要用于定义普通红包和群红包）
	private Integer hbgs;//红包个数
	
	public String getHbcfk() {
		return hbcfk;
	}
	public void setHbcfk(String hbcfk) {
		this.hbcfk = hbcfk;
	}
	public String getHbdxdh() {
		return hbdxdh;
	}
	public void setHbdxdh(String hbdxdh) {
		this.hbdxdh = hbdxdh;
	}
	public String getHbbdxdhfk() {
		return hbbdxdhfk;
	}
	public void setHbbdxdhfk(String hbbdxdhfk) {
		this.hbbdxdhfk = hbbdxdhfk;
	}
	public String getYhdhfk() {
		return yhdhfk;
	}
	public void setYhdhfk(String yhdhfk) {
		this.yhdhfk = yhdhfk;
	}
	public Double getHbjj() {
		return hbjj;
	}
	public void setHbjj(Double hbjj) {
		this.hbjj = hbjj;
	}
	public String getZhstatus() {
		return zhstatus;
	}
	public void setZhstatus(String zhstatus) {
		this.zhstatus = zhstatus;
	}
	public Double getCrje() {
		return crje;
	}
	public void setCrje(Double crje) {
		this.crje = crje;
	}
	public Double getZhye() {
		return zhye;
	}
	public void setZhye(Double zhye) {
		this.zhye = zhye;
	}
	public Double getSyje() {
		return syje;
	}
	public void setSyje(Double syje) {
		this.syje = syje;
	}
	public Double getHbzcje() {
		return hbzcje;
	}
	public void setHbzcje(Double hbzcje) {
		this.hbzcje = hbzcje;
	}
	public Date getCzrq() {
		return czrq;
	}
	public void setCzrq(Date czrq) {
		this.czrq = czrq;
	}
	public Date getQxrq() {
		return qxrq;
	}
	public void setQxrq(Date qxrq) {
		this.qxrq = qxrq;
	}
	public Date getDqrq() {
		return dqrq;
	}
	public void setDqrq(Date dqrq) {
		this.dqrq = dqrq;
	}
	public String getHblb() {
		return hblb;
	}
	public void setHblb(String hblb) {
		this.hblb = hblb;
	}
	public Integer getHbgs() {
		return hbgs;
	}
	public void setHbgs(Integer hbgs) {
		this.hbgs = hbgs;
	}
	
}
