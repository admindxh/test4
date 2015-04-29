package bingo.modules.securityConsole.organization;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

@Controller
public class OrganizationController {
	private OrganizationService organizationService;

	public void setOrganizationService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	public void editOrganization(String orgId, String parentName) {
		SecOrganization organization = organizationService.findById(orgId);
		Result.setAttribute("org", organization);
		Result.forward("/modules/organization/edit_sec_organization.jsp?parentName" + parentName);
	}
}