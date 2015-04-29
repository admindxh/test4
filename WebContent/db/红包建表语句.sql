/*
 *描述：需求分析设计，杨伟
 *完成 红包对象
 *author yangwei
 *version：v1.0
 *date:2014年10月16日9:50:01
*/
drop table paihongbao.hbdx_hb;
alter table hbdx_hb add (hbllfk varchar2(32));
create table paihongbao.hbdx_hb(
	hbdxdh			        varchar2(32) default (sys_guid()) primary key	                                ,		--红包对象代号： id 主键
        hbbdxdhfk 			varchar2(32)									,		--红包币对象代号 外键
	yhdhfk 			        varchar2(32)									,		--用户代号外键
        hbcfk                           varchar2(32)                                                                    ,               --红包池外键
        hbllfk			        varchar2(32)                                                                    ,               --红包利率外键
	hbjj 				number(18,2)									,		--红包基金
	zhstatus	 		varchar2(32)									,		--账户状态
	crje 		                number(18,2)							                ,		--存入金额
	zhye 				number(18,2)									,		--账户余额
	syje 				number(18,2)									,		--收益金额
	hbzcje 			        number(18,2)									,		--红包支出金额
	czrq 				varchar2(32)									 ,		--起始日期（提取红包基金）
	qxrq 				date									        ,		--起息日期
	dqrq 				varchar2(32)								        ,               --结束日期（提取红包基金）
	hblb 				varchar2(32)									,     --红包类别(主要用于定义普通红包和群红包)
        hbgs 				number(18)									,		--红包个数
        everyoneTotal                   number(18,2)                                                                    ,             	--单个金额
        hbb                             number(18)                                                                      ,               --红包币
	notes1 				varchar2(32)									,		--备用字段
	notes2 				varchar2(32)									,		--备用字段
	notes3                          varchar2(32)                                                                                    --备用字段                                                   
	
);

//红包池
create table paihongbao.hbdx_hbc(
	hbcID			        varchar2(32) default (sys_guid()) primary key	                                ,	      --收益对象代号-主键	
        
	hbnumber                        number(18)                                                                      ,             --红包个数
        aggreate                        number(18,2)                                                                        ,	      --红包总额	
	hblb 				varchar2(32)									,	      --红包类别（0-普通红包 1-群红包）	
        
	notes1 				varchar2(32)									,	      --备用字段
	notes2 				varchar2(32)									,	      --备用字段
	notes3 				varchar2(32)									,	      --备用字段
	notes4                          varchar2(32)                                                                                                                                  
	
);


//红包收益明细
create table paihongbao.hbdx_symx(
	symxdxdh		        varchar2(32) default (sys_guid()) primary key	                                ,	      -- 收益明细对象代号：主键	
        yhdxdhfk                        varchar2(32)                                                                    ,             --用户对象代号外键
        llbhfk                          varchar2(32)                                                                    ,             --利率编号外键
	qsrq 			        varchar2(45)								        ,	      --起始日期			
	jsrq				varchar2(45)									,	      --结束日期
        syje 				number(18,2)                                                                    ,             --收益金额
	syll				number(18,2)									,	      --收益利率
        withdrawal                      number(18,2)                                                                    ，            --收益总额
        redcoins                        number(18,2)                                                                    ，            --红包币
        entrypoins                      number(18,2)                                                                    ，            --报单积分
        hbjjze                          number(18,2)                                                                    ,             --红包基金总额
        ketimoney                       number(18,2)                                                                    ,             --可提现金额
       
	notes1 				varchar2(32)									,	      --备用字段
	notes2 				varchar2(32)									,	      --备用字段
	notes3                          number(32)                                                                                                                                              
	
);

//红包用户
alter table hbdx_user add foreign key (dldxbhfk) references yhdx_dl(dldxbh);
create table paihongbao.hbdx_user(
	yhdxdh		        varchar2(32) default (sys_guid()) primary key	                                        ,               --用户代号 :主键	
        parentID                        varchar2(32)                                                                    ,               --父级ID
        dldxbhfk                        varchar2(32)                                                                    ,               --代理用户外键
        sydxdhfk                        varchar2(32)                                                                    ,               --用户收益对象外键
        hbllfk			        varchar2(32)                                                                    ,               --红包利率外键
	yhsf 			        varchar2(32)									,	        --用户身份			
	hbgs 				number(18)									,		--红包个数
        everyoneTotal                   number(18,2)                                                                    ,             	--单个金额
	aggreatMount                    number(18,2)                                                                    ,	        --红包总额
        HBB                             number(18,2)                                                                    ,               --红包币
        yhjb 				varchar2(32)                                                                    ,               --用户级别
	crje				varchar2(32)									,               --存入金额
        userphnoe                       varchar2(32)                                                                    ,               --电话
        email                           varchar2(32)                                                                    ,               --邮箱地址
        status                          varchar2(32)                                                                    ,               --状态
        userjhm                         varchar2(32)                                                                    ,               --激活码
        username                        varchar2(32)                                                                    ,               --用户名
        password                        varchar2(32)                                                                    ,               --密码
        tgslj				varchar2(32)									,	        --推广式链接
        usernum                         number(18)                                                                      ,               --用户编号（用于判断几级用户）
        times                           number(10)                                                                      ,               --抢红包次数
	notes1 				varchar2(32)									,		--备用字段
	notes2 				varchar2(32)									,		--备用字段
	notes3                          varchar2(32)                                                                                                                                  	
);

//用户代理
create table paihongbao.yhdx_dl(
	dldxbh		                varchar2(32)  primary key not null	                                	,	       --代理对象编号：主键
        dljhm                           varchar2(32)                                                                    ,	       --激活码
        tgslj				varchar2(32)									,	       --推广式链接
        statues                         varchar2(32)                                                                    ,              --状态（0-未激活  1-已经激活）
        
	notes1 				varchar2(32)									,	        --备用字段
	notes2 				varchar2(32)									,		--备用字段
	notes3                          varchar2(32)                                                                                                                                  
	
);

//参数表——利率
create table paihongbao.csb_ll(
	llbh		                varchar2(32) default (sys_guid()) primary key	                                ,	        --利率编号 ：主键    
        llfl 			        varchar2(32)									,	        --利率分类
        szrq 				date									        ,               --设置日期
        llbl                            number(18,2)                                                                    ,               --利率比例
        activate                        number(10) not null                                                             ,               --是否启用
        usernum                         number(18)                                                                      ,               --发展人数
        status                          number(10) not null                                                             ,               --状态
        ztms 				varchar2(32)									,		--状态描述

	notes1 				varchar2(32)									,		--备用字段
	notes2 				varchar2(32)									,		--备用字段
	notes3                          varchar2(32)                                                                                                                                  
	
);
//参数表--用户
create table paihongbao.csb_yh(
	yhbh		                varchar2(32) default (sys_guid()) primary key	                                ,               --用户编号：主键	     
        yhjb 			        varchar2(32)									,	        --用户级别
        tcbl                            number(18,2)                                                                    ,               --提成比例
        fzrs                            number(18)                                                                      ,               --发展人数
        status                          number(10) not null                                                             ,               --状态
	ztms 				varchar2(32)									,		--状态描述

	notes1 				varchar2(32)									,		--备用字段
	notes2                          varchar2(32)                                                                                                                                  
	
);
