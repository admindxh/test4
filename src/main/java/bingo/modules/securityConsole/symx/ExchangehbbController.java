package bingo.modules.securityConsole.symx;

import java.util.HashMap;
import java.util.Map;

import javax.swing.JOptionPane;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

import sun.security.util.Password;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.common.Constants;
import bingo.modules.securityConsole.redpackge.RedPackgeController;
import bingo.modules.securityConsole.yhdl.HBDXuser;

@Controller
public class ExchangehbbController {
	
	private ExchangehbbService exchangehbbService;

	public ExchangehbbService getExchangehbbService() {
		return exchangehbbService;
	}

	public void setExchangehbbService(ExchangehbbService exchangehbbService) {
		this.exchangehbbService = exchangehbbService;
	}
	
	public void doExchangehbb(String yhdxdh){
		
		Result.setAttribute("title", "普通红包");
	//	Result.setAttribute("hbdXuser", exchangehbbService.getUserById(ID));
		Result.setAttribute("hbdXuser", exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/modules/hongbao/edit_sec_putong.jsp");	
	}
	
	public void doediteExchange(String yhdxdh){
		Result.setAttribute("title", "修改参数信息");
		Result.setAttribute("hbdXuser",exchangehbbService.getYhdlById(yhdxdh));
		CanShuLL ll=new CanShuLL();
		Double llfl=ll.getLlbl();
		double ss=exchangehbbService.getllflById(llfl);
		
		String titleString="恭喜发财,大吉大利";
		
		Result.setAttribute("titleString", titleString);
		Result.setAttribute("dhje",ss);
		Result.forward("/modules/hb_personnal/edit_sec_exchange.jsp");
	}

	/**
	 * 用户注册
	 * @param yhdxdh
	 */
	public void createuser(String yhdxdh){
		
		String name=exchangehbbService.getUserphone(yhdxdh);
		System.out.println(name);
		if(name.equals("0")){
			name="暂无介绍人";
		}
		Result.setAttribute("title", "创建下线用户");
		Result.setAttribute("name",name );
		Result.setAttribute("hbdxuser",exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/modules/hb_personnal/edit_sec_users.jsp");
	}
	
	public void deltejijin(String yhdxdh){
		Result.setAttribute("title", "提取红包基金");
		double number=exchangehbbService.geteveryday(yhdxdh)*0.3;
		String titleString="恭喜发财,大吉大利";
		double sum=exchangehbbService.getRedpackage(yhdxdh);
		if(sum>0){
			Result.setAttribute("number", number);
			Result.setAttribute("sum", sum);
			Result.setAttribute("titleString", titleString);
			Result.setAttribute("hbdxuser", exchangehbbService.getYhdlById(yhdxdh));
			Result.forward("/modules/hb_personnal/edit_sec_deltejijin.jsp");
		}else {
			JOptionPane.showMessageDialog(null, "条件不符合提取要求，请明天再来");
		}
		
	}
	
	public void delteshouyi(String yhdxdh){
		Result.setAttribute("title", "提取收益");
		double number=exchangehbbService.geteveryday(yhdxdh)*0.7;
		String titleString="恭喜发财,大吉大利";
		double sum=exchangehbbService.getdailisy(yhdxdh);
		if(sum>=500){
			Result.setAttribute("number", number);
			Result.setAttribute("sum", sum);
			Result.setAttribute("titleString", titleString);
			Result.setAttribute("hbdxuser", exchangehbbService.getYhdlById(yhdxdh));
			Result.forward("/modules/hb_personnal/edit_sec_proceeds.jsp");
			
		}else {
			JOptionPane.showMessageDialog(null, "收益金额不足500，请明天再来");
			
		}
		
		
	}
	
	public void dodailiMoney(String yhdxdh) {
		
		Result.setAttribute("title", "代理商提取收益");
		double number=exchangehbbService.geteveryday(yhdxdh)*0.7;
		String titleString="恭喜发财,大吉大利";
		double sum=exchangehbbService.getdailisy(yhdxdh);
		if(sum>=500){
			Result.setAttribute("number", number);
			Result.setAttribute("sum", sum);
			Result.setAttribute("titleString", titleString);
			Result.setAttribute("hbdxuser", exchangehbbService.getYhdlById(yhdxdh));
			Result.forward("/modules/dailiuser/edite_sec_dailiuser.jsp");
		}else {
			JOptionPane.showMessageDialog(null, "收益金额不足500，请明天再来");
		}
	}
	
}
