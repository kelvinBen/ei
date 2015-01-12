/*
 * @(#)ZtestitemView.java 
 *
 * Copyright (C) 2002-2008 The Dihua Software Foundation. All rights reserved.
 *
 * 程序生成时间：[Fri Jul 23 15:56:29 CST 2010] 生成
 */

package net.mast.demo.ztest.view;

//导入 java 类
import java.io.Serializable;

/**
 * 功能:本类测试行项目数据显示view类
 *
 * @author  sp
 * @date    [Fri Jul 23 15:56:29 CST 2010]
 *
 * $Id$
 */
@SuppressWarnings({ "serial", "unused" })
public class ZtestitemView implements Serializable {

	private String sign;//只读/可编辑标记

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	/** 
	* 域 主键
	*/
	private String t$ZTESTITEM$CODENUM;

	/** 
	* 域 是否被锁定
	*/
	private String t$ZTESTITEM$ISLOCKSTATUSSYS;

	/** 
	* 域 当前用户
	*/
	private String t$ZTESTITEM$CURRENTUSERSYS;

	/** 
	* 域 当前角色
	*/
	private String t$ZTESTITEM$CURRENTROLESYS;

	/** 
	* 域 用户组
	*/
	private String t$ZTESTITEM$CURRENTUSERGORUPSYS;

	/** 
	* 域 当前部门
	*/
	private String t$ZTESTITEM$CURRENTDEPARTMENTSYS;

	/** 
	* 域 是否启用回收站
	*/
	private String t$ZTESTITEM$ISSTARTRECYCLE;

	/** 
	* 域 共享角色
	*/
	private String t$ZTESTITEM$SHAREROLESYS;

	/** 
	* 域 共享用户
	*/
	private String t$ZTESTITEM$SHAREUSERSYS;

	/** 
	* 域 共享部门
	*/
	private String t$ZTESTITEM$SHAREDEPARTMENTSYS;

	/** 
	* 域 共享用户组
	*/
	private String t$ZTESTITEM$SHAREUSERGROUP;

	/** 
	* 域 销售组织
	*/
	private String t$ZTESTITEM$SALES_ORG;

	/** 
	* 域 分销渠道
	*/
	private String t$ZTESTITEM$DISTR_CHAN;

	/** 
	* 域 产品组
	*/
	private String t$ZTESTITEM$DIVISION;

	/** 
	* 域 销售部门（销售办公室）
	*/
	private String t$ZTESTITEM$SALES_OFFICE;

	/** 
	* 域 销售组
	*/
	private String t$ZTESTITEM$SALES_GROUP;

	/** 
	* 域 销售地区
	*/
	private String t$ZTESTITEM$SALES_AREA;

	/** 
	* 域 逻辑删除标识
	*/
	private String t$ZTESTITEM$IS_DELETESYS;

	/** 
	* 域 逻辑删除恢复时间
	*/
	private String t$ZTESTITEM$UPDATE_DATESYS;

	/** 
	* 域 行项目
	*/
	private String t$ZTESTITEM$PO_ITEM;

	/** 
	* 域 值
	*/
	private String t$ZTESTITEM$VALUE;

	/** 
	* 域 表头编号
	*/
	private String t$ZTESTITEM$HCODENUM;

	/**
	* Ztestitem构造函数
	*/
	public ZtestitemView() {
		super();
	}

	/**
	* 是否删除标志
	*/
	private int isDelete;

	/**
	* 属性 T$ZTESTITEM$CODENUM 的get方法
	* @return String T$ZTESTITEM$CODENUM
	*/
	public String getT$ZTESTITEM$CODENUM() {
		return t$ZTESTITEM$CODENUM == null ? "" : t$ZTESTITEM$CODENUM;
	}

