package bingo.modules.securityConsole.function;

import bingo.dao.ext.BaseObject;

@SuppressWarnings("serial")
public class SecPermission extends BaseObject {

	/**
	 * 操作标识
	 */
	private String id;

	private String path;
	
	private String context;

	/**
	 * 模块、页面或者元素
	 */
	private String type = "Page";
	/**
	 * 页面元素默认行为
	 */
	private String elementbehaviour;
	/**
	 * 父操作标识
	 */
	private String parent;

	/**
	 * 操作代码
	 */
	private String code;
	/**
	 * 受控页面元素的ID
	 */
	private String elementid;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * Page对应的URL，或者页面元素所在的URL
	 */
	private String url;
	/**
	 * 描述
	 */
	private String description;

	/**
	 * 显示顺序
	 */
	private int order;

	/**
	 * @return the order
	 */
	public int getOrder() {
		return order;
	}

	/**
	 * @param order
	 *            the order to set
	 */
	public void setOrder(int order) {
		this.order = order;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getElementbehaviour() {
		return this.elementbehaviour;
	}

	public void setElementbehaviour(String elementbehaviour) {
		this.elementbehaviour = elementbehaviour;
	}

	public String getParent() {
		return this.parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getElementid() {
		return this.elementid;
	}

	public void setElementid(String elementid) {
		this.elementid = elementid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	/**
	 * @return the context
	 */
	public String getContext() {
		return context;
	}

	/**
	 * @param context the context to set
	 */
	public void setContext(String context) {
		this.context = context;
	}
}