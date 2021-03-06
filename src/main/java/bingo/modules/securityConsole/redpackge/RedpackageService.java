package bingo.modules.securityConsole.redpackge;

import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.swing.JOptionPane;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.thoughtworks.xstream.alias.ClassMapper.Null;

import bingo.modules.securityConsole.redlog.Lssue;
import bingo.modules.securityConsole.redpackge.RedPool;
import bingo.modules.securityConsole.symx.CanShuLL;
import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;
import bingo.dataservice.data.ResultSet;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.yhdl.HBDXuser;
import bingo.modules.securityConsole.yhdl.YhdxDL;
import bingo.modules.securityConsole.yonghuCanshu.UserCanShu;
import bingo.security.SecurityContext;

/**
 * 红包Service类
 * @author Administrator
 *
 */
@Service
public class RedpackageService extends BaseService{
	
	private SecLogService secLogService;
	
	public SecLogService getSecLogService() {
		return secLogService;
	}

	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}
	
	public boolean getusermoney(String yhdxdh){
		if(StringUtils.isNotEmpty(yhdxdh)){
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("yhdxdh", yhdxdh);
			Double money=dao.queryForDouble("list.users.crje", params);
			if(money!=0&&money>=2800){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 前台调用方法
	 * 群红包，塞钱进红包保存方法
	 * @param hbdXuser
	 */
	public void insertLssue(HBDXuser hbdXuser){
		String yhdxdh = hbdXuser.getYhdxdh();//用户id
		SimpleDateFormat dfc = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//设置日期格式
		String nowtime=dfc.format(new Date());// new Date()为获取当前系统时间
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		String username=dao.queryForString("select.id.username", params);
		Double monney=hbdXuser.getEveryoneTotal();
		Lssue lssue=new Lssue();
		lssue.setFromname(username);
		lssue.setLssuetime(nowtime);
		lssue.setMonney(monney);
		lssue.setUserid(yhdxdh);
		dao.insert(lssue);
		RedPool redPool=new RedPool();
		this.saveOrUpdateRedpackge(redPool, hbdXuser);
	}

	/**
	 * 根据ID进行保存参数信息
	 * 统计红包池群发红包总个数和总金额，每次群发更新总记录，无群发明细
	 * 统计群发后该用户剩余红包个数和剩余金额
	 * 
	 * @param userCanShu
	 */
	public void saveOrUpdateRedpackge(RedPool redPool,HBDXuser hbdXuser){
		String yhdxdh = hbdXuser.getYhdxdh();//用户id
		String userId = redPool.getHbcID();//红包池ID
		Integer hbgs=hbdXuser.getHbgs();//红包个数
		Double aggreatMount=hbdXuser.getAggreatMount();//红包总额
		
		redPool.setHbnumber(hbgs);
		
		String  hblb=redPool.getHblb();//红包类别
		
		redPool.setAggreate(aggreatMount);
		boolean pool=true;
		if(StringUtils.isNotEmpty(hbdXuser.getYhdxdh())){
			Map<String, Object> paraMap=new HashMap<String, Object>();
			paraMap.put("yhdxdh", yhdxdh);
			int day=dao.queryForInt("list.date", paraMap);
			if(day<2){
				JOptionPane.showMessageDialog(null, "新注册用户当天不能派红包，请明天再来");
			}else {
				int sum=dao.queryForInt("user.list.hbgs", hbdXuser);//统计用户的红包个数
				double y=dao.queryForDouble("user.list.aggreatMount", hbdXuser);//统计用户的红包总金额
				int number=dao.queryForInt("list.hbc.hbgs", redPool);//统计红包池的红包个数
				double areement=dao.queryForDouble("list.hbc.total", redPool);//统计红包池的总金额
				if(sum<hbgs||y<aggreatMount){
					JOptionPane.showMessageDialog(null, "账户余额不足，请重新输入");
				}else {
				do{
					//判断数据库的红包个数是否满足群发输出的红包个数
					if(sum>=hbgs){
						sum=sum-hbgs;
						System.out.println(sum);
						paraMap.put("hbgs", sum);
						Integer hbnumber=redPool.getHbnumber();
						number=number+hbnumber;
						System.out.println(number);
						paraMap.put("hbnumber", number);
					}else{
						JOptionPane.showMessageDialog(null, "红包个数不足，请重新输入");
						pool=false;
					}
				
						
					
					
					//判断数据库用户的红包总金额是否满足群发的条件
					if(y>=aggreatMount){
						y=y-aggreatMount;
						System.out.println(y);
						paraMap.put("aggreatMount", y);
						Double aggreate=redPool.getAggreate();//红包池总金额
						areement=areement+aggreate;
						System.out.println(areement);
						paraMap.put("aggreate", areement);
					}else {
						JOptionPane.showMessageDialog(null, "红包余额不足，请重新输入");
						pool=false;
					}
					
					pool=false;
				}while (pool) ;
				
					dao.update("update.user.qunfa",paraMap);//更新用户数据
					if(StringUtils.isNotEmpty(redPool.getHblb())){
						dao.update("list.hbc.update", paraMap);//更新红包池数据
					}
				}
				}
			}
	}
	
	public void getUserByID(HBDXuser hbdXuser){
		String sqlString="select count(*) from hbdx_user";
		dao.queryForMap(sqlString, hbdXuser);
	}

	/**
	 * 系统随机选择一个用户
	 * 添加用户红包个数，红包金额，红包总额
	 * 一对一派红包,普通红包登录用户,红包个数，红包金额，红包总额相对减少
	 * @param hbdXuser
	 * @return
	 */
	public void domathID(HBDXuser hbdXuser){
		long rownum;
	  //  String ID=hbdXuser.getID();
	    long summer=dao.queryForLong("list.math.user", hbdXuser);
	    boolean user=true;
	    do{
	    	Map<String, Object> params=new HashMap<String, Object>();
	    	rownum=(long) Math.round(Math.random()*(summer-1)+1);
	    	params.put("no", rownum);
	    	System.out.println(rownum);
	    	System.out.println(dao.queryForMap("list.math.id",params));
	    	Map<String, Object> map=dao.queryForMap("list.math.id",params);
	    	// System.out.println(list.get(1));
	    	/*Set<String> s=map.keySet();
	    	Iterator<String> it=s.iterator();
	    	if(it.hasNext())//set里面如果有下一个
	    	  {
	    	   String key=it.next();//返回当前set中的这个元素（因为set中都是放的key，“指针”指向下一个
	    	   System.out.println(map.get("yhdxdh"));//利用hm.get(key)方法获得该key对应的value
	    	  }*/
	    	  
	    	 /*String str= map.get(0).toString();
	    	 String id=str.substring(14, 46); */
	    	  String id=(String) map.get("yhdxdh");
	    	  
	    	  Integer hbgs=hbdXuser.getHbgs();//红包个数
	  		  
	  		  Double everyoneTotal=hbdXuser.getEveryoneTotal();//单个红包金额
	  		Double aggreatMount=everyoneTotal*hbgs;//红包总额
	    	  if(StringUtils.isNotEmpty(id)){
	    		  Map<String, Object> param = new HashMap<String, Object>();
	    		  param.put("yhdxdh", id);
	    		//  String idString=hbdXuser.getYhdxdh();
	    		  //统计红包个数
	    		  int sum=dao.queryForInt("list.paihongb.one", param);
	    		  do{
	    			  sum=sum+hbgs;
	    			  System.out.println(sum);
	    			  param.put("hbgs", sum);
	    			  user=false;
	    		  }while (user);
	    		  
	    		   //计算单个红包累计
				 	 double number=dao.queryForDouble("list.paihongb.onetotal", param);
				 	    boolean everyone=true;
					 	do {
					 		
					 		number=number+everyoneTotal;
					 		System.out.println(number);
					 		param.put("everyoneTotal",number);
					 		everyone=false;
						} while (everyone);
					
					 	//计算总金额
						double y=dao.queryForDouble("list.paihongb.number", param);
						boolean total=true;
						do{
							 y=aggreatMount+y;
							 System.out.println(y);
							 param.put("aggreatMount", y);
							 total=false;
						}while(total);
					 	
						dao.update("list.paihongb", param);
	    	  }
	    	  
	    	user=false;
	    }while(user);
	    
	}

	/**
	 * 普通红包，塞钱进红包
	 * 前台调用方法
	 * @param hbdXuser
	 */
    public void insertputong(HBDXuser hbdXuser){
    	String yhdxdh = hbdXuser.getYhdxdh();//用户id
		SimpleDateFormat dfc = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//设置日期格式
		String nowtime=dfc.format(new Date());// new Date()为获取当前系统时间
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("yhdxdh", yhdxdh);
		String username=dao.queryForString("select.id.username", params);
		Double monney=hbdXuser.getEveryoneTotal();
		Lssue lssue=new Lssue();
		lssue.setFromname(username);
		lssue.setLssuetime(nowtime);
		lssue.setMonney(monney);
		lssue.setUserid(yhdxdh);
		dao.insert(lssue);
		this.putonghb(hbdXuser);
    }
	
	/**
	 * 一对一派红包,普通红包登录用户,红包个数，红包金额，红包总额相对减少
	 * 该方法调用了随机选择用户派红包方法
	 * method=domathID(hbdXuser)
	 * @param hbdXuser
	 */
	public void putonghb(HBDXuser hbdXuser){
		String yhdxdh = hbdXuser.getYhdxdh();//红包编号
		String notes=hbdXuser.getNotes2();//备注
		Integer hbgs=hbdXuser.getHbgs();//红包个数
		
		Double everyoneTotal=hbdXuser.getEveryoneTotal();//单个红包金额
		Double aggreatMount=everyoneTotal*hbgs;//红包总额
		int sum=dao.queryForInt("user.list.hbgs", hbdXuser);
		//double number=dao.queryForDouble("user.list.everyoneTotal", hbdXuser);
		double y=dao.queryForDouble("user.list.aggreatMount", hbdXuser);
		if(sum>=hbgs&&y>=aggreatMount){
			if(StringUtils.isNotEmpty(hbdXuser.getYhdxdh())){
				Map<String, Object> paMap=new HashMap<String, Object>();
				paMap.put("notes2", notes);
				paMap.put("yhdxdh",yhdxdh);
				
				int day=dao.queryForInt("list.date", paMap);
				if(day<2){
					JOptionPane.showMessageDialog(null, "新注册用户当天不能派红包，请明天再来");
				}else {
					boolean a=true;
					do{
						if(sum>=hbgs){
							sum=sum-hbgs;
							System.out.println(sum);
							paMap.put("hbgs", sum);
							a=false;
						}
						/*if(number>=everyoneTotal){
							 number=number-everyoneTotal;
							 System.out.println(number);
							 paMap.put("everyoneTotal", number);
							 a=false;
						 }*/
						if(y>=aggreatMount){
							y=y-aggreatMount;
							System.out.println(y);
							paMap.put("aggreatMount", y);
						}
					}while(a);
					dao.update("redpackge.putonghb",paMap);
					domathID(hbdXuser);
				}		
				
			}
		}else {
			JOptionPane.showMessageDialog(null, "账户余额不足，请重新输入");
		}
	}
	
	
	
	/**
	 * 
	 * 抢红包同一个方法保存数据
	 * @param hbdXuser
	 */
	public void UpdateRedpackge(HBDXuser hbdXuser,RedPool redPool){
		//RedpackageService redpackageService=new RedpackageService();
		
		String yhdxdh = hbdXuser.getYhdxdh();//红包编号
		String notes="恭喜发财";//备注
		Integer hbgs=1;//红包个数
		Double aggreatMount=hbdXuser.getAggreatMount();//红包总额
		Double everyoneTotal=hbdXuser.getEveryoneTotal();//单个红包金额
		 int sum=dao.queryForInt("user.list.hbgs", hbdXuser);
		 double number=dao.queryForDouble("user.list.everyoneTotal", hbdXuser);
		 double y=dao.queryForDouble("user.list.aggreatMount", hbdXuser);
		 int number1=dao.queryForInt("list.hbc.hbgs", redPool);
		 double areement=dao.queryForDouble("list.hbc.total", redPool);
		 if(number1>=hbgs&&areement>=aggreatMount){
			 if (StringUtils.isNotEmpty(hbdXuser.getYhdxdh())){
				 Map<String, Object> params = new HashMap<String, Object>();
				 	  params.put("notes2", notes);
				// 	  params.put("id", idString);
				 	  params.put("yhdxdh",yhdxdh);
				 	 Double m=dao.queryForDouble("list.users.crje", params);
				 	 Double mdouble=m/150*0.7;
				 	  //2.计算起始日期跟结束日期的时间差
					int n=dao.queryForInt("list.date", params);
				 	  //3.团队提成每天收益
					Double x=m/150*0.3;
				 	  //4.查询普通用户每天收益
					Double sums=mdouble*n;
				 	  //5.计算团队提成总收益
					Double num=x*n;
				 	  //6.计算每天收益总和跟团对提成收益总和的总数
					Double yDouble=sums+num;
				 	  //7.判断总收益是否大于投资额度的3倍
					if(yDouble>=m*3&&yDouble!=0){
						params.put("status", "p");
						dao.update("update.status",params);
						JOptionPane.showMessageDialog(null, "你的收益额度过高，请下次再抢红包");
						
					}else {
						
						if(n<2){
							int times=dao.queryForInt("select.times", params);
							/*int day=dao.queryForInt("list.date", params);*/
							if(times<5){
								times=times+1;
								System.out.println(times);
								params.put("times", times);
								dao.update("update.times",params);
								
								 //计算红包个数 	   
						 	    boolean b=true;
							 	do {
							 		if(hbgs<=sum);
							 		sum=sum+hbgs;
							 		System.out.println(sum);
							 		params.put("hbgs",sum);
							 	//	deleteMath(hbdXuser);
							 		/*if(StringUtils.isNotEmpty(redPool.getHblb())){
							 			
							 			
							 		}*/
							 		if(hbgs<=number1&&number1>0){
							 			number1=number1-hbgs;
								 		System.out.println(number1);
										params.put("hbnumber", number1);
							 			}else {
						 				b=false;
								     }	
							 		b=false;
							 		
								} while (b);
								
							 	//计算单个红包累计
							 	
							 	    /*boolean everyone=true;
								 	do {
								 		if(everyoneTotal<=number);
								 		number=number+everyoneTotal;
								 		System.out.println(number);
								 		params.put("everyoneTotal",number);
								 		everyone=false;
									} while (everyone);*/
						 	      
								 //计算总金额
								
								 
								 boolean total=true;
								 do{
									 if(aggreatMount<=y);
									 y=y+aggreatMount;
									 System.out.println(y);
									 params.put("aggreatMount", y);
									 if(aggreatMount<=areement&&areement>0);
										areement=(areement-aggreatMount);
										System.out.println(areement);
										params.put("aggreate", areement);
										total=false;
								 }while(total);
						 	  dao.update("redpackge.putonghb", params);
						 	  dao.update("list.hbc.update",params);
						 	  /*if(StringUtils.isNotEmpty(redPool.getHblb())){
						 		 
						 	  } 	*/ 
							}else {
								JOptionPane.showMessageDialog(null, "新注册用户当天只能抢红包五次，请明天再来");
							}		
							
						}else {
							 //计算红包个数 	   
					 	    boolean b=true;
						 	do {
						 		if(hbgs<=sum);
						 		sum=sum+hbgs;
						 		System.out.println(sum);
						 		params.put("hbgs",sum);
						 	//	deleteMath(hbdXuser);
						 		if(hbgs<=number1&&number1>0){
						 			number1=number1-hbgs;
							 		System.out.println(number1);
									params.put("hbnumber", number1);
						 			}else {
					 				b=false;
							     }	
					 			
						 		b=false;
						 		
							} while (b);
							
						 	//计算单个红包累计
						 	
						 	    boolean everyone=true;
							 	do {
							 		if(everyoneTotal<=number);
							 		number=number+everyoneTotal;
							 		System.out.println(number);
							 		params.put("everyoneTotal",number);
							 		everyone=false;
								} while (everyone);
					 	      
							 //计算总金额
							
							 
							 boolean total=true;
							 do{
								 if(aggreatMount<=y);
								 y=y+aggreatMount;
								 System.out.println(y);
								 params.put("aggreatMount", y);
								/* if(StringUtils.isNotEmpty(redPool.getHblb())){
									
								 }else {
									total=false;
								}*/
								 if(aggreatMount<=areement&&areement>0);
									areement=(areement-aggreatMount);
									System.out.println(areement);
									params.put("aggreate", areement);
								 total=false;
							 }while(total);
					 	  dao.update("redpackge.putonghb", params);
					 	  dao.update("list.hbc.update",params);
					 	 /* if(StringUtils.isNotEmpty(redPool.getHblb())){
					 		 
					 	  } 	*/ 
						}	
					}
			}
		 }else{
			 JOptionPane.showMessageDialog(null, "账户余额不足，请重新输入");
			 
			// Result.forward("/modules/hongbao/edit_sec_putong.jsp");
		 }
		
	}
	

	
	
	
	/**
	 * 根据ID取值
	 * @param hbcID
	 * @return
	 */
	public RedPool getQianghbById(String hbcID) {
		// TODO Auto-generated method stub
		return dao.select(RedPool.class, hbcID);
	}
	
	/**
	 * 统计红包用户数据
	 * @param redPool
	 */
	public HBDXuser getQueryById(String yhdxdh){
		HBDXuser hbuserHbdXuser=dao.select(HBDXuser.class, yhdxdh);
		return hbuserHbdXuser;
	}
	
	public void deleteMath(HBDXuser hbdXuser){
		
		String yhdxdh=hbdXuser.getYhdxdh();
		Integer hbgs=hbdXuser.getHbgs();//红包个数
		Double aggreatMount=hbdXuser.getAggreatMount();//红包总额
		Double everyoneTotal=hbdXuser.getEveryoneTotal();//单个红包金额
		
		if(StringUtils.isNotEmpty(yhdxdh)){
			RedpackageService service=new RedpackageService();
	 		hbdXuser=service.getQueryById(yhdxdh);
	 		Integer xInteger=hbdXuser.getHbgs();
	 		Map<String, Object> paramas=new HashMap<String, Object>();
	 		
	 		if(hbgs<=xInteger){
	 			xInteger=xInteger-hbgs;
	 			System.out.println(xInteger);
	 			paramas.put("hbgs", xInteger);
	 		}
		}
		
	}
	
	/**
	 * 查询红包池中红包总金额
	 * @return
	 */
	public float selectReedPool(){
		    String id="2426d6aff1f94a4db81e1572c386df4c";//红包池id
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("hbcid", id);
		    float areement=dao.queryForFloat("select.redpool.total", params);
		    return areement;	
	}

	/**
	 * 查询红包池中红包个数
	 * @return
	 */
	public int getNummber(){
		String id="2426d6aff1f94a4db81e1572c386df4c";//红包池id
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("hbcid", id);
		int number=dao.queryForInt("select.redpool.count", params);
		return number;
	}
	
	/**
	 * 用户登录方法
	 * @param hbdXuser
	 * @return
	 */
	
	public boolean dosave(HBDXuser hbdXuser) {
		boolean users=false;
		String userphnoe=hbdXuser.getUserphnoe();
		String password=hbdXuser.getPassword();
		hbdXuser.setPassword(SecurityContext.getProvider().encryptPassword(hbdXuser.getPassword()));
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userphnoe", userphnoe);
		Integer number=dao.queryForInt("select.username.number1", params);
		
		if (number>0&&number<2){
			String id=dao.queryForString("select.username.number2", params);
			params.put("yhdxdh", id);
			String passwords=dao.queryForString("select.password.number3", params);
			if(StringUtils.isNotEmpty(passwords)){
				if(passwords.equals(password)){
					return true;
				}else {
				//	JOptionPane.showMessageDialog(null, "用户名和密码不正确，请重新输入");
					return users;
				}
			}
			return users;
		}
		return users;
	}
	
	/**
	 * 根据用户电话号码查询用户id
	 * @param userphnoe
	 * @return
	 */
	public String validateid(String userphnoe){
		String id=null;
		if(StringUtils.isEmpty(userphnoe)){
			return id;
		}else {
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("userphnoe", userphnoe);
			id=dao.queryForString("select.username.number2", params);
			System.out.println(id);
			return id;
			}
	}
	/**
	 * 前台用户注册方法
	 * @param hbdXuser
	 */
	@RequestMapping(value="/savereduser")
	public boolean savereduser(HBDXuser hbdXuser){
		
		String userphnoe=hbdXuser.getUserphnoe();
		String password=hbdXuser.getPassword();
		
		if(userphnoe!=null&&password!=null){
			//hbdXuser.setPassword(SecurityContext.getProvider().encryptPassword(hbdXuser.getPassword()));
			dao.insert(hbdXuser);
			secLogService.logOperation("添加用户信息", "添加用户(Name=" + hbdXuser.getUserphnoe() + ")成功!");
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("userphnoe", userphnoe);
			String idString=dao.queryForString("select.username.number2", params);//根据电话号码查红包中的用户id
			SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
			String nowtime=dfc.format(new Date());// new Date()为获取当前系统时间
			RedPackge redPackge=new RedPackge();
			redPackge.setCzrq(nowtime);
			redPackge.setQxrq(nowtime);
			redPackge.setDqrq(nowtime);
			redPackge.setYhdhfk(idString);
			dao.insert(redPackge);//用户注册将数据插入红包中
		}else {
			dao.updateFieldsExcluded(hbdXuser, "password");
			secLogService.logOperation("更新用户信息", "更新用户信息(Name=" + hbdXuser.getUserphnoe() + ")成功!");
		}
		return true;
	}
}
