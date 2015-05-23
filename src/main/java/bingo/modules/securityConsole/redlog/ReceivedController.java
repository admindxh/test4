package bingo.modules.securityConsole.redlog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.common.core.utils.StringUtils;
import bingo.ui.grid.utils.json.JSONObject;
import sun.print.resources.serviceui;

/**
 * 收到的红包控制类
 * @author Administrator
 *
 */
@Controller
public class ReceivedController{

	private ReceivedService receivedService;
	
	public ReceivedService getReceivedService() {
		return receivedService;
	}

	public void setReceivedService(ReceivedService receivedService) {
		this.receivedService = receivedService;
	}

	public ReceivedController() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 我收到的红包
	 * @param id
	 * @return
	 */
	public void receiveMyred(String id){
		Received received=new Received();
		Result.setAttribute("title", "收到的红包");
		List<Received> list=receivedService.getRecieved(id);
		for(int i=0;i<list.size();i++){
			String ids=list.get(i).getId();
			received=receivedService.getReceiveBy(ids);	
		}
		Result.setAttribute("list", list);
		Result.forward("/web/red/myRecieve.jsp");
	}
	
	/**
	 * 我发的红包
	 * 返回一个list
	 * @param yhdxdh
	 */
	public void mysend(String yhdxdh){
		
		Result.setAttribute("title", "我发的红包");
		Lssue lssue=new Lssue();
		if(StringUtils.isNotEmpty(yhdxdh)){
			List<Lssue> list=receivedService.getLssueBy(yhdxdh);//返回发出红包对象
			for(int i=0;i<list.size();i++){
				String id=list.get(i).getId();
				lssue=receivedService.getMysendred(id);
			}	
			Result.setAttribute("list", list);
			Result.forward("/web/red/mySend.jsp");
		}
	}
}
