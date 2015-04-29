/*
 *���������������ƣ���ΰ
 *��� �������
 *author yangwei
 *version��v1.0
 *date:2014��10��16��9:50:01
*/
drop table paihongbao.hbdx_hb;
alter table hbdx_hb add (hbllfk varchar2(32));
create table paihongbao.hbdx_hb(
	hbdxdh			        varchar2(32) default (sys_guid()) primary key	                                ,		--���������ţ� id ����
        hbbdxdhfk 			varchar2(32)									,		--����Ҷ������ ���
	yhdhfk 			        varchar2(32)									,		--�û��������
        hbcfk                           varchar2(32)                                                                    ,               --��������
        hbllfk			        varchar2(32)                                                                    ,               --����������
	hbjj 				number(18,2)									,		--�������
	zhstatus	 		varchar2(32)									,		--�˻�״̬
	crje 		                number(18,2)							                ,		--������
	zhye 				number(18,2)									,		--�˻����
	syje 				number(18,2)									,		--������
	hbzcje 			        number(18,2)									,		--���֧�����
	czrq 				varchar2(32)									 ,		--��ʼ���ڣ���ȡ�������
	qxrq 				date									        ,		--��Ϣ����
	dqrq 				varchar2(32)								        ,               --�������ڣ���ȡ�������
	hblb 				varchar2(32)									,     --������(��Ҫ���ڶ�����ͨ�����Ⱥ���)
        hbgs 				number(18)									,		--�������
        everyoneTotal                   number(18,2)                                                                    ,             	--�������
        hbb                             number(18)                                                                      ,               --�����
	notes1 				varchar2(32)									,		--�����ֶ�
	notes2 				varchar2(32)									,		--�����ֶ�
	notes3                          varchar2(32)                                                                                    --�����ֶ�                                                   
	
);

//�����
create table paihongbao.hbdx_hbc(
	hbcID			        varchar2(32) default (sys_guid()) primary key	                                ,	      --����������-����	
        
	hbnumber                        number(18)                                                                      ,             --�������
        aggreate                        number(18,2)                                                                        ,	      --����ܶ�	
	hblb 				varchar2(32)									,	      --������0-��ͨ��� 1-Ⱥ�����	
        
	notes1 				varchar2(32)									,	      --�����ֶ�
	notes2 				varchar2(32)									,	      --�����ֶ�
	notes3 				varchar2(32)									,	      --�����ֶ�
	notes4                          varchar2(32)                                                                                                                                  
	
);


//���������ϸ
create table paihongbao.hbdx_symx(
	symxdxdh		        varchar2(32) default (sys_guid()) primary key	                                ,	      -- ������ϸ������ţ�����	
        yhdxdhfk                        varchar2(32)                                                                    ,             --�û�����������
        llbhfk                          varchar2(32)                                                                    ,             --���ʱ�����
	qsrq 			        varchar2(45)								        ,	      --��ʼ����			
	jsrq				varchar2(45)									,	      --��������
        syje 				number(18,2)                                                                    ,             --������
	syll				number(18,2)									,	      --��������
        withdrawal                      number(18,2)                                                                    ��            --�����ܶ�
        redcoins                        number(18,2)                                                                    ��            --�����
        entrypoins                      number(18,2)                                                                    ��            --��������
        hbjjze                          number(18,2)                                                                    ,             --��������ܶ�
        ketimoney                       number(18,2)                                                                    ,             --�����ֽ��
       
	notes1 				varchar2(32)									,	      --�����ֶ�
	notes2 				varchar2(32)									,	      --�����ֶ�
	notes3                          number(32)                                                                                                                                              
	
);

//����û�
alter table hbdx_user add foreign key (dldxbhfk) references yhdx_dl(dldxbh);
create table paihongbao.hbdx_user(
	yhdxdh		        varchar2(32) default (sys_guid()) primary key	                                        ,               --�û����� :����	
        parentID                        varchar2(32)                                                                    ,               --����ID
        dldxbhfk                        varchar2(32)                                                                    ,               --�����û����
        sydxdhfk                        varchar2(32)                                                                    ,               --�û�����������
        hbllfk			        varchar2(32)                                                                    ,               --����������
	yhsf 			        varchar2(32)									,	        --�û����			
	hbgs 				number(18)									,		--�������
        everyoneTotal                   number(18,2)                                                                    ,             	--�������
	aggreatMount                    number(18,2)                                                                    ,	        --����ܶ�
        HBB                             number(18,2)                                                                    ,               --�����
        yhjb 				varchar2(32)                                                                    ,               --�û�����
	crje				varchar2(32)									,               --������
        userphnoe                       varchar2(32)                                                                    ,               --�绰
        email                           varchar2(32)                                                                    ,               --�����ַ
        status                          varchar2(32)                                                                    ,               --״̬
        userjhm                         varchar2(32)                                                                    ,               --������
        username                        varchar2(32)                                                                    ,               --�û���
        password                        varchar2(32)                                                                    ,               --����
        tgslj				varchar2(32)									,	        --�ƹ�ʽ����
        usernum                         number(18)                                                                      ,               --�û���ţ������жϼ����û���
        times                           number(10)                                                                      ,               --���������
	notes1 				varchar2(32)									,		--�����ֶ�
	notes2 				varchar2(32)									,		--�����ֶ�
	notes3                          varchar2(32)                                                                                                                                  	
);

//�û�����
create table paihongbao.yhdx_dl(
	dldxbh		                varchar2(32)  primary key not null	                                	,	       --��������ţ�����
        dljhm                           varchar2(32)                                                                    ,	       --������
        tgslj				varchar2(32)									,	       --�ƹ�ʽ����
        statues                         varchar2(32)                                                                    ,              --״̬��0-δ����  1-�Ѿ����
        
	notes1 				varchar2(32)									,	        --�����ֶ�
	notes2 				varchar2(32)									,		--�����ֶ�
	notes3                          varchar2(32)                                                                                                                                  
	
);

//������������
create table paihongbao.csb_ll(
	llbh		                varchar2(32) default (sys_guid()) primary key	                                ,	        --���ʱ�� ������    
        llfl 			        varchar2(32)									,	        --���ʷ���
        szrq 				date									        ,               --��������
        llbl                            number(18,2)                                                                    ,               --���ʱ���
        activate                        number(10) not null                                                             ,               --�Ƿ�����
        usernum                         number(18)                                                                      ,               --��չ����
        status                          number(10) not null                                                             ,               --״̬
        ztms 				varchar2(32)									,		--״̬����

	notes1 				varchar2(32)									,		--�����ֶ�
	notes2 				varchar2(32)									,		--�����ֶ�
	notes3                          varchar2(32)                                                                                                                                  
	
);
//������--�û�
create table paihongbao.csb_yh(
	yhbh		                varchar2(32) default (sys_guid()) primary key	                                ,               --�û���ţ�����	     
        yhjb 			        varchar2(32)									,	        --�û�����
        tcbl                            number(18,2)                                                                    ,               --��ɱ���
        fzrs                            number(18)                                                                      ,               --��չ����
        status                          number(10) not null                                                             ,               --״̬
	ztms 				varchar2(32)									,		--״̬����

	notes1 				varchar2(32)									,		--�����ֶ�
	notes2                          varchar2(32)                                                                                                                                  
	
);
