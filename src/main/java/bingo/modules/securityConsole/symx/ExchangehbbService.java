package bingo.modules.securityConsole.symx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.lightframework.mvc.HTTP.Session;
import org.lightframework.mvc.Result;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;
import bingo.modules.securityConsole.function.SecPermission;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.user.SecUser;
import bingo.modules.securityConsole.yhdl.HBDXuser;
import bingo.modules.securityConsole.yonghuCanshu.UserCanShu;
import bingo.security.SecurityContext;
/**
 * 用户团队提成明细
 * @author Administrator
 * 开发者：天狼孤星
 */
@Service
public class ExchangehbbService extends BaseService{

	private HBDXuser hbdXuser;
	//日志service
	private SecLogService secLogService;

	/**
	 * @return the secLogService
	 */
	public SecLogService getSecLogService() {
		return secLogService;
	}

	/**
	 * @param secLogService the secLogService to set
	 */
	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}

	/**
	 * 根据id查用户名
	 * time:2015/5/23
	 * @param yhdxdh
	 * @return
	 */
	public String getusername(String yhdxdh){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		String usernameString=dao.queryForString("select.id.username", params);
		return usernameString;
	}
	/**
	 * 红包币转账
	 * time:2015/5/23
	 * @param hbdXuser
	 */
	public void savehbbzz(HBDXuser hbdXuser){
		String id=hbdXuser.getYhdxdh();
		int hbb=hbdXuser.getHbb();
		String phone=hbdXuser.getUserphnoe();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userphnoe", phone);
		if(StringUtils.isNotEmpty(phone)){
			Integer number=dao.queryForInt("select.username.number1", params);
			if (number>0&&number<2){
				String yhid=dao.queryForString("select.username.number2", params);
				params.put("yhdxdh", yhid);
				int hbb1=dao.queryForInt("list.hbb", params);
				hbb1=hbb1+hbb;
				params.put("hbb", hbb1);
				dao.update("update.hbb.test",params);
				params.put("yhdxdh", id);
				int hbb2=dao.queryForInt("list.hbb", params);
				hbb2=hbb2-hbb;
				params.put("hbb", hbb2);
				dao.update("update.hbb.test",params);
			}
		}
		
	}
	/**
	 * 根据id查询用户的红包币，并更新数据库
	 * time:2015/5/23
	 * @param id
	 * @param num
	 * @return
	 */
	public boolean getflager(HBDXuser hbdXuser){
		int number=0;
		String yhdxdh=hbdXuser.getYhdxdh();
		int num=hbdXuser.getHbb();
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			number=dao.queryForInt("list.hbb", params);
			number=number+num;
			params.put("hbb", number);
			Double aggreat=dao.queryForDouble("user.list.aggreatMount", params);
			params.put("aggreatMount", aggreat);
			dao.update("update.hbb",params);
			return true;
		}
		return false;
	}
	/**
	 * 根据用户电话号码查询用户id
	 * @param userphnoe
	 * @return
	 */
	public boolean validateUser(String userphnoe,String password){
		if(StringUtils.isEmpty(userphnoe)){
			return false;
		}else {
			String pass=dao.queryForString("select.password.userphnoe", userphnoe);
			if(StringUtils.isNotEmpty(pass)){
				if(pass.equals(password)){
					return true;
				}
			}
			return false;
		}
		
	}
	
	public String getUserphone(String yhdxdh){
		String name="0";
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		String parentId=dao.queryForString("select.prentid.id", params);
		if(StringUtils.isNotEmpty(parentId)){
			params.put("parentid", parentId);
			String phone=dao.queryForString("select.parentid.phone", params);
			System.out.println(phone);
			return phone;
		}else {
			return name;
		}
		
	}
	public double geteveryday(String yhdxdh){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		return dao.queryForDouble("select.everyday.hongli", params);
	}
	
	public void updatehbuser(Redpackgehbb redpackgehbb){
		CanShuLL ll=new CanShuLL();
		String llbh=ll.getLlbh();
		String hbdxdh=redpackgehbb.getHbdxdh();
		//Double crje=redpackgehbb.getCrje();
		float hbb=redpackgehbb.getHbb();
		if(StringUtils.isEmpty(hbdxdh)){
			
			String yhdhfk=redpackgehbb.getYhdhfk();
			String hbllfk=redpackgehbb.getHbllfk();
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("hbdxdh", hbdxdh);
			params.put("yhdhfk", yhdhfk);
			
			params.put("llbh", llbh);
			params.put("hbllfk", hbllfk);
			//查询红包币利率
			float lv=dao.queryForFloat("list.lilv", ll);
			float crje=redpackgehbb.getCrje();
			hbb=(crje*lv);
			params.put("hbb", hbb);
			params.put("lv", lv);
			dao.update("update.hb",params);
		}
	}
  
	/**
	 * 兑换红包币保存方法
	 * @param secUser
	 * @throws Exception 
	 */
	public void saveOrUpdate(HBDXuser hbdXuser) {
		String yhdxdh=hbdXuser.getYhdxdh();
		double agrent=hbdXuser.getAggreatMount();
		double hbb=hbdXuser.getHbb();
		if (StringUtils.isNotEmpty(hbdXuser.getYhdxdh())) {
			Map<String, Object> params=new HashMap<String, Object>();
			double totals=dao.queryForDouble("user.list.aggreatMount", hbdXuser);
			params.put("yhdxdh",yhdxdh);
			double hongbaobi=dao.queryForDouble("list.hbb", hbdXuser);
			boolean tota=true;
			do{
				if(agrent<=totals){
					totals=totals-agrent;
					System.out.println(totals);
					params.put("aggreatMount", totals);
				  hongbaobi=hongbaobi+hbb;
				  System.out.println(hongbaobi);
				  params.put("hbb", hongbaobi);
				}else {
					JOptionPane.showMessageDialog(null, "兑换红包币金额不足，请明天再来");
				}
				tota=false;
			}while(tota);
			
			dao.update( "update.hbb",params);
			//secLogService.logOperation("更新用户信息", "更新用户信息（yhdxdh=" + yhdxdh + ";username=" + hbdXuser.getUsername() + ")成功!");
		} 
	}
	
	public HBDXuser getYhdlById(String yhdxdh){
		HBDXuser hbuserHbdXuser=dao.select(HBDXuser.class, yhdxdh);
		return hbuserHbdXuser;
		
	}
	/**
	 * 通过用户充值金额判断用户的代理等级
	 * @param yhdxdh
	 * @return
	 */
	public double getdailisy(String yhdxdh){
		double summer=0;
		double number=0;
		double total=0;
		
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			//查询用户的充值金额
			double crje=dao.queryForDouble("list.users.crje", params);
			if(crje>=500000){
				params.put("yhjb", "一级代理");
				dao.update("update.yhjb",params);
				params.put("parentid", yhdxdh);
				//根据父级ID查询下线人数
				int count=dao.queryForInt("select.count.users", params);
				List<HBDXuser> list=dao.queryForList(HBDXuser.class, "select.userid.parentid", params);
				Iterator<HBDXuser> it=list.iterator();
				for(int i=0;i<list.size();i++){//查询二级代理
					String id=list.get(i).getYhdxdh();
					System.out.println(id);
					params.put("yhdxdh", id);
					crje=dao.queryForDouble("list.users.crje", params);
					if(crje>=300000&&crje<500000){
						summer=crje*0.05;
						summer+=summer;
					}
					double x=this.getdailiProceds(id);
					summer=summer+x;
					System.out.println(summer);
					params.put("parentid", id);
					List<HBDXuser> lst=dao.queryForList(HBDXuser.class, "select.userid.parentid", params);
					for(int j=0;j<lst.size();j++){//查询三级代理
						String idsString=lst.get(j).getYhdxdh();
						System.out.println(idsString);
						params.put("yhdxdh", idsString);
						crje=dao.queryForDouble("list.users.crje", params);
						if(crje>=100000&&crje<300000){
							number=crje*0.03;
							number+=number;
						}
						double y=this.getdailiProceds(idsString);
						number=number+y;
					}
				   total=summer+number;//从二级代理和三级代理的提成总额
				}
				System.out.println(total);
			}else if(crje>=300000&&crje<500000){
				params.put("yhjb", "二级代理");
				dao.update("update.yhjb",params);
				//二级用户享有三级用户的5个点
				params.put("parentid", yhdxdh);
				List<HBDXuser> lst=dao.queryForList(HBDXuser.class, "select.userid.parentid", params);
				for(int j=0;j<lst.size();j++){//查询三级代理
					String id=lst.get(j).getYhdxdh();
					System.out.println(id);
					params.put("yhdxdh", id);
					crje=dao.queryForDouble("list.users.crje", params);
					if(crje>=100000&&crje<300000){
						total=crje*0.05;
						total+=total;
					}
					double z=this.getdailiProceds(id);
					total=total+z;
				}
				System.out.println(total);
			}else if(crje>=100000&&crje<300000){
				params.put("yhjb", "三级代理");
				dao.update("update.yhjb",params);
				total=crje+crje*0.03;
				double t=this.getdailiProceds(yhdxdh);
				total=total+t;
				System.out.println(total);
			}else {
				 total=this.getdailiProceds(yhdxdh);
				 System.out.println(total);
			}
			
		}
		return total;
		
	}
	
	/**
	 * 代理商提取收益方法
	 * @param yhdxdh
	 * @return
	 */
	public double getdailiProceds(String yhdxdh){
	   double sum=0;
	   double number=0;
	   int usernum=0;
	   double everydaysy=0;
	   double x=0;
	   double number1=0;
	   double number2=0;
	   double number3=0;
	   if(StringUtils.isNotEmpty(yhdxdh)){
		   Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh); 
			Double proceeds=dao.queryForDouble("select.everyday", params);//查询用户的日收益
			int day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
			params.put("parentid", yhdxdh);
			double everydayhl=dao.queryForDouble("select.everyday.hlv", params);//查询每天红利
			number3=everydayhl*day;
			
			//查询下线用户人数
			int count=dao.queryForInt("select.count.users", params);
			if(count==0){
				sum=everydayhl*day;
				double crje=dao.queryForDouble("list.users.crje", params);
				double total=crje*2;//存入金额的两倍
				if(sum>=total){
					params.put("status", "P");
					dao.update("update.status",params);
				}
			}
			if(count==1){
				String userid=dao.queryForString("select.userid.parentid", params);
				params.put("parentid", userid);
				count=dao.queryForInt("select.count.users", params);
				if(count==0){
					everydaysy=everydayhl*0.08;//每天提成	
					sum=everydaysy*day;
				}else {
					boolean flag=true;
					do{
						//根据父级ID查询用户ID
						List<HBDXuser> list=dao.queryForList(HBDXuser.class, "select.userid.parentid", params);
						Iterator<HBDXuser> it=list.iterator();
						for(int i=0;i<list.size();i++){
							String id=list.get(i).getYhdxdh();
							System.out.println(id);
							params.put("yhdxdh", id);
							usernum=dao.queryForInt("select_usernum", params);
							System.out.println(usernum);
							day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
							//下线用户一代和两代
							if(usernum>=1&&usernum<=2){
								params.put("usernum", usernum);
								double lv=dao.queryForDouble("select.user.daili.lilv", params);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								everydaysy=everydayhl*lv*count;//统计该用户每天在下线用户身上得到的收益总额
							}else if(usernum>=3&&usernum<=5){//
								params.put("usernum", usernum);
								double lv=dao.queryForDouble("select.user.daili.lilv", params);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								everydaysy=everydayhl*lv*count;//统计该用户每天在下线用户身上得到的收益总额
							}else if(usernum>=6&&usernum<=10){
								params.put("usernum", usernum);
								double lv=dao.queryForDouble("select.user.daili.lilv", params);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								everydaysy=everydayhl*lv*count;//统计该用户每天在下线用户身上得到的收益总额
							}else if(usernum>=11&&usernum<=20){
								params.put("usernum", usernum);
								double lv=dao.queryForDouble("select.user.daili.lilv", params);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								everydaysy=everydayhl*lv*count;//统计该用户每天在下线用户身上得到的收益总额
							}
							System.out.println(everydaysy);
							number+=everydaysy;
							number1=number*day;
							//把用户ID传给父级ID
							params.put("parentid", id);
							count=dao.queryForInt("select.count.users", params);
							
							List<HBDXuser> lst=dao.queryForList(HBDXuser.class, "select.userid.parentid", params);
							Iterator<HBDXuser> itt=lst.iterator();
							for (int j = 0; j < lst.size(); j++) {
								String idString=lst.get(j).getYhdxdh();
								System.out.println(idString);
								params.put("yhdxdh", idString);
								usernum=dao.queryForInt("select_usernum", params);
								System.out.println(usernum);
								params.put("usernum", usernum);
								double lv=dao.queryForDouble("select.user.daili.lilv", params);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								everydaysy=everydayhl*lv*count;//统计该用户每天在下线用户身上得到的收益总额
								System.out.println(everydaysy);
								day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
								x+=everydaysy;
								params.put("parentid", idString);
								count=dao.queryForInt("select.count.users", params);//统计在同一代用户的总人数
								
							}
							System.out.println(x);
							number2=x*day;
							
						}
						if(count==0){
							flag=false;
						}
					}while(flag);
					//
					System.out.println(number2);
					sum=number1+number2+number3;//从下线用户提取的收益
					if(usernum>=1&&usernum<=2){
						double crje=dao.queryForDouble("list.users.crje", params);
						double total=crje*4;//存入金额的四倍
						if(sum>=total){
							params.put("status", "P");
							dao.update("update.status",params);
						}
					}else if(usernum>=3&&usernum<=5){//
						double crje=dao.queryForDouble("list.users.crje", params);
						double total=crje*6;//存入金额的六倍
						if(sum>=total){
							params.put("status", "P");
							dao.update("update.status",params);
						}
					}else if(usernum>=6&&usernum<=10){
						double crje=dao.queryForDouble("list.users.crje", params);
						double total=crje*8;//存入金额的八倍
						if(sum>=total){
							params.put("status", "P");
							dao.update("update.status",params);
						}
					}else if(usernum>=11&&usernum<=20){
						double crje=dao.queryForDouble("list.users.crje", params);
						double total=crje*10;//存入金额的十倍
						if(sum>=total){
							params.put("status", "P");
							dao.update("update.status",params);
						}
					}
				}
				
			}
			
			if(sum>=500){
				//更新收益明细表中收益总额、红包币、报单积分
				params.put("withdrawal", sum);
				double y=sum*0.2;
				double z=sum*0.6;//可提现金额为总金额的0.6倍
				//查询可提现金额
				double ketimoney=dao.queryForDouble("select.ketimoney", params);
				z=z+ketimoney;
				params.put("ketimoney", z);
				params.put("redcoins", y);
				params.put("entrypoins", y);
				params.put("yhdxdhfk", yhdxdh);
				dao.update("update.symx.syze.with",params);
				sum=sum*0.6;//可提现金额为总金额的0.6倍
				System.out.println(sum);
			}else {//判断当用户上次提取收益未提完时，查询出上次的收益金额，再继续提取
				double ketimoney=dao.queryForDouble("select.ketimoney", params);
				if(ketimoney>=500){
					sum=ketimoney;
				}
				
			}
			
	   }
	return sum;
		
	}
	
	/**
	 * 查询红包收益总额
	 * @param yhdxdh
	 * @return
	 */
	public double getproceeds(String yhdxdh){
		double sum=0;
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			Double proceeds=dao.queryForDouble("select.everyday", params);//查询用户的日收益
			int day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
			
			//查询下线用户人数
			int count=dao.queryForInt("select.count.users", params);
			if(count>0){
				int usernum=1;
				usernum=dao.queryForInt("select_usernum", params);
				usernum=usernum+1;
				params.put("usernum", usernum);
				double lv=dao.queryForDouble("select.user.daili.lilv", params);
				double hbjj=dao.queryForDouble("select.hbjj", params);
				double dailisy=hbjj*lv;
				double number=dailisy*count;
				sum=proceeds*day+number;
				System.out.println(sum);
			}else {
				sum=proceeds*day;
				if(sum>=500){
					sum=proceeds*day;
					System.out.println(sum);
					
				}else {
					JOptionPane.showMessageDialog(null, "收益金额不足500，请明天再来");
				}
			}
		    
		}
		return sum;
	}
	
	/**
	 * 提取红包收益总额
	 * 实现原理：每次提现更新起始日期和结束日期，并将提现后剩余金额放入明细表中ketimoney
	 * @param yhdxdh
	 */
	public void deleteProceeds(HBDXuser hbdXuser,String yhdxdh){
		Double ketimoney=hbdXuser.getAggreatMount();
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			double ketijine=dao.queryForDouble("select.ketimoney", params);//查出收益明细表中的可提现金额
			if(ketimoney<=ketijine){
				ketijine=ketijine-ketimoney;
				SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
				String qsrq=dfc.format(new Date());// new Date()为获取当前系统时间
				params.put("qsrq", qsrq);
				params.put("jsrq", qsrq);
				params.put("ketimoney", ketijine);
				params.put("yhdxdhfk", yhdxdh);
				dao.update("update.mx.time",params);
			}
			
		}
		
	}

	/**
	 * 保存用户充值
	 * @date 2015/5/24
	 * @param hbdXuser
	 * @return
	 */
   public boolean dosaveChongzhi(HBDXuser hbdXuser){
	String id=hbdXuser.getYhdxdh();
	Double aggreatMount=hbdXuser.getAggreatMount();
	if(StringUtils.isNotEmpty(id)){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", id);
		Double numberDouble=dao.queryForDouble("select.ketimoney", params);//查询用户可提现金额
		numberDouble=numberDouble+aggreatMount;
		params.put("ketimoney", numberDouble);
		params.put("yhdxdhfk", id);
		dao.update("update.symx.ketixian",params);
		return true;
	}
	return false;
	   
   }
	
	/**
	 * 红包基金转账
	 * time:2015/5/23
	 * @param hbdXuser
	 */
	public boolean getexcRMBZH(HBDXuser hbdXuser){
		String userphnoe=hbdXuser.getUserphnoe();//获取接收账号
		String yhdxdh=hbdXuser.getYhdxdh();//获取当前用户id
		Double aggreatMount=hbdXuser.getAggreatMount();//获取转账红包基金金额
		if(StringUtils.isNotEmpty(userphnoe)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			Double hbjjze=this.getRedpackage(yhdxdh);//查询当前用户红包基金总额
			if(hbjjze>=aggreatMount){//判断当前用户是否有足够的资金转账
				hbjjze=hbjjze-aggreatMount;
				params.put("hbjjze", hbjjze);
				params.put("yhdxdhfk", yhdxdh);
				params.put("userphnoe", userphnoe);
				
				//判断接收转账用户的合法性
				Integer number=dao.queryForInt("select.username.number1", params);
				if (number>0&&number<2){
					String yhid=dao.queryForString("select.username.number2", params);
					dao.update("update.symx.sy",params);//转账成功更新数据库表记录
					Double hbjj=this.gethbjjTotal(yhid);//查询接收转账用户红包基金总额
					hbjj=hbjj+aggreatMount;
					params.put("hbjjze", hbjj);
					params.put("yhdxdhfk", yhid);
					dao.update("update.symx.sy",params);//转账成功更新数据库表记录
					return true;
				}
			}
			return false;
		}
		return false;
	}
	/**
	 * 前台调用方法（查询红包基金总额）
	 * time:2015/5/23
	 * @param yhdxdh
	 * @return
	 */
	public double gethbjjTotal(String yhdxdh){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		Double jijinDouble=dao.queryForDouble("select.hbjj", params);
		return jijinDouble;
		
	}
	
	/**
	 * 查询红包基金总额（提取红包基金调用的方法）
	 * time:2015/5/23
	 * @param hbdXuser
	 * @return
	 */
	public double getRedpackage(String yhdxdh){
		
		double sum = 0;
		double total=0;
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			Double hbjj=dao.queryForDouble("select.hbjj",params);
			params.put("hbjj", hbjj);
			int day=dao.queryForInt("list.hbjj.date", params);
			int n=day/30;//n表示30的倍数，即几个月
			
			//判断如果n>1
			 if(n>=1){
			    	n=n-1;
			    	sum=hbjj*30+hbjj*30*0.1;
			    	double number=0;
			    	while (n>0) {
			    		
				    	sum=sum+sum*0.1;
						n--;
						
						number+=sum;
						System.out.println(sum);
					}
			    	System.out.println(number);
			    	
			    	 //判断是否当天取现
			    	n=day/30;
			    	
			    	if(29<day&&day<=30||29*n<day&&day<=30*n){
			    		total=total+hbjj*30;
					    System.out.println(total);
					    total=total+number;
					}else if(day>30&&day<=31){
						total=hbjj*(day-1)+hbjj*(day-1)*0.1;
						System.out.println(total);
						total=total+number;
					}
			    	
			    	//把红包基金存放在收益明细表中
			    	params.put("yhdxdhfk", yhdxdh);
			    	params.put("hbjjze", total);
				    dao.update("update.symx.sy",params);
			    }

		}
		return total;
			
	}
	
	/**
	 * 提取红包基金方法
	 * @param yhdxdh
	 */
	public void deleteRedpackge(HBDXuser hbdXuser,String yhdxdh){
		double aggreatMount=hbdXuser.getAggreatMount();
		
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			params.put("yhdhfk", yhdxdh);
			params.put("hbjj", "0");//根据ID把该用户的红包基金先清零
			Double hbjj=dao.queryForDouble("select.hbjj",params);//根据存入金额重新算红包基金
			params.put("hbjj", hbjj);//传值
			dao.update("update.hbjj",params);//更新红包基金
			
			params.put("yhdxdhfk", yhdxdh);
			double withdrawal=dao.queryForDouble("select.symx.withdrawal",params);
			double tixian=withdrawal*0.6;//可提现金额
			if(tixian>=aggreatMount){
				double zhye=tixian-aggreatMount;//账户余额
				params.put("withdrawal", zhye);
			}
			double hbjjze=dao.queryForDouble("select.mx.hbjjze", params);//查询明细表中的红包基金总额
			if(aggreatMount<=hbjjze){
				hbjjze=hbjjze-aggreatMount;
				//根据红包收益明细表结束日期传个当前起始日期
				params.put("yhdxdh", yhdxdh);
				params.put("yhdhfk", yhdxdh);
				SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
				String time=dfc.format(new Date());// new Date()为获取当前系统时间
				params.put("czrq", time);
				params.put("dqrq", time);
				dao.update("update.hb.qsjsrq",params);
				params.put("hbjjze", hbjjze);
				
				dao.update("update.date.qsrqorjsrq",params);
			}
			
		}
		
	}
	
	/**
	 * 查询兑换红包币利率
	 * @param llfl
	 * @return
	 */
	public Double getllflById(Double llfl){
		Dao dao = (Dao) Dao.get();
		CanShuLL ll=dao.getJdbcDao().queryForObject(CanShuLL.class, "list.lilv");
		ll.getLlbh();
		llfl=ll.getLlbl();
		return llfl;
	}
	
	public void updatehb(HBDXuser hbdXuser){
		if(StringUtils.isNotEmpty(hbdXuser.getYhdxdh())){
			dao.update(hbdXuser);
		}
	}
	
	/**
	 * 下线用户注册保存方法
	 * @param hbdXuser
	 * @throws ParseException 
	 * @throws ParseException 
	 */
	public void saveUser(HBDXuser hbdXuser){
		String yhdxdh=hbdXuser.getYhdxdh();
		Double crje=hbdXuser.getCrje();
		
		Redpackgehbb redpackgehbb=new Redpackgehbb();
		
		
		CanShuLL canShuLL=new CanShuLL();
		String yhbh=canShuLL.getLlbh();
		String userjhm=hbdXuser.getUserjhm();//获取用户激活码
		UserCanShu userCanShu=new UserCanShu();
		String userId=userCanShu.getYhbh();
		int notes3=0;
		Redpackagemx redpackagemx=new Redpackagemx();
		if(StringUtils.isNotEmpty(yhdxdh)){
			
			Map<String, Object> params=new HashMap<String, Object>();
			
			params.put("yhdxdh", yhdxdh);
			params.put("times", "0");
			int usernum=dao.queryForInt("select_usernum", params);
			hbdXuser.setYhdxdh(Dao.getUUID());
			hbdXuser.setParentID(getFunctionPath(hbdXuser));
			
			//以md5的方式保存密码
			hbdXuser.setPassword(SecurityContext.getProvider().encryptPassword(hbdXuser.getPassword()));
			dao.insert(hbdXuser);
			secLogService.logOperation("添加用户信息", "添加用户（ID=" + userId + ";Name=" + hbdXuser.getUsername() + ")成功!");
			params.put("userjhm", userjhm);
			String id=dao.queryForString("select.userID", hbdXuser);
			
			params.put("yhdxdh", id);
			params.put("parentID", yhdxdh);
			dao.update("update.prentID",params);
			//判断当前用户的等级
			
			
			//	params.put("parentID", parentID);
				if(usernum>=0&&usernum<=19){
					usernum =usernum+1;
				}else {
					usernum=20;
				}
			params.put("usernum", usernum);
			dao.update("update.usernum",params);
			
			//4.根据用户USERNUM找到利率表对应的id
			String lvid=dao.queryForString("select_usernum_lvID", params);
			params.put("hbllfk", lvid);
			dao.update("update.prentID",params);//更新父级ID和红包利率外键
			
			//1.把代理对象ID注册到用户表中
			params.put("dljhm", userjhm);
			String dlID=dao.queryForString("list.dldxbh", params);//查询代理用户ID
			params.put("dldxbhfk", dlID);//把代理用户的ID传给红包用户
			params.put("userjhm", userjhm);
			String tgslj=dao.queryForString("select.tgslj", params);
			params.put("tgslj", tgslj);
			dao.update("list.dldxfk", params);
			
			params.put("statues", "0");//更新代理激活码状态
			dao.update("user.savecheck",params);
			//2.用户ID跟红包关联
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
			String czrq=df.format(new Date());// new Date()为获取当前系统时间
		//	Date date=java.sql.Date.valueOf(czrq);
				params.put("yhdhfk", id);
				Double hbjj=dao.queryForDouble("select.hbjj",hbdXuser);
				params.put("hbjj", hbjj);
				params.put("crje", crje);
				params.put("czrq", czrq);
				params.put("qxrq", czrq);
				params.put("dqrq", czrq);
				String status=dao.queryForString("select.user.statues", hbdXuser);
				params.put("zhstatus", status);
				dao.insert(Redpackgehbb.class,params);
				
				//3.利率跟收益明细关联
				SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
				String mxrq=dfc.format(new Date());// new Date()为获取当前系统时间
				params.put("qsrq", mxrq);
				params.put("jsrq", mxrq);
				Double aggreatMount=dao.queryForDouble("user.list.aggreatMount", hbdXuser);
				params.put("syje", aggreatMount);
				String llbh=dao.queryForString("select_usernum_lvID", params);
				
				params.put("llbh", llbh);
				Double llbl=dao.queryForDouble("select.llbl", params);
				params.put("syll", llbl);
				params.put("yhdxdhfk", id);
				params.put("llbhfk", llbh);
				
				dao.insert(Redpackagemx.class,params);
				
		}
		
		
	}
	
	/**
	 * 获取当前日期的方法
	 * @return
	 */
	public String getNowtime(){
		SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd hh:mm:ss");//设置日期格式
		String jsrq=dfc.format(new Date());// new Date()为获取当前系统时间
		System.out.println(jsrq);
		return jsrq;
	}
	
	/**
	 * 取得父级ID的值
	 * @param hbdXuser
	 * @return
	 */
	private String getFunctionPath(HBDXuser hbdXuser) {
		// TODO Auto-generated method stub
		if (StringUtils.isEmpty(hbdXuser.getParentID())) {
			return hbdXuser.getParentID();
		}
		
		HBDXuser parentPermission = dao.select(HBDXuser.class, hbdXuser.getParentID());
		if (null == parentPermission) {
			return hbdXuser.getParentID();
		}
		
		return hbdXuser.getParentID() + "." + hbdXuser.getYhdxdh();
	}
   /**
    * 定时器调用方法
    */
	public void getupdatejsrq() {
		Map<String, Object> params=new HashMap<String, Object>();
		SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
		String jsrq=dfc.format(new Date());// new Date()为获取当前系统时间
		params.put("jsrq", jsrq);
		System.out.println("执行中。。。。。。。。。。。。。。。");
		/*String symxdxdh=dao.queryForString("select.symx.id", params);
		params.put("symxdxdh", symxdxdh);*/
		params.put("dqrq", jsrq);
		dao.update("update.hb.dqrq",params);
		dao.update("update.symx.jsrq",params);
		//更新每天的红利
		
		List<HBDXuser> lst=dao.queryForList(HBDXuser.class, "select.times.userid", params);//查询用户id
		for(int i=0;i<lst.size();i++){
			String id=lst.get(i).getYhdxdh();
			System.out.println(id);
			params.put("yhdxdh", id);
			double everydayhl=dao.queryForDouble("select.everyday.hl.time", params);
			params.put("everydayhl", everydayhl);
			params.put("status", "O");
			dao.update("update.everyday.hongli",params);
			List<HBDXuser> idString=dao.queryForList(HBDXuser.class,"select.id.null", params);
			Iterator<HBDXuser> it=idString.iterator();
			for(int j=0;j<idString.size();j++){
				String ids=idString.get(j).getYhdxdh();
				System.out.println(ids);
	            params.put("yhdxdh", ids);
				int day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
				double sum=everydayhl*day;
				if(sum>=5600){
					params.put("status", "P");
					dao.update("update.everyday.hongli",params);
				}
			}
			
		}
		
		/*int day=dao.queryForInt("list.date", params);//查询截止当前时间是几天
		double sum=dao.queryForDouble("select.everyday.sy", params);//每日红利
		
		double total=sum*day;
		//查询下线用户人数
		int count=dao.queryForInt("select.count.users", params);
		if(count==0){
			if(total>5600){
				
			}
		}*/
		
	}

