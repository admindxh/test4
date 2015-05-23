package bingo.modules.securityConsole.proble;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

import bingo.common.core.utils.StringUtils;

@Controller
public class HbprobleController {

	private HbbprobleService hbbprobleService;

	public HbbprobleService getHbbprobleService() {
		return hbbprobleService;
	}

	public void setHbbprobleService(HbbprobleService hbbprobleService) {
		this.hbbprobleService = hbbprobleService;
	}
	
	public void doSerch(String id){
		Result.setAttribute("title", "常见问题分类");
		if(StringUtils.isEmpty(id)){
			Result.forward("/modules/hb_personnal/edit_sec_proble.jsp");
		}else {
			Result.setAttribute("hbproble", hbbprobleService.getHbprobleId(id));
			Result.forward("/modules/hb_personnal/edit_sec_proble.jsp");
		}
		
	}
	
	/**
	 *  String txwt;//提现问题
	 *  String jbjs;//基本介绍
		
		 String lxfs;//联系方式
		
		 String hbbresult;//红包币的未来
		
		 String notes;//如何发红包/红包币
		
		 String notes1;//如何收红包/红包币
	 */
	public void doListBy(){
		 String id="3e121b700c094ffe88f0431fb5b7732f";
		// String czff=hbbprobleService.getczff(id);//操作方法
		 String czff="了时间快点发来看数据的分类考试了东风科技";
		 Result.setAttribute("czff", czff);
	     Result.forward("/web/red/faq2.jsp");	 
	}
}
