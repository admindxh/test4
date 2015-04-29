package bingo.modules.securityConsole.organization;

import bingo.dao.ext.BaseObject;

@SuppressWarnings("serial")
public class SecOrganization extends BaseObject {

	/**
	 * 组织标识
	 */
	private String id;

	private String path;

	/**
	 * 状态
	 */
	private String status = "enabled";
	/**
	 * 层级
	 */
	private Long level;
	/**
	 * 顺序
	 */
	private Long order;
	/**
	 * 类型（公司、子公司、部门、科室等）
	 */
	private Long type;
	/**
	 * 父组织标识
	 */
	private String parent;

	/**
	 * 名称
	 */
	private String name;
	/**
	 * 编码
	 */
	private String code;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getLevel() {
		return this.level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public Long getOrder() {
		return this.order;
	}

	public void setOrder(Long order) {
		this.order = order;
	}

	public Long getType() {
		return this.type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getParent() {
		return this.parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return this.code;
	}

	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * @param path
	 *            the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}

	public void setCode(String code) {
		this.code = code;
	}
}