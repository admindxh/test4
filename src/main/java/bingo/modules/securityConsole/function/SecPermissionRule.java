package bingo.modules.securityConsole.function;

import bingo.dao.ext.BaseObject;
import bingo.dao.orm.annotations.UUID;

@SuppressWarnings("serial")
public class SecPermissionRule extends BaseObject {
	/** 
	 * 规则标识 
	 */
	@UUID
	private String id;

	/** 
	 * 优先级 
	 */
	private Long priority = 99L;
	/** 
	 * 行为 
	 */
	private String behaviour;
	/** 
	 * 操作标识 
	 */
	private String operationId;
	/** 
	 * 名称 
	 */
	private String name;
	/** 
	 * 规则 
	 */
	private String rule;
	/** 
	 * 描述 
	 */
	private String description;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getPriority() {
		return this.priority;
	}

	public void setPriority(Long priority) {
		this.priority = priority;
	}

	public String getBehaviour() {
		return this.behaviour;
	}

	public void setBehaviour(String behaviour) {
		this.behaviour = behaviour;
	}

	public String getOperationId() {
		return this.operationId;
	}

	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRule() {
		return this.rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}