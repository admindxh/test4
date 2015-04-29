/**
 * This file created at 2010-12-30.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.function;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

/**
 * <code>{@link FunctionController}</code>
 *
 * @author User
 */
@Controller
public class FunctionController {
	private FunctionService functionService;

	/**
	 * @return the functionService
	 */
	public FunctionService getFunctionService() {
		return functionService;
	}

	/**
	 * @param functionService the functionService to set
	 */
	public void setFunctionService(FunctionService functionService) {
		this.functionService = functionService;
	}

	public void editModule(String moduleId) {
		Result.setAttribute("module", functionService.getFunction(moduleId));
		Result.forward("/modules/function/module/edit_sec_module.jsp?id=" + moduleId);
	}

	public void editFunction(String functionId, String parentName) {
		Result.setAttribute("function", functionService.getFunction(functionId));
		Result.forward("/modules/function/function/edit_sec_function.jsp?id=" + functionId + "&parentName=" + parentName);
	}

	public void editOperation(String operationId, String parentName) {
		Result.setAttribute("operation", functionService.getFunction(operationId));
		Result.forward("/modules/function/operation/edit_sec_operation.jsp?id=" + operationId + "&parentName=" + parentName);
	}
	
	public void editRule(String ruleId, String parentName) {
		Result.setAttribute("rule", functionService.getRule(ruleId));
		Result.forward("/modules/function/rule/edit_sec_rule.jsp?id=" + ruleId + "&parentName=" + parentName);
	}
}
