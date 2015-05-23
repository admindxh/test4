package bingo.modules.securityConsole.redlog;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.modules.securityConsole.yhdl.HBDXuser;
/**
 * 收到的红包service
 * @author Administrator
 *
 */
@Service
public class ReceivedService extends BaseService{

	/**
	 * 保存收到的红包
	 * @param received
	 * @param hbdXuser
	 */
	public void dosave(Received received,HBDXuser hbdXuser){
		String id=received.getId();
		SimpleDateFormat dfc = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//设置日期格式
		String nowtime=dfc.format(new Date());// new Date()为获取当前系统时间
		received.setReceivedtime(nowtime);
		String yhdxdh=hbdXuser.getYhdxdh();
		received.setUserid(yhdxdh);
		String hblx="中国联通";
		received.setFromname(hblx);
		Double hbze=hbdXuser.getAggreatMount();
		received.setMonney(hbze);
		if(StringUtils.isEmpty(received.getId())){
			//dao.insert(received);
		}else {
			dao.update(received);
		}
	}
	/**
	 * 返回收到红包对象
	 * @param id
	 * @return
	 */
	public Received getReceiveBy(String id) {
		// TODO Auto-generated method stub
		Received received=new Received();
		received=dao.select(Received.class, id);
		return received;	
	}
	
	/**
	 * 返回用户收到红包对象
	 * @param yhdxdh
	 * @return
	 */
	public List<Received> getRecieved(String yhdxdh){
		
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userid", yhdxdh);
		List<Received> list=dao.queryForList(Received.class, "select.recieve", params);
		Iterator<Received> it=list.iterator();
		for(int i=0;i<list.size();i++){
			String id=list.get(i).getId();
			}
		return list;
		
	}
	/**
	 * 查询返回发出红包对象
	 * @param yhdxdh
	 * @return
	 */
	public List<Lssue> getLssueBy(String yhdxdh) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userid", yhdxdh);
		List<Lssue> list=dao.queryForList(Lssue.class, "select.mysend", params);
		Iterator<Lssue> it=list.iterator();
		for(int i=0;i<list.size();i++){
			String id=list.get(i).getId();
			System.out.println(id);	
			}
		return list;
	}
	
	/**
	 * 查询返回发出红包对象
	 * @param id
	 * @return
	 */
	public Lssue getMysendred(String id) {
		// TODO Auto-generated method stub
		Lssue lssue=new Lssue();
		lssue=dao.select(Lssue.class, id);
		return lssue;	
	}
}
