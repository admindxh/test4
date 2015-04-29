package bingo.modules.securityConsole.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Trigger;

import org.springframework.scheduling.quartz.QuartzJobBean;

import bingo.dao.Dao;
import bingo.modules.securityConsole.symx.ExchangehbbService;

public class TestQuartzJob extends QuartzJobBean{

	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext)
			throws JobExecutionException {
		// TODO Auto-generated method stub
		Trigger trigger = jobExecutionContext.getTrigger();  
        String triggerName = trigger.getName();       
        System.out.println("MyQuartzJobBean"+triggerName); 
       /* ExchangehbbService service=new ExchangehbbService();
        service.getupdatejsrq();*/
	}

}