public String signIn(HttpServletRequest request, String userphnoe) {
	// TODO Auto-generated method stub
	Session session=new Session();
	session.setAttribute("userphnoe", userphnoe);
	return request.getParameter("userphnoe");
}

/**
 * 根据电话号码查询用户ID
 * @param userphnoe
 * @return
 */
public String getHBDXuserById(String userphnoe) {
	Map<String, Object> params=new HashMap<String, Object>();
	params.put("userphnoe", userphnoe);
	String id=dao.queryForString("select.username.number2", params);
	return id;
}

public double getredpackege(String id){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", id);
		double num=dao.queryForDouble("user.list.aggreatMount", params);
		return num;	
	}

public boolean toRMBsavedh(HBDXuser hbdXuser){
	Double hbzeDouble=hbdXuser.getAggreatMount();
	String idString=hbdXuser.getYhdxdh();
	Double hbjjze=hbdXuser.getEveryoneTotal();
	Double number=this.getRedpackage(idString);
	Map<String, Object> params=new HashMap<String, Object>();
	params.put("yhdxdh", idString);
	if(number>=hbzeDouble){
		number=number-hbzeDouble;
		params.put("aggreatMount", number);
		dao.update("update.aggreate",params);
		Double sumDouble=this.getRedpackage(idString);
		sumDouble=sumDouble+hbjjze;
		params.put("hbjjze", sumDouble);
		params.put("yhdxdhfk", idString);
		dao.update("update.hbjjze",params);
		return true;
	}
	return false;
}
	
}
