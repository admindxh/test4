package bingo.modules.securityConsole.employee;

import java.util.HashMap;
import java.util.Map;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.common.Constants;
/**
 * 员工管理控制类
 * @author Administrator
 *
 */
@Controller
public class EmployeeController {
	
	private EmployeeService employeeService;

    
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	/**
	 * 进入用户基本信息页面
	 * 
	 * @param userid
	 */
	/*public void editEmp(String empno) {
		Map<String, Object> secEmp = new HashMap<String, Object>();
		if (StringUtils.isNotEmpty(empno)) {
			secEmp = this.employeeService.getEmpById(empno);
		} else {
			
			secEmp.put("empno", empno);
			
		}

		Result.setAttribute("employee", secEmp);
		Result.forward("/modules/emp/edit_sec_emp.jsp");
	}*/
	
//	/**
//	 * 新增员工信息
//	 * 
//	 */
	public void createEmp(){
		Result.setAttribute("title", "新增员工信息");
		Result.forward("/modules/emp/edit_sec_emp_save.jsp");
	
	}
	/**
	 * 修改员工信息
	 * @param empno
	 */
	public void editEmp(String empno) {
		Result.setAttribute("title", "修改员工信息");
//		Emp e = new Emp();
//		e.setComm(1232.12);
		Result.setAttribute("employee",employeeService.getEmpById(empno));
		Result.forward("/modules/emp/edit_sec_emp.jsp");
	}
	
	public void selectEmp(String empno){
		Result.setAttribute("employee", employeeService.getEmpById(empno));
		Result.forward("/modules/emp/edit_sec_emp_look.jsp");
	}

}
