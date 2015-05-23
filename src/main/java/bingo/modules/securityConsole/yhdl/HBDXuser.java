package bingo.modules.securityConsole.yhdl;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

@Table(name="hbdx_user")
public class HBDXuser extends BaseObject{
	
	@UUID
	private String yhdxdh;//用户对象代号(登录用户)
	
	private String parentID;//父级ID
	
	private String ID;//用户id
	
	private String dldxbhfk;//代理对象外键
	
	private String hbdxdhfk;//红包对象代号
	
    private String sydxdhfk;//收益明细对象代号
    
    private String yhsf;//用户身份
    
    private String yhjb;//用户级别
    
    private Double crje;//存入金额
    
    private int hbb;//红包币
    
    private String userphnoe;//用户电话
    
    private String address;//用户地址
    
    private String status;//用户状态
    
    private String userjhm;//激活码
    
    private String email;//邮箱
    
    private Integer hbgs;//红包个数
    
    private Double everyoneTotal;//单个红包金额
    
    private Double aggreatMount;//红包总额
    
    private String username;//用户名
    
    private String password;//密码
    
    private String notes1;//备用字段
    
    private String notes2;//备用字段

    

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getDldxbhfk() {
		return dldxbhfk;
	}

	public void setDldxbhfk(String dldxbhfk) {
		this.dldxbhfk = dldxbhfk;
	}

	public int getHbb() {
		return hbb;
	}

	public void setHbb(int hbb) {
		this.hbb = hbb;
	}

	public Double getAggreatMount() {
		return aggreatMount;
	}

	public void setAggreatMount(Double aggreatMount) {
		this.aggreatMount = aggreatMount;
	}

	public Integer getHbgs() {
		return hbgs;
	}

	public void setHbgs(Integer hbgs) {
		this.hbgs = hbgs;
	}

	public Double getEveryoneTotal() {
		return everyoneTotal;
	}

	public void setEveryoneTotal(Double everyoneTotal) {
		this.everyoneTotal = everyoneTotal;
	}

	public String getYhdxdh() {
		return yhdxdh;
	}

	public void setYhdxdh(String yhdxdh) {
		this.yhdxdh = yhdxdh;
	}

	public String getParentID() {
		return parentID;
	}

	public void setParentID(String parentID) {
		this.parentID = parentID;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHbdxdhfk() {
		return hbdxdhfk;
	}

	public void setHbdxdhfk(String hbdxdhfk) {
		this.hbdxdhfk = hbdxdhfk;
	}

	public String getSydxdhfk() {
		return sydxdhfk;
	}

	public void setSydxdhfk(String sydxdhfk) {
		this.sydxdhfk = sydxdhfk;
	}

	public String getYhsf() {
		return yhsf;
	}

	public void setYhsf(String yhsf) {
		this.yhsf = yhsf;
	}

	public String getYhjb() {
		return yhjb;
	}

	public void setYhjb(String yhjb) {
		this.yhjb = yhjb;
	}

	public Double getCrje() {
		return crje;
	}

	public void setCrje(Double crje) {
		this.crje = crje;
	}

	public String getUserphnoe() {
		return userphnoe;
	}

	public void setUserphnoe(String userphnoe) {
		this.userphnoe = userphnoe;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserjhm() {
		return userjhm;
	}

	public void setUserjhm(String userjhm) {
		this.userjhm = userjhm;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
}