	/**
	* 属性 T$ZTESTITEM$CODENUM 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$CODENUM(String t$ZTESTITEM$CODENUM) {
		this.t$ZTESTITEM$CODENUM = t$ZTESTITEM$CODENUM;
	}

	/**
	* 属性 T$ZTESTITEM$ISLOCKSTATUSSYS 的get方法
	* @return String T$ZTESTITEM$ISLOCKSTATUSSYS
	*/
	public String getT$ZTESTITEM$ISLOCKSTATUSSYS() {
		return t$ZTESTITEM$ISLOCKSTATUSSYS == null ? "" : t$ZTESTITEM$ISLOCKSTATUSSYS;
	}

	/**
	* 属性 T$ZTESTITEM$ISLOCKSTATUSSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$ISLOCKSTATUSSYS(String t$ZTESTITEM$ISLOCKSTATUSSYS) {
		this.t$ZTESTITEM$ISLOCKSTATUSSYS = t$ZTESTITEM$ISLOCKSTATUSSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERSYS 的get方法
	* @return String T$ZTESTITEM$CURRENTUSERSYS
	*/
	public String getT$ZTESTITEM$CURRENTUSERSYS() {
		return t$ZTESTITEM$CURRENTUSERSYS == null ? "" : t$ZTESTITEM$CURRENTUSERSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTUSERSYS(String t$ZTESTITEM$CURRENTUSERSYS) {
		this.t$ZTESTITEM$CURRENTUSERSYS = t$ZTESTITEM$CURRENTUSERSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTROLESYS 的get方法
	* @return String T$ZTESTITEM$CURRENTROLESYS
	*/
	public String getT$ZTESTITEM$CURRENTROLESYS() {
		return t$ZTESTITEM$CURRENTROLESYS == null ? "" : t$ZTESTITEM$CURRENTROLESYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTROLESYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTROLESYS(String t$ZTESTITEM$CURRENTROLESYS) {
		this.t$ZTESTITEM$CURRENTROLESYS = t$ZTESTITEM$CURRENTROLESYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERGORUPSYS 的get方法
	* @return String T$ZTESTITEM$CURRENTUSERGORUPSYS
	*/
	public String getT$ZTESTITEM$CURRENTUSERGORUPSYS() {
		return t$ZTESTITEM$CURRENTUSERGORUPSYS == null ? "" : t$ZTESTITEM$CURRENTUSERGORUPSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTUSERGORUPSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTUSERGORUPSYS(String t$ZTESTITEM$CURRENTUSERGORUPSYS) {
		this.t$ZTESTITEM$CURRENTUSERGORUPSYS = t$ZTESTITEM$CURRENTUSERGORUPSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTDEPARTMENTSYS 的get方法
	* @return String T$ZTESTITEM$CURRENTDEPARTMENTSYS
	*/
	public String getT$ZTESTITEM$CURRENTDEPARTMENTSYS() {
		return t$ZTESTITEM$CURRENTDEPARTMENTSYS == null ? "" : t$ZTESTITEM$CURRENTDEPARTMENTSYS;
	}

	/**
	* 属性 T$ZTESTITEM$CURRENTDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$CURRENTDEPARTMENTSYS(String t$ZTESTITEM$CURRENTDEPARTMENTSYS) {
		this.t$ZTESTITEM$CURRENTDEPARTMENTSYS = t$ZTESTITEM$CURRENTDEPARTMENTSYS;
	}

	/**
	* 属性 T$ZTESTITEM$ISSTARTRECYCLE 的get方法
	* @return String T$ZTESTITEM$ISSTARTRECYCLE
	*/
	public String getT$ZTESTITEM$ISSTARTRECYCLE() {
		return t$ZTESTITEM$ISSTARTRECYCLE == null ? "" : t$ZTESTITEM$ISSTARTRECYCLE;
	}

	/**
	* 属性 T$ZTESTITEM$ISSTARTRECYCLE 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$ISSTARTRECYCLE(String t$ZTESTITEM$ISSTARTRECYCLE) {
		this.t$ZTESTITEM$ISSTARTRECYCLE = t$ZTESTITEM$ISSTARTRECYCLE;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREROLESYS 的get方法
	* @return String T$ZTESTITEM$SHAREROLESYS
	*/
	public String getT$ZTESTITEM$SHAREROLESYS() {
		return t$ZTESTITEM$SHAREROLESYS == null ? "" : t$ZTESTITEM$SHAREROLESYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREROLESYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREROLESYS(String t$ZTESTITEM$SHAREROLESYS) {
		this.t$ZTESTITEM$SHAREROLESYS = t$ZTESTITEM$SHAREROLESYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERSYS 的get方法
	* @return String T$ZTESTITEM$SHAREUSERSYS
	*/
	public String getT$ZTESTITEM$SHAREUSERSYS() {
		return t$ZTESTITEM$SHAREUSERSYS == null ? "" : t$ZTESTITEM$SHAREUSERSYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREUSERSYS(String t$ZTESTITEM$SHAREUSERSYS) {
		this.t$ZTESTITEM$SHAREUSERSYS = t$ZTESTITEM$SHAREUSERSYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREDEPARTMENTSYS 的get方法
	* @return String T$ZTESTITEM$SHAREDEPARTMENTSYS
	*/
	public String getT$ZTESTITEM$SHAREDEPARTMENTSYS() {
		return t$ZTESTITEM$SHAREDEPARTMENTSYS == null ? "" : t$ZTESTITEM$SHAREDEPARTMENTSYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREDEPARTMENTSYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREDEPARTMENTSYS(String t$ZTESTITEM$SHAREDEPARTMENTSYS) {
		this.t$ZTESTITEM$SHAREDEPARTMENTSYS = t$ZTESTITEM$SHAREDEPARTMENTSYS;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERGROUP 的get方法
	* @return String T$ZTESTITEM$SHAREUSERGROUP
	*/
	public String getT$ZTESTITEM$SHAREUSERGROUP() {
		return t$ZTESTITEM$SHAREUSERGROUP == null ? "" : t$ZTESTITEM$SHAREUSERGROUP;
	}

	/**
	* 属性 T$ZTESTITEM$SHAREUSERGROUP 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SHAREUSERGROUP(String t$ZTESTITEM$SHAREUSERGROUP) {
		this.t$ZTESTITEM$SHAREUSERGROUP = t$ZTESTITEM$SHAREUSERGROUP;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_ORG 的get方法
	* @return String T$ZTESTITEM$SALES_ORG
	*/
	public String getT$ZTESTITEM$SALES_ORG() {
		return t$ZTESTITEM$SALES_ORG == null ? "" : t$ZTESTITEM$SALES_ORG;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_ORG 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_ORG(String t$ZTESTITEM$SALES_ORG) {
		this.t$ZTESTITEM$SALES_ORG = t$ZTESTITEM$SALES_ORG;
	}

	/**
	* 属性 T$ZTESTITEM$DISTR_CHAN 的get方法
	* @return String T$ZTESTITEM$DISTR_CHAN
	*/
	public String getT$ZTESTITEM$DISTR_CHAN() {
		return t$ZTESTITEM$DISTR_CHAN == null ? "" : t$ZTESTITEM$DISTR_CHAN;
	}

	/**
	* 属性 T$ZTESTITEM$DISTR_CHAN 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$DISTR_CHAN(String t$ZTESTITEM$DISTR_CHAN) {
		this.t$ZTESTITEM$DISTR_CHAN = t$ZTESTITEM$DISTR_CHAN;
	}

	/**
	* 属性 T$ZTESTITEM$DIVISION 的get方法
	* @return String T$ZTESTITEM$DIVISION
	*/
	public String getT$ZTESTITEM$DIVISION() {
		return t$ZTESTITEM$DIVISION == null ? "" : t$ZTESTITEM$DIVISION;
	}

	/**
	* 属性 T$ZTESTITEM$DIVISION 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$DIVISION(String t$ZTESTITEM$DIVISION) {
		this.t$ZTESTITEM$DIVISION = t$ZTESTITEM$DIVISION;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_OFFICE 的get方法
	* @return String T$ZTESTITEM$SALES_OFFICE
	*/
	public String getT$ZTESTITEM$SALES_OFFICE() {
		return t$ZTESTITEM$SALES_OFFICE == null ? "" : t$ZTESTITEM$SALES_OFFICE;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_OFFICE 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_OFFICE(String t$ZTESTITEM$SALES_OFFICE) {
		this.t$ZTESTITEM$SALES_OFFICE = t$ZTESTITEM$SALES_OFFICE;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_GROUP 的get方法
	* @return String T$ZTESTITEM$SALES_GROUP
	*/
	public String getT$ZTESTITEM$SALES_GROUP() {
		return t$ZTESTITEM$SALES_GROUP == null ? "" : t$ZTESTITEM$SALES_GROUP;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_GROUP 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_GROUP(String t$ZTESTITEM$SALES_GROUP) {
		this.t$ZTESTITEM$SALES_GROUP = t$ZTESTITEM$SALES_GROUP;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_AREA 的get方法
	* @return String T$ZTESTITEM$SALES_AREA
	*/
	public String getT$ZTESTITEM$SALES_AREA() {
		return t$ZTESTITEM$SALES_AREA == null ? "" : t$ZTESTITEM$SALES_AREA;
	}

	/**
	* 属性 T$ZTESTITEM$SALES_AREA 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$SALES_AREA(String t$ZTESTITEM$SALES_AREA) {
		this.t$ZTESTITEM$SALES_AREA = t$ZTESTITEM$SALES_AREA;
	}

	/**
	* 属性 T$ZTESTITEM$IS_DELETESYS 的get方法
	* @return String T$ZTESTITEM$IS_DELETESYS
	*/
	public String getT$ZTESTITEM$IS_DELETESYS() {
		return t$ZTESTITEM$IS_DELETESYS == null ? "" : t$ZTESTITEM$IS_DELETESYS;
	}

	/**
	* 属性 T$ZTESTITEM$IS_DELETESYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$IS_DELETESYS(String t$ZTESTITEM$IS_DELETESYS) {
		this.t$ZTESTITEM$IS_DELETESYS = t$ZTESTITEM$IS_DELETESYS;
	}

	/**
	* 属性 T$ZTESTITEM$UPDATE_DATESYS 的get方法
	* @return String T$ZTESTITEM$UPDATE_DATESYS
	*/
	public String getT$ZTESTITEM$UPDATE_DATESYS() {
		return t$ZTESTITEM$UPDATE_DATESYS == null ? "" : t$ZTESTITEM$UPDATE_DATESYS;
	}

	/**
	* 属性 T$ZTESTITEM$UPDATE_DATESYS 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$UPDATE_DATESYS(String t$ZTESTITEM$UPDATE_DATESYS) {
		this.t$ZTESTITEM$UPDATE_DATESYS = t$ZTESTITEM$UPDATE_DATESYS;
	}

	/**
	* 属性 T$ZTESTITEM$PO_ITEM 的get方法
	* @return String T$ZTESTITEM$PO_ITEM
	*/
	public String getT$ZTESTITEM$PO_ITEM() {
		return t$ZTESTITEM$PO_ITEM == null ? "" : t$ZTESTITEM$PO_ITEM;
	}

	/**
	* 属性 T$ZTESTITEM$PO_ITEM 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$PO_ITEM(String t$ZTESTITEM$PO_ITEM) {
		this.t$ZTESTITEM$PO_ITEM = t$ZTESTITEM$PO_ITEM;
	}

	/**
	* 属性 T$ZTESTITEM$VALUE 的get方法
	* @return String T$ZTESTITEM$VALUE
	*/
	public String getT$ZTESTITEM$VALUE() {
		return t$ZTESTITEM$VALUE == null ? "" : t$ZTESTITEM$VALUE;
	}

	/**
	* 属性 T$ZTESTITEM$VALUE 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$VALUE(String t$ZTESTITEM$VALUE) {
		this.t$ZTESTITEM$VALUE = t$ZTESTITEM$VALUE;
	}

	/**
	* 属性 T$ZTESTITEM$HCODENUM 的get方法
	* @return String T$ZTESTITEM$HCODENUM
	*/
	public String getT$ZTESTITEM$HCODENUM() {
		return t$ZTESTITEM$HCODENUM == null ? "" : t$ZTESTITEM$HCODENUM;
	}

	/**
	* 属性 T$ZTESTITEM$HCODENUM 的set方法
	* @return void
	*/
	public void setT$ZTESTITEM$HCODENUM(String t$ZTESTITEM$HCODENUM) {
		this.t$ZTESTITEM$HCODENUM = t$ZTESTITEM$HCODENUM;
	}

	/**
	* 是否删除标志的 set 方法
	*/
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public int getIsDelete() {
		return this.isDelete;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(" [ t$ZTESTITEM$CODENUM=" + getT$ZTESTITEM$CODENUM());
		sb.append(", t$ZTESTITEM$ISLOCKSTATUSSYS=" + getT$ZTESTITEM$ISLOCKSTATUSSYS());
		sb.append(", t$ZTESTITEM$CURRENTUSERSYS=" + getT$ZTESTITEM$CURRENTUSERSYS());
		sb.append(", t$ZTESTITEM$CURRENTROLESYS=" + getT$ZTESTITEM$CURRENTROLESYS());
		sb.append(", t$ZTESTITEM$CURRENTUSERGORUPSYS=" + getT$ZTESTITEM$CURRENTUSERGORUPSYS());
		sb.append(", t$ZTESTITEM$CURRENTDEPARTMENTSYS=" + getT$ZTESTITEM$CURRENTDEPARTMENTSYS());
		sb.append(", t$ZTESTITEM$ISSTARTRECYCLE=" + getT$ZTESTITEM$ISSTARTRECYCLE());
		sb.append(", t$ZTESTITEM$SHAREROLESYS=" + getT$ZTESTITEM$SHAREROLESYS());
		sb.append(", t$ZTESTITEM$SHAREUSERSYS=" + getT$ZTESTITEM$SHAREUSERSYS());
		sb.append(", t$ZTESTITEM$SHAREDEPARTMENTSYS=" + getT$ZTESTITEM$SHAREDEPARTMENTSYS());
		sb.append(", t$ZTESTITEM$SHAREUSERGROUP=" + getT$ZTESTITEM$SHAREUSERGROUP());
		sb.append(", t$ZTESTITEM$SALES_ORG=" + getT$ZTESTITEM$SALES_ORG());
		sb.append(", t$ZTESTITEM$DISTR_CHAN=" + getT$ZTESTITEM$DISTR_CHAN());
		sb.append(", t$ZTESTITEM$DIVISION=" + getT$ZTESTITEM$DIVISION());
		sb.append(", t$ZTESTITEM$SALES_OFFICE=" + getT$ZTESTITEM$SALES_OFFICE());
		sb.append(", t$ZTESTITEM$SALES_GROUP=" + getT$ZTESTITEM$SALES_GROUP());
		sb.append(", t$ZTESTITEM$SALES_AREA=" + getT$ZTESTITEM$SALES_AREA());
		sb.append(", t$ZTESTITEM$IS_DELETESYS=" + getT$ZTESTITEM$IS_DELETESYS());
		sb.append(", t$ZTESTITEM$UPDATE_DATESYS=" + getT$ZTESTITEM$UPDATE_DATESYS());
		sb.append(", t$ZTESTITEM$PO_ITEM=" + getT$ZTESTITEM$PO_ITEM());
		sb.append(", t$ZTESTITEM$VALUE=" + getT$ZTESTITEM$VALUE());
		sb.append(", t$ZTESTITEM$HCODENUM=" + getT$ZTESTITEM$HCODENUM());
		sb.append("]");

		return sb.toString();
	}

	//取版本信息
	public static String getVERInfo() {
		return "$Date$,$Author$,$Revision$";
	}
}