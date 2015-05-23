package bingo.modules.securityConsole.redlog;

import bingo.dao.orm.annotations.Table;
import bingo.dao.orm.annotations.UUID;

/**
 * @author 收到的红包实体类
 * @author Administrator
 * 
 */
@Table(name="hb_received")
public class Received {

	@UUID
	private String id;//主键|id
	private String userid;//用户id
	private String fromname;//红包来源名称
	private String receivedtime;//时间
	private Double monney;//金额
	
	public Received() {
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

	public String getReceivedtime() {
		return receivedtime;
	}

	public void setReceivedtime(String receivedtime) {
		this.receivedtime = receivedtime;
	}

	public Double getMonney() {
		return monney;
	}

	public void setMonney(Double hbze) {
		this.monney = hbze;
	}
    
}
