package bingo.modules.securityConsole.employee;

import java.util.Map;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.profile.SysProfileParameter;
@Service
public class EmployeeService extends BaseService{
	
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
	 * 功能：根据id查询员工对象
	 * @return 
	 */
	public Emp getEmpById(String empno) {
		Emp emp=dao.select(Emp.class, empno);
	    return emp;
	}

	
	/**
	 * 功能：添加员工对象信息
	 */
	public void saveOrUpdateEmployee(Emp emp) {
		if (StringUtils.isNotEmpty(emp.getEmpno())) {
			dao.update(emp);
		} else {
			dao.insert(emp);
		}
	}
	
    public void saveEmployee(Emp emp){
    	dao.insert(emp);
    }
	/**
	 * 功能：根据id删除员工信息
	 */
	public void deleteEmpUser(String empno) {
		
		dao.delete(Emp.class,empno);
		//secLogService.logAuth("删除企业员工", "删除ID为(" + empno + ")的员工(" + ename + ")");
	}
	public void deleteEmpUsers(String[] empnos) {
		for (String empno : empnos) {
			deleteEmpUser(empno);
		}
	}
	public void updateEmp(String ename){
		dao.update(ename);
		
		
	}
}
